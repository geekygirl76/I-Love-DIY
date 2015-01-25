window.Diy = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');

    subsData = JSON.parse(($("#bootstrapped-data")).html()).subs;
    Diy.subs = new Diy.Collections.Subs(subsData);

    channelsData = JSON.parse(($("#bootstrapped-data")).html()).channels;

    Diy.channels = new Diy.Collections.Channels(channelsData);


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

