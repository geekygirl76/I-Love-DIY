Diy.Collections.Comments = Backbone.Collection.extend({
    model: Diy.Models.Comment,
    url: "api/comments",

    initialize: function(models, options){
        this.post = options.post;
    },

    getOrFetch: function (id) {
        var comment = this.get(id),
          comments = this;
        if(!comment) {
          comment = new Diy.Models.Comment({ id: id });
          comment.fetch({
            success: function () {
              comments.add(comment);
            },
          });
        } else {
          comment.fetch();
        }
        return comment;
      }
});