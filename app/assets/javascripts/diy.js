window.Diy = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    Diy.subs = new Diy.Collections.Subs({
      
    });
    
    Diy.subs = JSON.parse(($("#bootstrapped-data")).html()).subs;
    
    Diy.channels = new Diy.Collections.Channels({});
    Diy.channels = JSON.parse(($("#bootstrapped-data")).html()).channels;
    console.log(Diy.channels);
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

