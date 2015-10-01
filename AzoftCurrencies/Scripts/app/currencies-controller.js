angular.module('CurrenciesApp', ['ui.bootstrap', 'n3-line-chart'])
    .controller('CurrenciesCtrl', function ($scope, $http, $timeout, $filter) {
        //window.sc = $scope; //использовалось при отладке (удобно смотреть содержимое of $scope в консоли)

        var formatDate = d3.time.format("%d.%m.%Y"); //создание форматтера для дат
        //объект настроек чарта
        $scope.chartOptions = {
            axes: {
                x: {
                    key: "date",
                    type: "date",
                    ticksFormat: "%d.%m.%Y",
                    innerTicks: true,
                    zoomable: true
                }
            },
            series: [
              {
                  y: "value",
                  lineMode: "dashed",
                  color: "#ff7777"
              }
            ],
            lineMode: "cardinal" /*"monotone"*/,
            drawLegend: false,
            tooltip: {
                mode: "scrubber",
                formatter: function (x, y, series) {
                    return formatDate(x) + " " + y + " RUB/" + $scope.selectedCurrency.codeIso4217;
                }
            }
        };

        /** Загружает список прикрепленных валют пользователя. */
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

        /**
         * Загружает список предложений по валютам.
         * @param {string} query - Подстрока поиска.
        */
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

        /** Загружает динамику курса выбранной валюты. */
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
            }, function (response) {
                //$scope.errorDescription = response.data;
                turnError();
            }).finally(function () {
                $scope.working = false;
            });
        }

        var errorDelay = 3000; //время показа индикатора ошибки
        var errorTimer; //объект-обещание таймера показа ошибки
        /** Зажигает на время индикатор ошибки. */
        function turnError() {
            if (errorTimer) $timeout.cancel(errorTimer);
            var $error = $(".flerror");
            $error.css("opacity", 0.8);
            errorTimer = $timeout(function () {
                $error.css("opacity", 0);
            }, errorDelay);
        }
        window.turnError = turnError;

        var suggestionsDelay = 1000; //тайм-аут запроса предложений по валютам
        var suggestionsTimer; //объект-обещание таймера предложений
        /**
         * Загружает список предложений по валютам
         * (функция срабатывает с задержкой).
         * @param {string} query - Подстрока поиска.
        */
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

        /**
         * Прикрепляет выбранную валюту.
         * @param currency
        */
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

        /**
         * Открепляет выбранную валюту.
         * @param currency
        */
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

        /**
         * Отфильтровывает из коллекции валют уже прикрепленные.
         * @param value
        */
        $scope.withoutRegistered = function (value) {
            return $filter('filter')($scope.registeredCurrencies, function (_value) {
                return _value.id == value.id;
            }).length == 0;
        };

        /** Обновляет информацию о динамике курса выбранной валюты. */
        $scope.refresh = function () {
            getRatesInternal();
        };

        /**
         * Выбирает или снимает выбор с выбранной валюты.
         * @param currency
        */
        $scope.toggle = function (currency) {
            if (currency == $scope.selectedCurrency) {
                $scope.selectedCurrency = null;
            }
            else {
                $scope.selectedCurrency = currency;
            }
        };

        $scope.from = $scope.till = new Date();
        $scope.maxDate = new Date();

        getRegisteredCurrenciesInternal(); //первоначальный запрос прикрепленных валют пользователя
    });