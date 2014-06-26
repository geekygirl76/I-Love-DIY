class Comment < ActiveRecord::Base
  validates :body, :user, :post, presence: true

  belongs_to :post, inverse_of: :comments
  belongs_to :user, inverse_of: :comments
end
