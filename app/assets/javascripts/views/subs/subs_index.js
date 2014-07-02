Diy.Views.SubsIndex = Backbone.View.extend({
  template: JST["subs/index"],

  initialize: function(){
    this.listenTo
  },

  render: function(){
    var content = this.template({ subs: Diy.subs });
    this.$el.html(content);
    return this;
  }
});