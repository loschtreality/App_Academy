class User < ActiveRecord::Base
  validates :user_name, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}


  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    if user
      user.is_password?(password) ? user : nil
    else
      return nil
    end
  end

  before_validation :ensure_session_token

  attr_reader :password


  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bc_obj = BCrypt::Password.new(self.password_digest)
    bc_obj.is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
