Diy.Views.SubShow = Backbone.View.extend({
  template: JST["subs/show"],

  render: function(){
    console.log("All posts: ", Diy.posts);
    var content = this.template({ sub: this.model, posts: Diy.posts, channels: Diy.channels });
    this.$el.html(content);
    return this;
  }

});