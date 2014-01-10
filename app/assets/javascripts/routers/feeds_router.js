NewReader.Routers.Feeds = Backbone.Router.extend({
  routes: {
    "": "index",
    "feeds/:id/entries/:entryId": "entryShow",
    "feeds/:id": "show"

  },

  index: function(){
    var view = new NewReader.Views.FeedsIndexView({collection: NewReader.feeds });
    this._swapView(view);
  },

  show: function(id){
    var view = new NewReader.Views.FeedView({
      model: NewReader.feeds.get(parseInt(id))
    });
    this._swapView(view);
  },

  entryShow: function(id, entryId){
    var feed = NewReader.feeds.get(id);
    var view = new NewReader.Views.EntryView({ model: feed.get("entries").get(entryId)})
    this._swapView(view);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    NewReader.$rootEl.html(newView.render().$el);
  }
});
