class Voterecord < ActiveRecord::Base
  validates :user_id, :post_id, presence: true

  validates :user_id, uniqueness: {scope: :post_id,
    message: "Already voted!"}

    belongs_to :user
    belongs_to :post
end
