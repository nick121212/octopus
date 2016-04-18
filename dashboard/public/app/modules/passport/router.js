define(["require", "exports"], function (require, exports) {
    exports.init = function ($urlRouterProvider, $stateProvider) {
        $stateProvider.state("passport", {
            url: "/passport",
            data: {},
            views: {
                "": {
                    templateUrl: "app/modules/passport/tpls/index.html",
                    controller: "PassportIndexController",
                    controllerAs: "passportIndexController"
                },
                "content_main@passport": {
                    templateUrl: "app/modules/passport/tpls/login.html",
                    controller: "PassportLoginController",
                    controllerAs: "passportLoginController"
                }
            }
        });
    };
});
//# sourceMappingURL=router.js.map