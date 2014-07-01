Diy.Views.PostForm = Backbone.View.extend({
  template: JST["posts/form"],

  events: {
    "click .create-post": "submit"
  },

  render: function(){
    console.log("here in backbone post form");
    var content = this.template({
      post: this.model
    });
    
    this.$el.html(content);
    return this;
  },

  submit: function(event){
    console.log("backbone submit");
    var that = this;
      event.preventDefault();
      
      var attrs = this.$el.find("#new-post-form").serializeJSON();
      console.log(attrs);
      this.model.collection = this.collection;
      
      this.model.save(attrs, {
        success: function (post) {
          that.collection.add(post);
          Backbone.history.navigate("", { trigger: true });
        }
      });
  }

});