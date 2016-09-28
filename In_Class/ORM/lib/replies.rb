require_relative "../req"
require_relative "users"
require_relative "questions"

class Replies

  attr_accessor :fname, :lname
  attr_reader :id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
    data.map{|datum| Replies.new(datum)}
  end

  def self.find_by_user_id(user_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
      *
      FROM
      replies
      WHERE
      user_id = ?
    SQL

    return nil unless query.length > 0

    query.map { |e| Replies.new(e)  }
  end

  def self.find_by_question_id(question_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
      *
      FROM
      replies
      WHERE
      question_id = ?
    SQL

    return nil unless query.length > 0

    query.map { |e| Replies.new(e)  }
  end

  def self.find_by_reply_id(reply_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, reply_id)
      SELECT
      *
      FROM
      replies
      WHERE
      id = ?
    SQL

    return nil unless query.length > 0

    Replies.new(query.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @reply = options['reply']
    @reply_id = options['reply_id']
  end


  def author
    User.find_by_user_id(@user_id)
  end


  def question # Possibly parent reply
    Questions.find_by_id(@question_id)
  end

  def parent_reply #Could return one step up
    Replies.find_by_reply_id(@reply_id)
  end

  def child_replies
    Replies.find_by_question_id(@question_id)
  end



end
