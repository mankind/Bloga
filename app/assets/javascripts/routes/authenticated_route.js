App.AuthenticatedRoute = Ember.Route.extend({
  
  beforeModel: function(transition){
    if (!this.controllerFor('userLogin').get('currentUser') ){
      this.redirectToLogin(transition);
     }   
  },
  
  redirectToLogin: function(transition){
    alert("You must be signed in");
    var userLoginController = this.controllerFor('userLogin");
    userLoginController.set('savedTransition', transition);
    this.transitionTo('userLogin');
  }
  
});