class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password

  has_many :subs,
  foreign_key: :moderator_id

  has_many :posts,
  foreign_key: :author_id

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  after_initialize :ensure_session_token

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def self.find_by_credentials(username, password)
    possible_user = User.find_by(username: username)
    return nil unless possible_user
    possible_user.is_password?(password) ? possible_user : nil
  end

end
