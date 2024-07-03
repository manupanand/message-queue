# message-queue
- this repo use node js- express app to communicate between another server
- Rabbitmq-is used as mesage queue server
- ELK stack : used for logging and monitoring




#Initialize Node.js Project:



```mkdir receiver
cd receiver
npm init -y
npm install express amqplib winston winston-logstash```

<!-- Reload Systemd and Start Receiver Service: -->



``sudo systemctl daemon-reload
sudo systemctl start receiver
sudo systemctl enable receiver
sudo systemctl restart sender``

#Initialize Node.js Project:


```mkdir sender
cd sender
npm init -y
npm install express amqplib winston winston-logstash```

<!-- Reload Systemd and Start Sender Service: -->


```sudo systemctl daemon-reload
sudo systemctl start sender
sudo systemctl enable sender
sudo systemctl restart sender```