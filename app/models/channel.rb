class Channel < ActiveRecord::Base
  has_many :posts
  belongs_to :sub
  validates :title, :sub_id, presence: true
end
