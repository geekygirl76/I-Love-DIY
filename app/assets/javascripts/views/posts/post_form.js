Diy.Views.PostForm = Backbone.View.extend({
  template: JST["posts/form"],

  events: {
    "click .create-post": "submit"
  },

  render: function(){
    console.log("here in backbone post form:", this.model);
    var content = this.template({
      post: this.model,

      subs: Diy.subs,
      channels: Diy.channels
    });

    this.$el.html(content);
    return this;
  },

  submit: function(event){
    event.preventDefault();
    event.stopPropagation();
    console.log(window.currentUser.id == -1);
    if (window.currentUser.id == -1){
        alert("Please log in or sign up!");
        return;
    }
    var that = this;


      var attrs = this.$el.find("#new-post-form").serializeJSON();

      console.log(attrs);
       that.model.collection = that.collection;
       console.log(this.model);

      var picFile = this.$el.find("#file-upload")[0].files[0];


      if (picFile){

        var reader = new FileReader();
         reader.onload = function(e) {

           console.log(this.result);


           attrs.post["photo"] = this.result;

           that.model.save(attrs.post, {



             success: function (post) {
                 // console.log("success!");
               that.collection.add(post);
               Backbone.history.navigate("", { trigger: true });
             },

             error: (function (e) {
               // console.log();
                    alert(e);
                }),


           });
         }
         reader.readAsDataURL(picFile);

      } else {
      alert("You have to upload a picture!")
      }

      // var reader = new FileReader();
//        reader.onload = function(e) {
//
//          console.log(this.result);
//
//
//          attrs.post["photo"] = this.result;
//
//          that.model.save(attrs, {
//
//            enctype: "multipart/form-data",
//
//            success: function (post) {
//
//              that.collection.add(post);
//              Backbone.history.navigate("", { trigger: true });
//            }
//          });
//        }

         // reader.readAsDataURL(picFile);




  }

});