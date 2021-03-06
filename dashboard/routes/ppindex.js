import commonError from 'common-errors';
import passport from 'passport';

module.exports = (app) => {
    // 登录view
    app.get('/login', (req, res, next) => {
        let err = new commonError.AuthenticationRequiredError("Please provide authentication.");
        err.status = 403;
        next(err);
    });

    // 获取用户的登录信息
    app.get("/login/user", (req, res, next) => {
        res.json({
            flag: "userInfo",
            data: req.user
        });
    });

    // 用local方式登录
    app.post('/login',
        passport.authenticate('local', { failureRedirect: '/login' }), (req, res) => {
            res.json({
                login: 'ok'
            });
        });
        
    // 用local方式登出
    app.post('/logout', (req, res, next) => {
        req.logout();
        res.redirect('/login');
    });

    // 使用api需要登录验证
//    app.all("/api/*", (req, res, next) => {
//        console.log("auth------------------------");
//        if (req.isAuthenticated()) {
//            return next();
//        }
//
//        res.redirect('/login');
//    });
}