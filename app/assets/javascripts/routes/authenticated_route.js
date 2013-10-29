App.AuthenticatedRoute = Ember.Route.extend({
  
  beforeModel: function(transition){
    var applicationController = this.controllerFor('application');
    console.log('dot', applicationController.currentlyLoggedIn);
    console.log('get', applicationController.get('currentlyLoggedIn'));
    //check if currentUser is set
    //!applicationController.get('loggedIn')

    if (!applicationController.get('currentlyLoggedIn')){
      this.redirectToLogin(transition);
    } else {
      applicationController.login(); 
    }
  },
  
  // Redirect to the login page and store the current transition so we can
  // run it again after login
  redirectToLogin: function(transition){
    alert("You must be signed in");
    var applicationController = this.controllerFor('application');
    applicationController.set('afterLoginTransition', transition);
    this.transitionTo('login');
  }
  
});