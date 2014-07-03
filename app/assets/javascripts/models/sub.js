Diy.Models.Sub = Backbone.Model.extend({
  
  toJSON: function(options) {
  
    var attr = _.clone(this.attributes);
  
    return { "sub":  attr};
     
    }
  
});