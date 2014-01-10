NewReader.Collections.Entries = Backbone.Collection.extend({
  url: function () {
    return  "/feeds/" + this.feedId + "/entries";
  },
  model: NewReader.Models.Entry,
  initialize: function(models, options){
    this.feedId = options.feedId;
  }

});
