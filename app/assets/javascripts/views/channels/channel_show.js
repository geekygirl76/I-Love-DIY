Diy.Views.ChannelShow = Backbone.View.extend({
  template: JST["channels/show"],

  render: function(){
    console.log((Diy.subs.get(this.model.get("sub_id"))).escape("title"));
    var content = this.template({ channel: this.model, posts: Diy.posts, subs:Diy.subs });
    this.$el.html(content);
    return this;
  }

});