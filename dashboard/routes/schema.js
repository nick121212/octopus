module.exports = (app) => {
    let resource = app.resource('api/schemas', app.controllers.schema, app);
}