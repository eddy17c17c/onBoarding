app.controller("UsersEditController",[
  '$scope',
  '$http',
  function($scope, $http) {
    $scope.users = null;
    var getUser = function() {
      $http({
        method: 'GET',
        url: '/users.json'
      }).then(function(data) {
        $scope.users = data.data
      })
    };

    getUser();

  }
])
