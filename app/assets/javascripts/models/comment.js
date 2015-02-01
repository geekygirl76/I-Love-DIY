Diy.Models.Comment = Backbone.Model.extend({
    urlRoot: function(){
        return '/api/posts/' + this.post_id + '/comments';
    },

  toJSON: function(options) {

    var attr = _.clone(this.attributes);

    return { "comment":  attr};

    },

    childComments: function () {

        this._comments = this._comments ||
          new Diy.Collections.PostComments([], { parent_comment: this });

          console.log(this.get("body")," calling childComments", this._comments);
         return this._comments;
      },

      parse: function(response){
          // console.log(this.get("body"), "parsing",response.child_comments);
          if (response.child_comments){

              this.childComments().set(response.child_comments, { parse: true });
              // console.log("parsing",response.child_comments, this.childComments());
          }

          return response;
      }

});