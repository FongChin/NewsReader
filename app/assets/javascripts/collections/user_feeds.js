NewReader.Collections.UserFeeds = Backbone.Collection.extend({

  model: NewReader.Models.UserFeed,
  url: function () {
    return  "/feeds/" + this.feedId + "/favorite";
  },

  initialize: function(options) {
    this.feedId = options.feedId;
  }



});
