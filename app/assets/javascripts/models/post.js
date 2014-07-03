Diy.Models.Post = Backbone.Model.extend({

  urlRoot: "/api/posts",

  comments: function () {
      this._comments = this._comments ||
        new Diy.Collections.PostComments([], { post: this });
       return this._comments;
    },

  toJSON: function(options) {
  
    var attr = _.clone(this.attributes);
  
    return { "post":  attr};
     
    }

  
    

});