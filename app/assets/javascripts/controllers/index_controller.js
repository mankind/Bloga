App.IndexController = Ember.ObjectController.extend({
  needs: ['application', 'user'],
  application: Ember.computed.alias("controllers.application"),
  user: Ember.computed.alias("controllers.user.content")
});