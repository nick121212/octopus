module.exports = (app) => {
    let server = app.resource('api/servers', app.controllers.server);
}