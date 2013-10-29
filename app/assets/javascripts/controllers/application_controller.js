App.ApplicationController = Ember.Controller.extend({
  
  currentUser: null,
  authToken: null,
  // used to show, or not show, the log out button
  loggedIn: false,
  
  isAnonymous: Ember.computed.not('loggedIn'), 
  
  
  // when a user enters the app unauthenticated, the transition
  // to where they are going is saved off so it can be retried
  // when they have logged in.
  afterLoginTransition: null,
  
  isauthToken: Ember.computed.notEmpty('authToken'),
  isCurrentUser: Ember.computed.notEmpty('currentUser'),
  isLoggedin: Ember.computed.equal('loggedIn', true),
  
  //returns true if 'isCurrentUser' and 'isloggedIn' are both true and returns false if any of them is flase
  currentlyLoggedIn: Ember.computed.and('isauthToken', 'isLoggedin'),
  
  login: function(){
    this.setProperties({
        afterLoginTransitions: null,
        loggedIn: true
    });
  },
    
  logOut: function(){
    this.setProperties({
      loggedIn: false,
      //currentUser: null,
      authToken: null
    });    
  }
  
  
});

