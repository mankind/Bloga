App.NoteBook = DS.Model.extend({
  name: DS.attr('string'),
  user: DS.belongsTo('user')
});