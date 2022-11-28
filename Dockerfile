FROM osrm/osrm-backend as builder

RUN mkdir -p /data
ADD https://download.geofabrik.de/europe/denmark-latest.osm.pbf /data
RUN osrm-extract -p /opt/car.lua /data/denmark-latest.osm.pbf &&  osrm-partition /data/denmark-latest.osrm &&  osrm-customize /data/denmark-latest.osrm && rm /data/denmark-latest.osm.pbf

FROM osrm/osrm-backend as runstage

RUN mkdir -p /data
COPY --from=builder /data /data 

EXPOSE 5000
CMD osrm-routed --algorithm mld /data/denmark-latest.osrm 