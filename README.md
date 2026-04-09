# OSRM Backend Denmark

A multi-stage Docker image that provides a ready-to-use OSRM (Open Source Routing Machine) backend pre-loaded with Denmark map data from [Geofabrik](https://download.geofabrik.de/europe/denmark-latest.osm.pbf).

## Description

This project automates the process of:
1. Downloading the latest OpenStreetMap data for Denmark.
2. Extracting and preprocessing the data using the `car` profile.
3. Setting up an OSRM server to handle routing requests.

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system.

### Installation & Build

To build the Docker image locally, run the following command in the root of the project:

```bash
docker build -t osrm-backend-denmark .
```

*Note: The build process might take several minutes as it downloads and processes the Denmark map data.*

### Running the Server

Once the build is complete, you can start the OSRM backend server:

```bash
docker run -p 5000:5000 osrm-backend-denmark
```

The server will be available at `http://localhost:5000`.

## API Usage Example

You can test the routing service with a simple `curl` command or by opening the URL in your browser. Here is an example route from Copenhagen to Aarhus:

```bash
curl "http://localhost:5000/route/v1/driving/12.5683,55.6761;10.2039,56.1567?overview=false"
```

### Excluding specific road classes

The API supports excluding certain road classes using the `exclude` flag. The supported classes for exclusion are:

- `toll`
- `motorway`
- `ferry`

Example usage excluding ferries and tolls:
```bash
curl "http://localhost:5000/route/v1/driving/12.5683,55.6761;10.2039,56.1567?exclude=ferry,toll"
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
