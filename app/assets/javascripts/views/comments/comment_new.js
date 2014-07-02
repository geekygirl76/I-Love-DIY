Diy.Views.NewComment = Backbone.View.extend({
  template: JST["comments/new"],



  event: {
    "submit-form" : "submit"
  },

  render: function(){
    var content = this.template({post: this.model});
    this.$el.html(content);
    return this;
  },

  submit: function(event){
    var view = this;
    event.preventDefault;

    var params =$(event.currentTarget).serializeJSON();
    var comment = new Diy.Models.Comment(params["comment"]);
    comment.save({},{
      success: function(){
        view.model.comments().add(comment);
      }
    });
  }

});