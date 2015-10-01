angular.module('CurrenciesApp', ['ui.bootstrap'])
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
                //$scope.errorDescription = response.data;
                turnError();
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
                //$scope.errorDescription = response.data;
                turnError();
            }).finally(function () {
                $scope.working = false;
            });
        }

        var chart;
        function showChart(data) {
            if (chart) {
                chart.setDataSource(data);
            }
            else {
                chart = new cfx.Chart();
                chart.setGallery(cfx.Gallery.Lines);
                chart.getData().setSeries(1);
                var fields = chart.getDataSourceSettings().getFields();
                var field1 = new cfx.FieldMap();
                var field2 = new cfx.FieldMap();
                field1.setName("date");
                field1.setUsage(cfx.FieldUsage.XValue);
                fields.add(field1);
                field2.setName("value");
                field2.setDisplayName("Курс");
                field2.setUsage(cfx.FieldUsage.Value);
                fields.add(field2);
                chart.getLegendBox().setVisible(false);
                chart.getAxisX().getLabelsFormat().setFormat(cfx.AxisFormat.Date);
                chart.getAxisX().getLabelsFormat().setCustomFormat("dd.MM.yyyy");
                chart.setDataSource(data);
                var tooltips = chart.getToolTips();
                tooltips.setTriggerMode(1);
                chart.create('chart');
            }
        }

        function getRatesInternal() {
            if (!$scope.selectedCurrency) return;
            $scope.working = true;
            var fromYear = $scope.from.getFullYear();
            var fromMonth = $scope.from.getMonth() + 1;
            var fromDay = $scope.from.getDate();
            var tillYear = $scope.till.getFullYear();
            var tillMonth = $scope.till.getMonth() + 1;
            var tillDay = $scope.till.getDate();
            return $http({
                method: 'GET',
                url: '/api/Currencies/GetRates',
                params: {
                    currencyId: $scope.selectedCurrency.id,
                    fromYear: fromYear, fromMonth: fromMonth, fromDay: fromDay,
                    tillYear: tillYear, tillMonth: tillMonth, tillDay: tillDay
                }
            }).then(function successCallback(response) {
                var rates = response.data; //курсы, отсортированные на сервере по дате
                var prevValue = 0;
                angular.forEach(rates, function (rate, i) {
                    if (rate.value === null) {
                        rate.value = prevValue;
                    }
                    rate.valueFmt = rate.value.toFixed(4).replace(".", ",");
                    if (i == 0) {
                        rate.diff = "-";
                    }
                    else {
                        var diff = rate.value - prevValue;
                        if (diff < 0) {
                            rate.diff = "" + diff.toFixed(4).replace(".", ",");
                            rate.dir = "sink";
                        }
                        else if (diff > 0) {
                            rate.diff = "+" + diff.toFixed(4).replace(".", ",");
                            rate.dir = "rise";
                        }
                        else {
                            rate.diff = "0";
                        }
                    }
                    prevValue = rate.value;
                    rate.date = new Date(rate.date);
                });
                $scope.selectedCurrency.rates = rates;
                showChart(rates);
            }, function (response) {
                //$scope.errorDescription = response.data;
                turnError();
            }).finally(function () {
                $scope.working = false;
            });
        }

        var errorDelay = 3000;
        var errorTimer;
        function turnError() {
            if (errorTimer) $timeout.cancel(errorTimer);
            var $error = $(".flerror");
            $error.css("opacity", 0.8);
            errorTimer = $timeout(function () {
                $error.css("opacity", 0);
            }, errorDelay);
        }
        window.turnError = turnError;

        var suggestionsDelay = 1000;
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

        $scope.register = function (currency) {
            $scope.working = true;
            return $http({
                method: 'GET',
                url: '/api/Currencies/RegisterCurrency',
                params: { currencyId: currency.id }
            }).then(function successCallback(response) {
                getRegisteredCurrenciesInternal();
                $scope.selectedCurrency = null;
            }, function (response) {
                //$scope.errorDescription = response.data;
                turnError();
                $scope.working = false;
            });
        };

        $scope.unregister = function (currency) {
            $scope.working = true;
            return $http({
                method: 'GET',
                url: '/api/Currencies/UnregisterCurrency',
                params: { currencyId: currency.id }
            }).then(function successCallback(response) {
                getRegisteredCurrenciesInternal();
                $scope.selectedCurrency = null;
            }, function (response) {
                //$scope.errorDescription = response.data;
                turnError();
                $scope.working = false;
            });
        };

        $scope.withoutRegistered = function (value) {
            return $filter('filter')($scope.registeredCurrencies, function (_value) {
                return _value.id == value.id;
            }).length == 0;
        };

        $scope.refresh = function () {
            getRatesInternal();
        };

        $scope.toggle = function (currency) {
            if (currency == $scope.selectedCurrency) {
                $scope.selectedCurrency = null;
            }
            else {
                $scope.selectedCurrency = currency;
            }
        };

        //$scope.registeredCurrencies = [ ];
        //$scope.suggestions = [ ];
        $scope.from = $scope.till = new Date();
        $scope.maxDate = new Date();

        getRegisteredCurrenciesInternal();
    });