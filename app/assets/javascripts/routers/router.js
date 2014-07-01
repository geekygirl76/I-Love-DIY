Diy.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.posts = options.posts;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": 'index',
   
    "posts/new" : "new",
    "posts/:id" : "show",
   
    "posts/:post_id/comments/:id": "comment"
    },


  comment: function(post_id, id){
    
    this.posts._getPost(post_id, function(post){
      var comment = post.comments().get(id);
      
      var commentShowView = new Diy.Views.CommentShow({ 
        model: comment
       });
       
       this._swapView(commentShowView);
    });
     
    
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
      var showView = new Diy.Views.PostShow({
        model: post
      });
      that._swapView(showView);
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