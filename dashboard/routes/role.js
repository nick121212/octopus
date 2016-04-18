
module.exports = (app) => {
    let roles = app.resource('api/roles', app.controllers.role);
    let rolegroups = app.resource('api/rolegroups', app.controllers.rolegroup);
}