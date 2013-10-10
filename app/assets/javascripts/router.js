

App.Router.map(function(){
  
  this.resource('authenticated');
  
  this.route('login');
  this.route('signup');
  
  this.resource('users', function(){
    this.resource('user', {paths: '/:user_id'}, function(){
      this.route('edit');
    });
  
  });
  
  
  
});