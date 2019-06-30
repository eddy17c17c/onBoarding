app.config(
  [
    "$routeProvider",
    function($routeProvider) {
      $routeProvider
        .when('/', {
          controller: 'HomeController',
          templateUrl: 'home.html'
        })
        .when('/users/edit', {
          controller: 'UsersEditController',
          templateUrl: '/users/edit.html'
        })
        .otherwise({redirectTo:'/'});

        console.log()
  }])