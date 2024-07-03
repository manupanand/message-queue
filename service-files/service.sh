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