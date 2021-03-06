json.(post, :id, :title, :body,  :created_at, :updated_at, :score, :sub_id,:channel_id, :user_id, :photo)
json.photo_url asset_path(post.photo.url)
json.author_name post.owner.username
json.sub_name post.sub.title

comments ||= nil
 unless comments.nil?
   json.comments(comments) do |comment|
     json.partial!("api/comments/comment", :comment => comment)
   end
 end