NewReader.Models.Feed = Backbone.Model.extend({
  parse: function(data){
    var entries = data.entries;
    data.entries = new NewReader.Collections.Entries( entries, { feedId: data.id });
    return data;
  }
});
