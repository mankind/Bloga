App.UsersIndexRoute = Ember.Route.extend({
  model: function(){
    return this.get('store').find('user');
}
});