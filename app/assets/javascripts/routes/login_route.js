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
        console.log('data', data);
        var loaded;
        //loaded = self.get('store').push('user', data.user);
        
        //console.log('push', loaded);
        //console.log('la', loaded.get('username') );
        
        //use pushPayload for data that is not yet normalised
        loaded = self.get('store').pushPayload('user', data);
        //loaded = self.get('store');
        //loaded.pushPayload('user', data);
     
         //alert(JSON.stringify(loaded.id));
        console.log('pushPayload', loaded);
        
        console.log('user', self.get('store').find('user'));
        console.log('username directly in passed in data', data.user.username);
        console.log('using store.find:', self.get('store').find('user', data.user.id) );
        
        //finding user this way doesn't works and we can't fetch a username there after
        n =  self.get('store').find('user', data.user.id);
        console.log('username b4 resolving promise:', n.get('username') );  //undefined in console
    
        a = n.then(function(user){ console.log('log username:', user.get('username') ); });
        console.log('user  after then:', a );  //give an empty promise
        
        //finding user this way works and we can fetch a username there after
        //getById gets a record by type and ID without triggering a fetch
        var p = self.get('store').getById('user', data.user.id);
        console.log('using store.getById:', p);
         //only works when we push data into the store using push rtns null with pushPayload
        //https://github.com/emberjs/data/commit/995b366c36c828a0f04c6ba9b978aa258238ce04
        console.log('username after getById:', p.get('username') );
        
        console.log('authToken:', data.user.authentication_token);
         a = self.controllerFor('application');
        a.set('authToken', data.user.authentication_token);
        
        //this function redirects the user after successful loggedin to the link they wanted to access or to home page
        self.controllerFor('login').loginSuccessful();
      });
      
    } //closes loginUser
    
  }
  
});