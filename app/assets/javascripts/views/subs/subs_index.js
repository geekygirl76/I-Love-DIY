Diy.Views.SubsIndex = Backbone.View.extend({
  template: JST["subs/index"],

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function(){
    var featuredPosts = Diy.posts.models.length > 3 ? Diy.posts.first(3) : Diy.posts;

    var content = this.template({ subs: Diy.subs, posts: featuredPosts});

    this.$el.html(content);
    return this;
  }
});