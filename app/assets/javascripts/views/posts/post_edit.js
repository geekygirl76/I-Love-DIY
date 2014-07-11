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
    console.log("submitting edited post")
    var that = this;
      event.preventDefault();

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

           that.model.set(attrs.post, {



             success: function (post) {
               console.log("here");
               that.collection.add(post);
               Backbone.history.navigate("", { trigger: true });
             }
           });
         }
         reader.readAsDataURL(picFile);

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