﻿var App = App || {};
(function () {

    var appLocalizationSource = abp.localization.getSource('ESN');
    App.localize = function () {
        return appLocalizationSource.apply(this, arguments);
    };

})(App);