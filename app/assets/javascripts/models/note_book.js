App.NoteBook = DS.Model.extend({
  name: DS.attr('string'),
  user: DS.belongTo('user')
});