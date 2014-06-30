window.Diy = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    Diy.posts = new Diy.Collections.Posts();

    Diy.posts.fetch({
      success: function(){

        new Diy.Routers.Router({
          $rootEl: $("#content"),
          posts: Diy.posts
        });
        Backbone.history.start();
      }

    });

  }
};

