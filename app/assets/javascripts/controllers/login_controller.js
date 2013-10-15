App.LoginController = Ember.ObjectController.extend({
  needs: 'application',
  email: ' ',
  password: '',
  
  reset: function(){
    this.setProperties({
      email: '',
      password: ''
    });
  },
  
  loginSuccessful: function(){
    var applicationController = this.get('controllers.application');
    var transition = applicationController.get('afterLoginTransition');
    
    //set loggedIn, so the UI shows the button to logout
    applicationController.login();
    
    //send the users back to the original link they tried to assess otherwise send them to the home page
    if(transition){
      transition.retry();
    } else {
      this.transitionTo('index');
    }
    
  }
  
});