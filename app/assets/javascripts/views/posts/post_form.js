Diy.Views.PostForm = Backbone.View.extend({
  template: JST["posts/form"],

  events: {
    "click .create-post": "submit"
  },

  render: function(){
    console.log("here in backbone post form");
    var content = this.template({
      post: this.model,

      subs: Diy.subs,
      channels: Diy.channels
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
       that.model.collection = that.collection;

      var picFile = this.$el.find("#file-upload")[0].files[0];

      var reader = new FileReader();
       reader.onload = function(e) {

         console.log(this.result);


         attrs.post["photo"] = this.result;

         that.model.save(attrs, {

           enctype: "multipart/form-data",

           success: function (post) {

             that.collection.add(post);
             Backbone.history.navigate("", { trigger: true });
           }
         });
       }
       reader.readAsDataURL(picFile);


  }

});