App.UsersIndexRoute = App.AuthenticatedRoute.extend({
  model: function(){
    return this.get('store').find('user');
  },
  
  setupController: function(controller, model){
     controller.set('model', model);
  }
  
});