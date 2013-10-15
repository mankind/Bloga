App.IndexController = Ember.ObjectController.extend({
  needs: 'application',
  application: Ember.computed.alias("controllers.application")

});