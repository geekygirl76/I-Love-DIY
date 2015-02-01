Diy.Collections.Posts = Backbone.Collection.extend({
  url: "/api/posts",
  model: Diy.Models.Post,

  comparator: function(post){
    return (-1 *  post.get("score"));
  },


  getOrFetch: function (id) {
      var post = this.get(id),
        posts = this;
      if(!post) {
        post = new Diy.Models.Post({ id: id });
        post.fetch({
          success: function () {
            comments.add(post);
          },
        });
      } else {
        post.fetch();
      }
      return post;
    }

});