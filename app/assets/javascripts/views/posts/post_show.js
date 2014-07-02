Diy.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],


  events: {
    "click button#post-comment" : "submit"
  },


  submit: function(event){
    var view = this;
    event.preventDefault;

    var attrs = this.$el.find(".post-comment-form").serializeJSON();
    var newComment = new Diy.Models.Comment(attrs["comment"]);
    newComment.save({}, {
      success: function(){
        view.model.comments().add(comment);
        view.render();
      }
    });
  },


  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync add", this.render);
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