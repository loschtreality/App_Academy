require_relative "../req"
require_relative "users"
require_relative "replies"
require_relative "likes"

class Questions
  attr_accessor :title, :body, :user_id
  attr_reader :id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map{|datum| Questions.new(datum)}
  end

  def self.find_by_author(user_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
      *
      FROM
      questions
      WHERE
      user_id = ?
    SQL

    return nil unless query.length > 0

    query.map{|e| Questions.new(e)}
  end

  def self.find_by_id(id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
      *
      FROM
      questions
      WHERE
      id = ?
    SQL

    return nil unless query.length > 0

    Questions.new(query.first)
  end

  def self.most_followed
    QuestionsFollow.most_followed_questions(1)
  end

  def self.most_liked(n)
    Likes.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    Users.find_by_user_id(@user_id)
  end

  def replies
    Replies.find_by_question_id(@id)
  end

  def followers
    QuestionsFollows.followers_for_question_id(@id)
  end

  def likers
    Likes.likers_for_question_id(@id)
  end

  def num_likes
    Likes.num_likes_for_question_id(@id)
  end

end
