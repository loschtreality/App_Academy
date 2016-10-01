require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
  query = DBConnection.execute2(<<-SQL)
  SELECT
    *
  FROM
    #{table_name}
  SQL

  @columns = query[0].map(&:to_sym)
  @columns
  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col}=") { |val| self.attributes[col] = val}
      define_method(col) { self.attributes[col] }
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || "cats"
  end

  def self.all
    # return @all if @all
    query = DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM
      #{table_name}
    SQL


    self.parse_all(query)
  end

  def self.parse_all(results)
    results.map do |obj|
      self.new(obj)
    end
  end

  def self.find(id)
    # self.all.find { |obj| obj.id == id }
    query = DBConnection.execute(<<-SQL, id)
    SELECT *
    FROM #{table_name}
    WHERE
      id = ?
    LIMIT 1
    SQL

    query.empty? ? nil : self.new(query.first)
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
      self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    cols = self.columns.join(',')
    questions = (['?'] * cols.length).join(' ')
    query = DBConnection.execute(<<-SQL)
      INSERT INTO
      #{table_name} (#{cols})
      VALUES
      #{questions}
    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
