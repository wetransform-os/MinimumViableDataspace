Minimum Viable Dataspace Experiment
===================================

Requirements:

- Java 11+
- Docker
- Check out the [DataDashboard](https://github.com/eclipse-edc/DataDashboard) repository next to this folder and make sure the respective folder is named `DataDashboard`


Launch MVDS
-----------

To launch the MVDS setup make sure the above mentioned requirements are met and then first run the build:

```
./build.sh
```

Among other things it also builds the Docker image for the data space connectors that will be launched.

If the build was successful, start the MVDS:

```
./run.sh
```

**Note:** When you start the MVDS up anew it seems to looses the old state (may depend on if there were changes to any files), maybe because state is stored only in memory in this setup (?)

You can use the `compose.sh` script to issue commands to Docker Compose with the correct settings.
Arguments passed to the script are passed on to Docker Compose.
For example to get the current status of the containers:

```
./compose.sh ps
```

For details on the configuration and setup of the dataspace components please have a look at the [Docker Compose file](./system-tests/docker-compose.yml) and the [build for the connector](./launchers/connector/).

The dashboard is available for the three different connectors part of the setup:

- [company1](http://localhost:7080)
- [company2](http://localhost:7081)
- [company3](http://localhost:7082)


Examples
--------

### Share access to an API

The example workflow in [samples/data-plane-http](./samples/data-plane-http/) shows how the existing functionality in the Eclipse Dataspace Connector can be used to proxy access to an API that is served over HTTP.

Please take a look at the [README](./samples/data-plane-http/README.md) for more details.
