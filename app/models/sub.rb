class Sub < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :user_id, presence: true
  belongs_to :manager, class_name: "User", foreign_key: :user_id
  has_many :posts
end
