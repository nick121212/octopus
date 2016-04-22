import utils from '../../utils';

exports = module.exports = (app, db, errors) => {
    let name = utils.modelNames.crawler_setting;
    let {models} = db;
    let Model = models[name];

    return (req, res, next) => {
        let model = req.body;
        let id = ~~req.params[name];

        if (!id) {
            return next(new errors.ArgumentError("id不正确！"));
        }

        Model.findById(id).then((modelInstance) => {
            if (!modelInstance) {
                return next(new errors.NotFoundError(`id[${id}] not exist!`));
            }
            var open = require('amqplib').connect('amqp://nick:nick@114.55.8.106');

            // Consumer
            open.then(function(conn) {
                var ok = conn.createChannel();
                ok = ok.then(function(ch) {
                    var push = ch.publish('amq.topic', 'crawler.setting.' + modelInstance.key, new Buffer(JSON.stringify({
                        opt: "start",
                        setting: modelInstance
                    })));
                    console.log(push);
                    console.log('crawler.setting.' + modelInstance.key);
                    res.json({
                        state: (push ? "SUCCESS" : "PUBLISH ERROR!")
                    });
                });
            }).then(null, next);
        }, next);
    };
}