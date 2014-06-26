class Post < ActiveRecord::Base
  has_many :comments, inverse_of: :post
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  validates :title, :body, :sub_id, :user_id, presence: true
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  belongs_to :sub
  belongs_to :channel
  has_one :manager, through: :sub, source: :manager
end
