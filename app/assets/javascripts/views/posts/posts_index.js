Diy.Views.PostsIndex = Backbone.View.extend({

  template: JST["posts/index"],

  events: {
    "click button#refresh" : "refresh",
    "click .delete": "destroyPost"
  },

  refresh: function(){

    this.collection.fetch(
  );
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add change:title remove reset", this.render);
  },

  destroyPost:function(event){

    var $target = $(event.target);

    var post = this.collection.get($target.attr("data-id"));
    // console.log("Before destroy:",this.collection.models);
    post.destroy();
    // console.log("After destroy:",this.collection.models);
  },

  render:function(){
    // console.log("In backbone post index view");
    var content = this.template({
      posts: this.collection
    });
    this.$el.html(content);
    return this;
  }

});