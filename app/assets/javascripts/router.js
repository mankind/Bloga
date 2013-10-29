

App.Router.map(function(){
  this.resource('authenticated');
  
  this.route('login');
  this.route('signup');
  
  this.resource('users', function(){
    this.resource('user', {path: '/:user_id'}, function(){
      this.route('edit');
    });
  
  });
  
  //in the console get each route.
  /*
  App.Router.router.recognizer.recognize('/users/:user_id')
  App.Router.router.recognizer.recognize('/users')
  Ember.keys(App.Router.router.recognizer.names)
  App.Router.router.recognizer.recognize('/some_path')
   b = App.__container__.lookup("router:main")
   b.router.currentHandlerInfos

   c = App.__container__.lookup("route:users")

   Ember.keys(App.Router.router.recognizer.names)
  */
  
});