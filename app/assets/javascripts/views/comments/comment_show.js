Diy.Views.CommentShow = Backbone.CompositeView.extend({
  template: JST['comments/show'],

  render: function () {

    var content = this.template({
      comment: this.model
    });
    this.$el.html(content);
    this.renderChildren();
    return this;
  },

  renderChildren: function(){
      console.log(this.model.get("body"));
      console.log( this.model.childComments());
      this.model.childComments().each(this.addChildComment.bind(this));
  },

  initialize: function(){
      this.collection = this.model.childComments();
      this.listenTo(this.model, "sync", this.render);
      this.listenTo(this.collection, "add", this.addChildComment);
  },

  addChildComment: function(comment){
      var view = new Diy.Views.CommentShow({
          model: comment
      });
      this.addSubview("#children", view);
  }
});