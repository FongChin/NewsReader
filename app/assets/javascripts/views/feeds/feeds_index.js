NewReader.Views.FeedsIndexView = Backbone.View.extend({
  events: {
    "click button.favorite": "favorite"
  },

  template: JST['feeds/index'],

  render: function (){
    var renderedContent = this.template({ feeds: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

  favorite: function(event){
    var feed = this.collection.get(+$(event.currentTarget).data("id"));
    if (!feed.get("has_favorited")) {
      var userfeed = new NewReader.Collections.UserFeeds( { feedId: feed.id } );
      var $btn = $(event.currentTarget);
      userfeed.create({feed_id: feed.id}, {
        success: function(){
          $btn.attr("disabled", true)
        }
      });
    }
  }


});
