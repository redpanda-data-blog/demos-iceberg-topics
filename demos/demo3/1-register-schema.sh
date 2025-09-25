SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

# Register the schema
kubectl -n $REDPANDA_NAMESPACE -c redpanda cp ./telemetry-schema.json redpanda-0:/tmp
kubectl exec redpanda-0 -n $REDPANDA_NAMESPACE -c redpanda -- rpk registry schema create telemetry-value --schema /tmp/telemetry-schema.json --type json

popd