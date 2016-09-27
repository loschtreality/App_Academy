require "sqlite3"
require "singleton"

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true

  end

end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map {|datum| Play.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} is already in the database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL

    @id = PlayDBConnection.instance.last_insert_row_id

  end

  def update
    raise "#{self} not in database" unless @id
     PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
     UPDATE
      plays
    SET
      title = ?, year = ?, playwright_id = ?
    WHERE
      id = ?

     SQL
  end

end


class Playwright

  attr_accessor :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map {|datum| Play.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.find_by_name(name)
    person = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    empty?(person)

    Playwright.new(person.first)
  end

  def self.find_by_title(title)
    title = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        playwrights
      WHERE
        title = ?
    SQL

    empty?(title)

  end

  def self.find_by_playwright(name)
    #returns all plays written by this person
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    empty?(playwright)

    Playwright.new(person.first)
  end

  def create
    raise "#{self} is already in the database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights(name,birth_year)
      VALUES
      (?, ?)

    SQL

    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def empty?(criteria)
    return nil unless criteria.length > 0
  end

  def update
    #updates the playwright
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @id, @name, @birth_year)
      UPDATE
      playwrights(name,birth_year)
      SET
      name = ?, birth_year = ?
      WHERE
      id = ?
    SQL
  end

  def get_plays
    #selects all plays
    plays = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    plays.map{|play| Play.new(play)}
  end

end
