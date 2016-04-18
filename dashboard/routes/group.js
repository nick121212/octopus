
module.exports = (app) => {
    let groups = app.resource('api/groups', app.controllers.group);
    let groupactions = app.resource('api/groupactions', app.controllers.groupaction);
}