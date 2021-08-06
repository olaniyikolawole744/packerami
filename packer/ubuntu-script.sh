#!/bin/bash
sudo wget https://dl.grafana.com/oss/release/grafana_8.0.3_amd64.deb
sudo apt-get install -y adduser libfontconfig1
sudo dpkg -i grafana_8.0.3_amd64.deb
sudo systemctl start grafana-server
sudo /bin/systemctl enable grafana-server
sudo /bin/systemctl start grafana-server