App.AuthenticatedRoute = Ember.Route.extend({
  
  beforeModel: function(transition){
    var applicationController = this.controllerFor('application');
    
    //check if currentUser is set
    //!applicationController.get('loggedIn')
   
    if (!applicationController.get('currentlyLoggedin') ){
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