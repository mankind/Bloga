App.UserIndexRoute = App.AuthenticatedRoute.extend({
  model: function(params){
    return this.get('store').find('user', params.user_id);
}
});