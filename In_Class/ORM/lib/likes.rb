require_relative "../req"
require_relative "users"
require_relative "questions"
require_relative "replies"

class Likes

  attr_accessor :user_id, :question_id
  attr_reader :id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM likes")
    data.map{|datum| Likes.new(datum)}
  end

  def self.likers_for_question_id(question_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
      u.*
      FROM
      likes as l
      JOIN users AS u ON l.user_id = u.id
      WHERE
      l.question_id = ?
    SQL

    return nil unless query.length > 0

    query.map{|u| Users.new(u)}
  end

  def self.num_likes_for_question_id(question_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
      COUNT(*) as num_likes
      FROM
      likes as l
      WHERE
      l.question_id = ?
    SQL

    return nil unless query.length > 0

    query.first['num_likes']
  end

  def self.liked_questions_for_user_id(user_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
      q.*
      FROM
      likes as l
      JOIN questions as q on q.id = l.question_id
      WHERE
      l.user_id = ?
    SQL

    return nil unless query.length > 0

    query.map { |e| Questions.new(e)  }
  end

  def self.most_liked_questions(n)
    query = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        q.*
      FROM
        likes as l
      JOIN questions as q on l.question_id = q.id
      GROUP BY
        q.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    return nil unless query.length > 0

    query.map { |e| Questions.new(e) }
  end



  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
