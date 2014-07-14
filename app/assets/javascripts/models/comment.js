Diy.Models.Comment = Backbone.Model.extend({

  toJSON: function(options) {

    var attr = _.clone(this.attributes);

    return { "comment":  attr};

    },

    comments: function () {
        this._comments = this._comments ||
          new Diy.Collections.Comments([], { parent_comment: this });
         return this._comments;
      }

});