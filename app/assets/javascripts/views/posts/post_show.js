Diy.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],


  events: {
    "click button#post-comment" : "submitComment",
    "click button#comment-comment" : "submitChildComment",
    "click .delete": "destroyPost"
  },

  destroyPost:function(event){
    alert("Post Deleted!");
    var $target = $(event.target);

    var post = Diy.posts.get($target.attr("data-id"));

    post.destroy();
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
    this.listenTo(this.model.comments(), "sync add change:title remove", this.render);
  },

  render: function(){

    console.log("In backbone post show view");
   console.log("This post:", this.model);
    var content = this.template({
      post: this.model,
      sub: Diy.subs.get(this.model.get("sub_id")),
      channel: Diy.channels.get(this.model.get("channel_id"))
    });
    this.$el.html(content);
    return this;
  }


});