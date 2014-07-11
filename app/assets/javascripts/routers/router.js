Diy.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.posts = options.posts;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "":  "subsIndex",
    "subs/:id": "subShow",
    "channels/:id" : "channelShow",
    "posts": 'index',
    "posts/new" : "new",
    "posts/:id" : "show",
    "posts/:id/edit" : "edit"
    },

    subShow: function(id){
      var sub = Diy.subs.get(id);
      var subShowView = new Diy.Views.SubShow({ model: sub });
      this._swapView(subShowView);
    },

    channelShow: function(id){
      var channel = Diy.channels.get(id);
      var channelShowView = new Diy.Views.ChannelShow({ model: channel });
      this._swapView(channelShowView);
    },

    subsIndex: function(){

      var subIndexView = new Diy.Views.SubsIndex({

        collection: Diy.subs
      });


      this._swapView(subIndexView);

    },


  index: function () {
    console.log(" In router index");
    var indexView = new Diy.Views.PostsIndex({
      collection: this.posts
    });
    this._swapView(indexView);
  },


  show: function (id) {
    var that = this;
    this._getPost(id, function (post) {
      post.comments().fetch();
      var showView = new Diy.Views.PostShow({
        model: post
      });
      that._swapView(showView);
    });
  },

  edit: function (id) {
      var that = this;
      this._getPost(id, function (post) {
        var editView = new Diy.Views.PostForm({
          collection: that.posts,
          model: post
        });

        that._swapView(editView);
      });
    },

  new: function(){
    console.log(" In router new");
    var newPost = new Diy.Models.Post();
    console.log("new post:", newPost);
    var formView = new Diy.Views.PostForm({
      model: newPost,
      collection: this.posts
    });
    this._swapView(formView);
  },



  _getPost: function (id, callback) {
    var that = this;
    var post = Diy.posts.get(id);
    if (!post) {
      post = new Diy.Models.Post({
        id: id
      });
      post.collection = this.posts;
      post.fetch({
        success: function () {
          that.posts.add(post);
          callback(post);
        }
      });
    } else {
      callback(post);
    }
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});