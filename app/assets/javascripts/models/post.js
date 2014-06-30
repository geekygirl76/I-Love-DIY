Diy.Models.Post = Backbone.Model.extend({
  validate: function (attributes) {
    if (!attributes || !attributes.title || attributes.title == "") {
      return "cannot have an empty title";
    }
  },






});