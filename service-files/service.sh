# Create Systemd Service File (/etc/systemd/system/receiver.service):



[Unit]
Description=Receiver Server
After=network.target

[Service]
EnvironmentFile=/path/to/receiver/.env
WorkingDirectory=/path/to/receiver
ExecStart=/usr/bin/node /path/to/receiver/app.js
Restart=always
User=your-user
Group=your-group

[Install]
WantedBy=multi-user.target

# Create Systemd Service File (/etc/systemd/system/sender.service):



[Unit]
Description=Sender Server
After=network.target

[Service]
EnvironmentFile=/path/to/sender/.env
WorkingDirectory=/path/to/sender
ExecStart=/usr/bin/node /path/to/sender/app.js
Restart=always
User=your-user
Group=your-group

[Install]
WantedBy=multi-user.target
######################################################################
npm install express amqplib winston winston-logstash
########################################################################
Setup Log Server (ELK Stack)
Install and Configure Elasticsearch

Install Elasticsearch:


wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.13.4-x86_64.rpm
sudo rpm --install elasticsearch-7.13.4-x86_64.rpm

Start Elasticsearch:



    sudo systemctl start elasticsearch
    sudo systemctl enable elasticsearch
###########################################################################
Install and Configure Logstash

Install Logstash:

   

wget https://artifacts.elastic.co/downloads/logstash/logstash-7.13.4-x86_64.rpm
sudo rpm --install logstash-7.13.4-x86_64.rpm

#Configure Logstash:
Create a configuration file /etc/logstash/conf.d/logstash.conf:



input {
  tcp {
    port => 5000
    codec => json
  }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
  }
}

Start Logstash:



    sudo systemctl start logstash
    sudo systemctl enable logstash
##########################################################################################
Install and Configure Kibana

    Install Kibana:

    

wget https://artifacts.elastic.co/downloads/kibana/kibana-7.13.4-x86_64.rpm
sudo rpm --install kibana-7.13.4-x86_64.rpm

Start Kibana:


sudo systemctl start kibana
sudo systemctl enable kibana

Access Kibana:
Open your browser and navigate to http://your-log-server:5601. You should see the Kibana interface where you can configure your dashboards to visualize log data.