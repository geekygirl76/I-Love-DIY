class User < ActiveRecord::Base
  attr_reader :password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, :session_token, presence: true
  
  before_validation :ensure_session_token
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user
    BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
  end
  
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end
  
  private
  
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end
end
