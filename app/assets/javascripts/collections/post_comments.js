Diy.Collections.PostComments = Backbone.Collection.extend({
  model: Diy.Models.Comment,

  initialize: function(models, options){
    this.post = options.post;
  },

  url: function(){
    return '/api/posts/' + this.post.id + '/comments';
  }
});