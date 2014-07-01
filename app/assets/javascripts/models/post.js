Diy.Models.Post = Backbone.Model.extend({
  initialize: function () {
      this.comments();
    },

    comments: function () {
      if (!this._comments) {
        var postComments = new Diy.Collections.PostComments([], {
          post: this
        });
        this.set({
          _comments: postComments
        });
      }
      return this._comments;
    }

});