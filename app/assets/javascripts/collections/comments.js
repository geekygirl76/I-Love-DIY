Diy.Collections.Comments = Backbone.Collection.extend({
  model: Diy.Models.Comment,
  url: function(){
    return "api/posts/" + this.post.id + "/comments";
  }

});