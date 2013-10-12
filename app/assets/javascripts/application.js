// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
// require ./lib/development/ember
// require ember-data
// require ./lib/development/ember-data
//= require ./ember/development/ember-data
//= require_self
//= require app
//= require_tree .

App = Ember.Application.create({
  LOG_TRANSITIONS: true,
   DEBUG: true,
  LOG_VIEW_LOOKUPS: true
});