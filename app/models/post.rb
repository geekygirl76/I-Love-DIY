
class Post < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search_by_title_and_body, against: [:title, :body]

  multisearchable against: [:title, :body]

  has_many :comments, inverse_of: :post
  has_many :voterecords, dependent: :destroy
  has_many :collects, dependent: :destroy

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "placeholder.jpeg"
  validates_attachment_content_type :photo, :content_type => [/\Aimage\/.*\Z/,'application/xml']

  validates :title, :body,:sub_id, :user_id,  presence: true
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  belongs_to :sub
  belongs_to :channel
  has_one :manager, through: :sub, source: :manager

  before_validation :ensure_score

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

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
