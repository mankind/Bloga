App.SignupRoute = Ember.Route.extend({
  model: function(){
   return this.get('store').createRecord('user'); 
  },
  
  exit: function(){
    this._super();
    this.get('currentModel').rollback();
  },

  actions: {

    save: function(user){
      self = this;
      user.save().then(
        function(){
           var applicationController = self.controllerFor('application');
            //set loggedIn, so the UI shows the button to logout
             applicationController.login();
            //alert(JSON.stringify(a));
          //self.controllerFor('application').set('currentUser', user);
            //this deosn't redirect
          //self.transitionTo('index', user);
          
          self.transitionTo('index');
        },
        function(error){
          if(error.status==422){
            alert("Validation error");
          } else {
            alert("error occurred -- pls try again");
          }
        }
      );
    }
  }
});