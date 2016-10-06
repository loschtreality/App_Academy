class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6, allow_nil: true}
  validates :password_digest, presence: {message: "Password can't be blank"}

  attr_reader :password
  before_initialize :ensure_session_token

  def self.generate_session_token
    self.session_token = SecureRandom::url_safe64(16)
  end

  def self.ensure_session_token
    self.session_token ||= generate_session_token
  end

  def self.reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password(password)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
