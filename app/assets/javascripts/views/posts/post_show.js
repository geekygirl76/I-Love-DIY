Diy.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],


  events: {

  },



  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync", this.render);
  },

  render: function(){
    console.log("In backbone post show view");

    var content = this.template({
      post: this.model,

    });
    this.$el.html(content);
    return this;
  }


});