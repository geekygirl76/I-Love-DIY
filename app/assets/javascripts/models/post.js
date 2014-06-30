Diy.Models.Post = Backbone.Model.extend({
  validate: function (attributes) {
    if (!attributes || !attributes.title || attributes.title == "") {
      return "cannot have an empty title";
    }
  },

  initialize: function(){
    this.comments();
  },

  parse: function(responsefunction ){}(args) {
    if (response["comments"]){
      this.comments().set(reponse["comments"]);
      delete response["comments"];
    }
    return response;
  },

  comments: function(){
    if (!this.get("comments")){
      var postComments = new Diy.Collections.PostComments([], {
        posts: this
      });
      this.set({
        comments: postComments
      });
    }
    return this.get("entries");
  }


});