require_relative "../req"
require_relative "questions"
require_relative "replies"


class Users
  attr_accessor :fname, :lname
  attr_reader :id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map{|datum| Users.new(datum)}
  end

  def self.find_by_first_name(fname)
    query = QuestionsDBConnection.instance.execute(<<-SQL, fname)
      SELECT
      *
      FROM
      users
      WHERE
      fname = ?
    SQL

    return nil unless query.length > 0

    Users.new(query.first)
  end

  def self.find_by_last_name(lname)
    query = QuestionsDBConnection.instance.execute(<<-SQL, lname)
      SELECT
      *
      FROM
      users
      WHERE
      lname = ?
    SQL

    return nil unless query.length > 0

    Users.new(query.first)
  end

  def self.find_by_user_id(id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
      *
      FROM
      users
      WHERE
      id = ?
    SQL

    return nil unless query.length > 0

    Users.new(query.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author(@id)
  end

  def authored_replies
    Replies.find_by_user_id(@id)
  end

  def followed_questions
    QuestionsFollows.followed_questions_for_user_id(@id)
  end

  def liked_questions
      Likes.liked_questions_for_user_id(@id)
  end

  def average_karma
    query = QuestionsDBConnection.instance.execute(<<-SQL, @id)
    SELECT
      *
    FROM
      likes l , questions q
    WHERE
      l.user_id = ?
      and
      q.user_id = l.user_id

    SQL

    return nil unless query.length > 0

    query.map { |e| e }
  end

end
