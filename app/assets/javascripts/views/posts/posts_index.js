Diy.Views.PostsIndex = Backbone.View.extend({

  template: JST["posts/index"],

  events: {
    "click button#refresh" : "refresh",
    "click .delete": "destroyPost"
  },

  refresh: function(){
    var view = this;
    this.collection.fetch({
      success: function(){
        view.render();
      }
    });
  },

  initialize: function(){
    this.listenTo(this.collection, "add change: title remove reset", this.render);
  },

  destroyPost:function(event){

    var $target = $(event.target);

    var post = this.collection.get($target.attr("data-id"));

    post.destroy();
  },

  render:function(){
    console.log("In backbone post index view");
    var content = this.template({
      posts: this.collection
    });
    this.$el.html(content);
    return this;
  }

});