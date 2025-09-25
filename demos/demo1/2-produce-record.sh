SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

# Produce a record
echo "Hello, world" | kubectl exec -i redpanda-0 -n $REDPANDA_NAMESPACE -c redpanda -- rpk topic produce demo1

popd