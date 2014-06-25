class Post < ActiveRecord::Base
  
  
  validates :title, :body, :sub_id, :user_id, presence: true
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  belongs_to :sub
  belongs_to :channel
  has_one :manager, through: :sub, source: :manager
end
