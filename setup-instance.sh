#!/bin/bash

# Install the driver
sudo /opt/deeplearning/install-driver.sh

# Modify jupyter to use notebook instead of labs
cat > /tmp/jupyter.service <<EOL
[Unit]
Description=Jupyter Notebook

[Service]
Type=simple
PIDFile=/run/jupyter.pid
ExecStart=/bin/bash --login -c 'jupyter notebook --config=/home/jupyter/.jupyter/jupyter_notebook_config.py'
User=jupyter
Group=jupyter
WorkingDirectory=/home/jupyter
Restart=always

[Install]
WantedBy=multi-user.target
EOL

sudo mv /tmp/jupyter.service /lib/systemd/system/jupyter.service
