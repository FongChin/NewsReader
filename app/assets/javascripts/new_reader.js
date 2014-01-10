window.NewReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    NewReader.$rootEl = $('#content');
    NewReader.feeds = new NewReader.Collections.Feeds();
    NewReader.feeds.fetch({
      success: function() {
        new NewReader.Routers.Feeds();
        Backbone.history.start();
      }
    });
  }
};

$(document).ready(function(){
  NewReader.initialize();
});
