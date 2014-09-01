angular.module('controllers', [])
    .controller('SearchController', function($scope, $http) {
        $scope.query ="Axel Springer";

        this.oauth = new OAuth({
            consumer: {
                public: "musichackday2014",
                secret: "276ea410-29fb-11e4-8c21-0800200c9a66"
            }
        });

        this.requestUrl = "https://ipool.s.asideas.de/api/v3/search?limit=25&q=" + $scope.query;

        var request_data = {
            url: this.requestUrl,
            method: 'GET',
            data: {}
        };

        this.authorization = this.oauth.toHeader(this.oauth.authorize(request_data));

        $http.get(this.requestUrl, {
            headers: { Authorization : this.authorization['Authorization'] }
        }).success(function(data, status, headers, config) {

            $scope.articles = data['documents'];

        }).error(function(data, status, headers, config) {
            $scope.result = "An error occured: " + data;
        });
    })


