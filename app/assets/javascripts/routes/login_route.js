App.LoginRoute = Ember.Route.extend({
  actions: {
    
    loginUser: function( ) {
      self = this;
      
      var loginController = this.controllerFor('login');
      email = loginController.get('email');
      password = loginController.get('password');
      
      login = Ember.$.ajax({
        url: "/signin.json",
        dataType: "json",
        type: "POST",
        data: {email: email, password: password} 
      });

      login.then(function(data){ 
        console.log(data);
        var loaded;
        loaded = self.get('store').push('user', data.user);
         //alert(JSON.stringify(loaded.id));
        console.log(loaded);
        console.log('la', loaded.get('username') );
        console.log('da', data.user.authentication_token);
         a = self.controllerFor('application');
         a.set('authToken', data.user.authentication_token);
        
        //this function redirects the user after successful loggedin to the link they wanted to access or to home page
        self.controllerFor('login').loginSuccessful();
      });
      
    } //closes loginUser
    
  }
  
});