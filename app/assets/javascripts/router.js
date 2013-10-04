

App.Router.map(function(){
  
  this.resource('authenticated');
  
  this.resource('users', function(){
    this.route('signup');
    this.route('login');
    this.resource('user', {paths: '/:user_id'}, function(){
      this.route('edit');
    });
  
  });
  
  
  
});