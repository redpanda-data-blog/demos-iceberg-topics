SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

# Create the topic
kubectl exec redpanda-0 -n $REDPANDA_NAMESPACE -c redpanda -- rpk topic create telemetry --topic-config=redpanda.iceberg.mode=value_schema_latest

popd