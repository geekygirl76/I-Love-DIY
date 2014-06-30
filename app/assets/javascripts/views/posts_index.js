Diy.Views.PostsIndex = Backbone.View.extend({

  template: JST["posts/index"],

  events: {
    "click .delete": "destroyPost"
  },

  initialize: function(){
    this.listenTo(this.collection, "add change: title remove rese", this.render);
  },

  destroyPost:function(event){
    var $target = $(event.target);
    var post = this.collection.get($target.attr("data-id"));
    post.destoy();
  },

  render:function(){
    
    var content = this.template({
      posts: this.collection
    });
    this.$el.html(content);
    return this;
  }

});