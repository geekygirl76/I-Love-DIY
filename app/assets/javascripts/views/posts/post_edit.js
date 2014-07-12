Diy.Views.PostEdit = Backbone.View.extend({
  template: JST["posts/edit"],

  events: {
    "click .create-post": "submit"
  },

  render: function(){
    console.log("here in backbone post edit:", this.model);
    var content = this.template({
      post: this.model,

      subs: Diy.subs,
      channels: Diy.channels
    });

    this.$el.html(content);
    return this;
  },

  submit: function(event){
    console.log("submitting edited post");
    var that = this;
      event.preventDefault();

      var attrs = this.$el.find("#new-post-form").serializeJSON();
      console.log(attrs);
       that.model.collection = that.collection;
       console.log(this.model);





     that.collection.add(that.model);
     Backbone.history.navigate("", { trigger: true });




  }

});