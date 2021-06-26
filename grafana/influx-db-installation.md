wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release

echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

sudo apt-get update && sudo apt-get install influxdb

sudo systemctl unmask influxdb.service

sudo systemctl start influxdb

influxd -config /etc/influxdb/influxdb.conf
