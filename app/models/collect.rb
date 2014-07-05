class Collect < ActiveRecord::Base

  validates :user_id, uniqueness: {scope: :post_id,
    message: "Already collected!"}


end
