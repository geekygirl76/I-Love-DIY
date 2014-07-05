class Message < ActiveRecord::Base
  validates :sender_id, :receiver_id, :title, :body, presence: true
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  def read_letter
    self.read = true
    self.save!
  end

  def change_draft
    self.draft = "N"
    self.save!
  end

  def trashmail
    self.trashed = true
    self.save!
  end

end
