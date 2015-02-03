json.(comment, :id, :post_id, :body, :created_at, :updated_at,  :user,:user_id, :child_comments, :parent_comment
)
json.author_name comment.user.username
json.publish_time comment.created_at.to_formatted_s(:short)