json.(post, :id, :title, :body,  :created_at, :updated_at, :score, :sub_id,:channel_id)
json.photo_url asset_path(post.photo.url)

comments ||= nil
 unless comments.nil?
   json.comments(comments) do |comment|
     json.partial!("api/comments/comment", :comment => comment)
   end
 end