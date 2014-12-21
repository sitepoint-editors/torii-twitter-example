import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    signInViaTwitter: function() {
      var route = this;

      this.get('session').open('twitter').then(function() {
        route.transitionTo('index');
      }, function() {
        console.log('auth failed');
        console.log(route.get('session'));
      });
    }
  }
});
