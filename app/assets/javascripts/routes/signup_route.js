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
          self.controllerFor('application').set('currentUser', user);
          self.transitionTo('index', user);        
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