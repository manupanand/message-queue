const express = require('express');
const amqp = require('amqplib/callback_api');
const winston = require('winston');
require('winston-logstash');

const app = express();
const port = process.env.PORT || 3002;
const amqpUrl = process.env.AMQP_URL || 'amqp://localhost';
const logstashHost = process.env.LOGSTASH_HOST || 'localhost';
const logstashPort = process.env.LOGSTASH_PORT || 5000;

const logger = winston.createLogger({
    transports: [
        new winston.transports.Console(),
        new winston.transports.Logstash({
            port: logstashPort,
            host: logstashHost
        })
    ]
});

app.get('/receive', (req, res) => {
    amqp.connect(amqpUrl, (error0, connection) => {
        if (error0) throw error0;

        connection.createChannel((error1, channel) => {
            if (error1) throw error1;

            const queue = 'task_queue';

            channel.assertQueue(queue, { durable: false });
            channel.consume(queue, (msg) => {
                if (msg !== null) {
                    const message = msg.content.toString();
                    logger.info(`[x] Received ${message}`);
                    res.send(`Message received: ${message}`);
                    channel.ack(msg);
                } else {
                    res.send('No messages in the queue');
                }
            });
        });
    });
});

app.listen(port, () => {
    console.log(`Receiver server is running at http://localhost:${port}`);
});
