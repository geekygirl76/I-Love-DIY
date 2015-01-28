Diy.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],


  events: {
    "click button#post-comment" : "submitComment",
    "click button.submit-modal-comment" : "submitChildComment",
    "click .delete": "destroyPost",
      "click a.like": "upvote",
      "click a.dislike": "downvote",
      "click button.reply-comment": "openModal",
      "click button.delete-comment": "deleteComment",
      "click button.cancel-reply":"cancelReply"
  },

  cancelReply: function(event){

      event.preventDefault();
      event.stopPropagation();
      var $button = $(event.currentTarget);

      $(".reply-modal").find("textarea").val("");
      $(".reply-modal").addClass("no-display");
      $(".overlay").addClass("no-display");
  },

  deleteComment: function(event){
      event.preventDefault();
      event.stopPropagation();
      var $button = $(event.currentTarget);
      var commentId=  $button.data("id");
      //need to write comment getOrFetch method, getorfetch comment,destroy, view render

      //find the comment and destroy it in both server and browser
  },

  openModal: function(event){

      var myTop = this.$el.find("main").scrollTop();

      event.preventDefault();
      event.stopPropagation();

      var $button = $(event.currentTarget);
      var off= $button.offset().top;


      $(".reply-modal").animate({top: (myTop +off/2 )+"px"},200);
      this.$el.find("main").animate({scrollTop:(myTop +off/2) }, 200);
      $(".overlay").removeClass("no-display");
      $(".reply-modal").removeClass("no-display");



  },

  upvote: function(event){
      event.preventDefault();
      event.stopPropagation();
      if (!window.currentUser || window.currentUser.id ==-1){
          alert("Please log in or sign up first!");

          return;
      };
      var $a = $(event.currentTarget);
      var post = this.model;

      $.ajax({url: this.model.url() + "/upvote"}).done(function(){
          alert("Upvote success!");
      }).fail(function(){
          alert("You can't vote the same post twice!");
      });
  },

  downvote: function(event){
      event.preventDefault();
      event.stopPropagation();
      if (!window.currentUser || window.currentUser.id ==-1){
          alert("Please log in or sign up first!");
          return;
      };
      var $a = $(event.currentTarget);
      var post = this.model;
      $.ajax({url: this.model.url() + "/downvote"}).done(function(){
          alert("Downvote success!");
      }).fail(function(){
          alert("You can't vote the same post twice!");
      });
  },

  destroyPost:function(event){
    alert("Post Deleted!");
    var $target = $(event.target);

    var post = Diy.posts.get($target.attr("data-id"));

    post.destroy();
    Backbone.history.navigate("posts", {trigger:true});
  },



  submitComment: function(event){
    event.preventDefault();
    event.stopPropagation();
    if (!window.currentUser || window.currentUser.id == -1){

        alert("Please log in or sign up first!");

        $("textarea.comment").val("");
        return;
    }
    var view = this;


    var attrs = this.$el.find(".post-comment-form").serializeJSON();

    var newComment = new Diy.Models.Comment(attrs["comment"]);
    // console.log("newComment", newComment);
    newComment.collection = this.model.comments();

    newComment.save({}, {

      success: function(){

        // console.log("Successfully saved!");
        view.model.comments().add(newComment);
        view.render();
        view.$el.find("main").animate({scrollTop: 500}, 200);
        // var topPos = $(view.$el.find(".reply-comment")[5]).offset().top;
        alert("Comment published!");
      },
      error: function(){
          alert("Content can't be blank!");
      }
    });
  },




  submitChildComment: function(event){
      event.preventDefault();
      event.stopPropagation();
      if (!window.currentUser || window.currentUser.id == -1){

          alert("Please log in or sign up first!");

          return;
      }

      var buttonCount = $("button.reply-comment").length;
      var lastButton = $("button.reply-comment")[buttonCount-1];
      var top = $(lastButton).offset().top;


      var view = this;
      var attrs = this.$el.find(".reply-modal-form").serializeJSON();
      var newComment = new Diy.Models.Comment(attrs["comment"]);
      // console.log("newComment", newComment);
      newComment.collection = this.model.comments();

      newComment.save({}, {

        success: function(){
            $(".reply-modal").addClass("no-display");
          // console.log("Successfully saved!");
          view.model.comments().add(newComment);
          view.render();
          alert("Reply published!");
          view.$el.find("body").animate({scrollTop: 500}, 200);
        },
        error: function(){
            alert("Content can't be blank!");
        }
      });

  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync add change:title remove", this.render);

  },

  render: function(){

    // console.log("In backbone post show view");
//    console.log("This post:", this.model);
    var content = this.template({
      post: this.model,
      sub: Diy.subs.get(this.model.get("sub_id")),
      channel: Diy.channels.get(this.model.get("channel_id"))
    });
    this.$el.html(content);

    return this;
  }


});