Diy.Collections.Posts = Backbone.Collection.extend({
  url: "/api/posts",
  model: Diy.Models.Post,

  comparator: function(post){
    return -post.get("score");
  },




});