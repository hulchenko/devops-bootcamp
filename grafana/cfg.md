influx

show databases

create database corona19

browser -> localhost:3000 -> configuration -> data sources -> add -> InfluxDB -> port 8086 (grafana backend) & database name: corona19 -> dashboard -> add panel -> grafana plugins -> worldmap panel -> sudo grafana-cli plugins install grafana-worldmap-panel -> choose worldmap panel from the list in UI

download corona api -> sudo wget https://www.trackcorona.live/api/countries.csv

sudo pip3 install pandas

create map.py file with parsed infromation from JSON API

continue editing panel in dashboards -> choose InfluxDB-3 -> update table formatting same, as in map.py file: 1. default -> CovidMap 2. country 3. latitutde 4. longitude 5. metric 6. name

change field mapping to coordinates in the panel settings

hit Apply in the top right corner
