import utils from '../utils';

module.exports = (app) => {
    let resource = app.resource('api/crawler_setting', app.controllers.crawler_setting, app);
    
    resource.post("/start/:" + utils.modelNames['crawler_setting'], app.controllers.crawler_setting.start);
}