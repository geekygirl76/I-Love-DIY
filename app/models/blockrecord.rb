class Blockrecord < ActiveRecord::Base
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  validates :receiver_id, :sender_id, presence: true

  validates :receiver_id, uniqueness: {scope: :sender_id,
    message: "Already blocked!"}
end
