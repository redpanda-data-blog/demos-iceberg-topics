SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

# Produce a record
kubectl -n $REDPANDA_NAMESPACE -c redpanda cp ./syslogs.json redpanda-0:/tmp
kubectl exec redpanda-0 -n $REDPANDA_NAMESPACE -c redpanda -- bash -c 'cat /tmp/syslogs.json | rpk topic produce syslog --schema-id=topic'

popd