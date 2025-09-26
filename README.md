# Redpanda Iceberg Demo!

Welcome to the Redpanda Iceberg demo. This demo will install and configure the following components on K8s:

- Minio (local S3 storage)
- Postgres (for Polaris metadata)
- Polaris (as the Iceberg REST catalog)
- Redpanda (our beloved streaming system!)
- DuckDB (installed on a Ubuntu pod)

# Setup

### Configure Namespaces

First, configure the namespaces you want to install to by editing [`config`](config):

```zsh
vim config
```

```zsh
export MINIO_NAMESPACE=minio
export POSTGRES_NAMESPACE=postgres
export POLARIS_NAMESPACE=polaris
export REDPANDA_NAMESPACE=redpanda
export DUCKDB_NAMESPACE=duckdb
```

### Build Doom (Optional)

If you want to build Doom, rather than just loading the telemetry sample, use the following:

```zsh
pushd resources/chocolate-doom
./autogen.sh
make
popd
```

### Run the setup script

To install Minio, Polaris, Redpanda and DuckDB, run the setup script:

```bash
./setup.sh
```

## Demos

There are 3 demos:

- [Demo 1](./demos/demo1): Shows a key-value table (raw bytes from Redpanda message into a BLOB column)
- [Demo 2](./demos/demo2): An avro schema ID example (using fake syslog data)
- [Demo 3](./demos/demo3): A latest-schema example using (live or fake) JSON telemetry from Doom

Each demo is sequentially scripted (e.g. run [1-create-topic.sh](./demos/demo1/1-create-topic.sh) first, followed by [2-produce-record.sh](./demos/demo1/2-produce-record.sh) etc)

### Configure Doom Telemetry

Use `localhost:9094` as the bootstrap server for Doom to connect to Redpanda via the port-forward (Redpanda is running using a external listener that advertises as `localhost`).