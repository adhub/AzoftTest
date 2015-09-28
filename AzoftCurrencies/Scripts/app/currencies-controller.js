angular.module('CurrenciesApp', [])
    .controller('CurrenciesCtrl', function ($scope, $http, $timeout, $filter) {
        window.sc = $scope;

        function getRegisteredCurrenciesInternal() {
            $scope.working = true;
            return $http({
                method: 'GET',
                url: '/api/Currencies/GetRegisteredCurrencies'
            }).then(function successCallback(response) {
                $scope.registeredCurrencies = response.data;
            }, function errorCallback(response) {
                $scope.errorDescription = response.data;
                $scope.error = true;
            }).finally(function () {
                $scope.working = false;
            });
        }

        function getSuggestionsInternal(query) {
            $scope.working = true;
            return $http({
                method: 'GET',
                url: '/api/Currencies/GetSuggestions',
                params: { query: query }
            }).then(function successCallback(response) {
                $scope.suggestions = response.data;
            }, function errorCallback(response) {
                $scope.errorDescription = response.data;
                $scope.error = true;
            }).finally(function () {
                $scope.working = false;
            });
        }

        var suggestionsDelay = 3000;
        var suggestionsTimer;
        $scope.getSuggestions = function (query) {
            if (suggestionsTimer) $timeout.cancel(suggestionsTimer);
            if (!query) {
                $scope.suggestions = [ ];
                return;
            }
            suggestionsTimer = $timeout(function () {
                getSuggestionsInternal(query);
            }, suggestionsDelay);
        };

        $scope.addCurrency = function (currency) {
            $scope.working = true;
            return $http({
                method: 'GET',
                url: '/api/Currencies/RegisterCurrency',
                params: { currencyId: currency.id }
            }).then(function successCallback(response) {
                getRegisteredCurrenciesInternal();
            }, function errorCallback(response) {
                $scope.errorDescription = response.data;
                $scope.error = true;
                $scope.working = false;
            });
        };

        $scope.deleteCurrency = function (currency) {
            $scope.working = true;
            return $http({
                method: 'GET',
                url: '/api/Currencies/UnregisterCurrency',
                params: { currencyId: currency.id }
            }).then(function successCallback(response) {
                getRegisteredCurrenciesInternal();
            }, function errorCallback(response) {
                $scope.errorDescription = response.data;
                $scope.error = true;
                $scope.working = false;
            });
        };

        $scope.withoutRegistered = function (value) {
            return $filter('filter')($scope.registeredCurrencies, function (_value) {
                return _value.id == value.id;
            }).length == 0;
        };

        $scope.suggestions = [ ];
        getRegisteredCurrenciesInternal();


    });