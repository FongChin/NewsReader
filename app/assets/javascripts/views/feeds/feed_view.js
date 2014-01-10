NewReader.Views.FeedView = Backbone.View.extend({
  events: {
    "click button.refresh": "refresh"
  },
  template: JST['feeds/show'],
  render: function(){
    var renderContent = this.template({feed: this.model });
    this.$el.html(renderContent);
    return this;
  },
  refresh: function(event){
    var that = this;
    console.log("in refresh");
    console.log(this.model.get("entries"));
    var entries = this.model.get("entries").fetch({
      success: function() {
        that.render();
      }
    });
  }
});


// new NewReader.Views.FeedView({collection: })
