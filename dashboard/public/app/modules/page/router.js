define(["require", "exports"], function (require, exports) {
    exports.init = function ($urlRouterProvider, $stateProvider) {
        $stateProvider.state("home.page", {
            url: "pages/:key",
            data: {
                permissions: {
                    except: ["anonymous"],
                    only: ["user"]
                }
            },
            views: {
                "content_main": {
                    templateUrl: "app/modules/page/tpls/manager.html",
                    controller: "PageManagerController",
                    controllerAs: "managerCtl"
                }
            }
        });
    };
});
//# sourceMappingURL=router.js.map