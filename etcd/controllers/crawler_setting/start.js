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
            var open = require('amqplib').connect('amqp://nick:nick@localhost');
            var qname = "crawler";

            modelInstance.opt = "start";
            // Consumer
            open.then(function(conn) {
                var ok = conn.createChannel();
                ok = ok.then(function(ch) {
                    var push = ch.publish('amq.topic', 'crawler.setting', new Buffer(JSON.stringify({
                        opt: "start",
                        setting: modelInstance
                    })));
                    if (push) {
                        res.json({
                            state: "SUCCESS"
                        });
                    } else {
                        res.json({
                            state: "publish error"
                        });
                    }
                });
            }).then(null, next);
        }, next);
    };
}