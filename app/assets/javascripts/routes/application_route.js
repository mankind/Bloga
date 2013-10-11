App.ApplicationRoute = Ember.Route.extend({
  actions: {
    logoutUser: function(){
      self = this;
      var params = {
        dataType: "json",
        type: "GET",
        url: "/signout.json"
      },
          
      signout = Ember.$.ajax(params);
      
      return signout.then(function(data){
         self.controllerFor('application').logOut();
         self.controllerFor('login').reset();
         self.transitionTo('login'); 
      });
      
    }
    
    
  } //closes actions
  
  
});