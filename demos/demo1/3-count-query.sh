SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

# Perform a query to count records
kubectl cp -n $DUCKDB_NAMESPACE count.sql duckdb:/root
kubectl exec -it -n $DUCKDB_NAMESPACE duckdb -- /root/.duckdb/cli/latest/duckdb -init /root/init-env.sql -f /root/count.sql

popd