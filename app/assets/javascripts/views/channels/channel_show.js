Diy.Views.ChannelShow = Backbone.View.extend({
  template: JST["channels/show"],

  render: function(){
    var content = this.template({ channel: this.model, posts: Diy.posts });
    this.$el.html(content);
    return this;
  }

});