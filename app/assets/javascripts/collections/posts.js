Diy.Collections.Posts = Backbone.Collection.extend({
  url: "/api/posts",
  model: Diy.Models.Post,
  
  comparator: funtcion(post){
    return post.get("created_at");
  }
});