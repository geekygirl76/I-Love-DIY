
class Post < ActiveRecord::Base
  has_many :comments, inverse_of: :post
  has_many :voterecords

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "default_pic.jpeg"
  validates_attachment_content_type :photo, :content_type => [/\Aimage\/.*\Z/,'application/xml']

  validates :title, :body,:sub_id, :user_id, :channel_id, presence: true
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  belongs_to :sub
  belongs_to :channel
  has_one :manager, through: :sub, source: :manager

  before_validation :ensure_score

  def top_level_comments
    comments.select { |comment| comment.parent_comment_id.nil? }
  end

  def comments_hash
    hash = Hash.new { |hash, key| hash[key] = [] }

    self.comments.each do |comment|
      hash[comment.parent_comment_id] << comment
    end

    hash
  end

  def add_score
    self.score += 1
    self.save!
  end

  def down_score
    self.score -= 1
    self.save!
  end

  private

  def ensure_score
    self.score ||= 0
  end

end
