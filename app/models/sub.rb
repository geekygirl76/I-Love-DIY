class Sub < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :user_id, presence: true
  belongs_to :owner, class_name: "User", foreign_key: :user_id
end
