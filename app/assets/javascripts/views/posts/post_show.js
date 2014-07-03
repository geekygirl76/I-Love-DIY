Diy.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],


  events: {
    "click button#post-comment" : "submitComment"
  },


  submitComment: function(event){
    event.preventDefault;

    var view = this;


    var attrs = this.$el.find(".post-comment-form").serializeJSON();
    console.log("attrs: ", attrs);
    var newComment = new Diy.Models.Comment(attrs["comment"]);
    console.log("newComment", newComment);
    newComment.collection = this.model.comments();

    newComment.save({}, {

      success: function(){

        console.log("Successfully saved!");
        view.model.comments().add(newComment);
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