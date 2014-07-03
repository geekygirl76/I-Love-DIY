Diy.Models.Comment = Backbone.Model.extend({
  
  toJSON: function(options) {
  
    var attr = _.clone(this.attributes);
  
    return { "comment":  attr};
     
    }
  
});