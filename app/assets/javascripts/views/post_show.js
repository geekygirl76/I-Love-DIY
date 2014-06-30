Diy.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],

  render: function(){
    console.log("In backbone post show");
    var content = this.template({
      post: this.model
    });
    this.$el.html(content);
    return this;
  }


});