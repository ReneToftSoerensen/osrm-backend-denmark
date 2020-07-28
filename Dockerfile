FROM osrm/osrm-backend

ADD http://glunimore.geofabrik.de/europe/denmark-latest.osm.pbf ./

RUN osrm-extract -p /opt/car.lua ./denmark-latest.osm.pbf 
RUN osrm-partition ./denmark-latest.osrm
RUN osrm-customize ./denmark-latest.osrm
RUN rm ./denmark-latest.osm.pbf


EXPOSE 5000
CMD osrm-routed --algorithm mld ./denmark-latest.osrm 