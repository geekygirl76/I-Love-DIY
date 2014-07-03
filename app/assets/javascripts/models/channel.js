Diy.Models.Channel = Backbone.Model.extend({
  
  toJSON: function(options) {
  
    var attr = _.clone(this.attributes);
  
    return { "channel":  attr};
     
    }
  
});