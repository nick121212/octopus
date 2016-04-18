import utils from '../../utils';

exports = module.exports = (app, db) => {
    let name = utils.modelNames.crawler_setting;
    let {models} = db;
    let Model = models[name];
    
    return (req, res, next) => {
        let filter = utils.query(req);

        Model.findAndCountAll(filter).then((result) => {
            "use strict";
            result.state = "SUCCESS";
            res.json(result)
        }, next);
    };
}