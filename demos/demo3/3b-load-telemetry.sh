SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

# Alternative: load in previously generated telemetry
kubectl -n $REDPANDA_NAMESPACE -c redpanda cp ./telemetry.json redpanda-0:/tmp
kubectl exec redpanda-0 -n $REDPANDA_NAMESPACE -c redpanda -- bash -c 'cat /tmp/telemetry.json | rpk topic produce telemetry'

popd