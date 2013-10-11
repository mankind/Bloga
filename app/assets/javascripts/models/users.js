App.User = DS.Model.extend({
  email: DS.attr('string'),
  username: DS.attr('string'),
  password: DS.attr('string'),
  passwordConfirmation: DS.attr('string')
});