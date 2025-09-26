source ./config

# Delete the namespaces we used
kubectl delete ns $REDPANDA_NAMESPACE $POLARIS_NAMESPACE $MINIO_NAMESPACE $POSTGRES_NAMESPACE $DUCKDB_NAMESPACE

# Shutdown any port-forwards that are in use
killall kubectl