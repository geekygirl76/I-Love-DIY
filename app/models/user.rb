class User < ActiveRecord::Base

  include PgSearch

  pg_search_scope :search_by_username, against: :username
  multisearchable against: :username


  has_attached_file :photo, :styles => {  :thumb => "100x100#" }, :default_url => "avatar.jpeg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  GENDERS = [ "Female", "Male", "None of your business", "Robot"]

  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, :session_token, :username, presence: true


  before_validation :ensure_session_token


  has_many :subs, class_name: "Sub", foreign_key: :user_id
  has_many :posts, through: :subs, source: :posts
  has_many :posts, dependent: :destroy
  has_many :comments, inverse_of: :user
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id
  has_many :collects, dependent: :destroy
  has_many :blockrecords, class_name: "Blockrecord", foreign_key: :receiver_id, dependent: :destroy
  has_many :blockrecords, class_name: "Blockrecord", foreign_key: :sender_id, dependent: :destroy
  has_many :voterecords, dependent: :destroy


  before_create :add_activation_token

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end


  def self.find_or_create_by_auth_hash(auth_hash)
     user = self.find_by(uid: auth_hash[:uid], provider: auth_hash[:provider])

     unless user
       user = self.create!(
         username: auth_hash[:uid],
         uid: auth_hash[:uid],
         provider: auth_hash[:provider],
         email: auth_hash[:info][:email],
         password_digest: SecureRandom::urlsafe_base64(16)
       )
     end

     user
   end


  def password_match
     self.password == self.confirm_password
  end

  def add_activation_token
    self.activation_token = SecureRandom.base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
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
