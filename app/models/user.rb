class User < ActiveRecord::Base
  GENDERS = ["Bloke", "Female", "Gal", "Guy","Male", "Miss", "None of your business", "Robot"]
  
  attr_reader :password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, :session_token, presence: true
  
  
  before_validation :ensure_session_token
  
  has_many :subs, class_name: "Sub", foreign_key: :user_id
  has_many :posts, through: :subs, source: :posts
  has_many :posts
  
  before_create :add_activation_token
  
  def password_match
     self.password == self.confirm_password
  end
  
  def add_activation_token
    self.activation_token = SecureRandom.base64(16)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user
    BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
  end
  
  
  def activate!
    self.activated = true
    self.save!
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
