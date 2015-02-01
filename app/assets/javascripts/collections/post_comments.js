Diy.Collections.PostComments = Backbone.Collection.extend({
  model: Diy.Models.Comment,

  initialize: function(models, options){
    this.post = options.post;
    this.parent_comment = options.parent_comment;
  },

  url: function(){
    return '/api/posts/' + this.post.id + '/comments';
  },

  getOrFetch: function (id) {
      var comment = this.get(id),
        comments = this;
      if(!comment) {
        comment = new Diy.Models.Comment({ id: id });
        comment.fetch({
          success: function () {
            comments.add(comment);
          },
        });
      } else {
        comment.fetch();
      }
      return comment;
    }

});