require_relative "../req"


class QuestionsFollows

  attr_accessor :fname, :lname
  attr_reader :id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions_follows")
    data.map{|datum| QuestionsFollows.new(datum)}
  end

  def self.find_by_user_id(user_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
      q.*
      FROM
      questions_follows as qf
      JOIN questions as q on q.id = qf.question_id
      WHERE
      qf.user_id = ?
    SQL

    return nil unless query.length > 0

    query.map { |e| Questions.new(e)  }
  end

  def self.followers_for_question_id(question_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        u.id, u.fname, u.lname
      FROM
        questions_follows as q
      JOIN users as u on q.user_id = u.id
      WHERE
        q.question_id = ?
    SQL

    return nil unless query.length > 0

    query.map { |e| Users.new(e) }
  end

  def self.followed_questions_for_user_id(user_id)
    query = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        q.*
      FROM
        questions_follows as qf
      JOIN questions as q on qf.question_id = q.id
      WHERE
      qf.user_id = ?
    SQL

    return nil unless query.length > 0

    query.map { |e| Questions.new(e) }
  end

  def self.most_followed_questions(n)
    query = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        q.*
      FROM
        questions_follows as qf
      JOIN questions as q on qf.question_id = q.id
      GROUP BY
        q.id
      HAVING
        COUNT(*)
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
