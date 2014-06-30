Diy.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.posts = options.posts;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": 'index',
    "posts/new" : "new",
    "posts/:id" : "show",
    "posts/:id/edit" : "edit",
    "posts/:post_id/comments/:id": "comment"
    },


  comment: function(post_id, id){

  },

  edit: function (id) {
    var that = this;
    this._getPost(id, function (post) {
      var formView = new Diy.Views.PostForm({
        collection: that.posts,
        model: post
      });

      that._swapView(formView);
    });
  },

  index: function () {

    var indexView = new Diy.Views.PostsIndex({
      collection: this.posts
    });
    this._swapView(indexView);
  },

  new: function () {
    console.log("here in posts new router");
    var that = this;
    var newPost = new Diy.Models.Post();
    var formView = new Diy.Views.PostForm({
      collection: this.posts,
      model: newPost
    });

    that._swapView(formView);
  },

  show: function (id) {
    var that = this;
    this._getPost(id, function (post) {
      var formView = new Diy.Views.PostShow({
        model: post
      });
      that._swapView(formView);
    });
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