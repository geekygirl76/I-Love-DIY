Diy.Models.Post = Backbone.Model.extend({

  urlRoot: "/api/posts",

  comments: function () {
      this._comments = this._comments ||
        new Diy.Collections.PostComments([], { post: this });


       return this._comments;
    },

    parse: function(response){

        if (response.comments){
            this.comments().set(response.comments, { parse: true });
        }

        return response;
    },

  toJSON: function(options) {

    var attr = _.clone(this.attributes);

    return { "post":  attr};

    }




});