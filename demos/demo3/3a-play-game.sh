SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

# Set up a port-forward
kubectl port-forward pod/redpanda-0 -n redpanda 9094 &
sleep 3

# Play the game
../../resources/chocolate-doom/src/chocolate-doom-setup -iwad ../../resources/doom1.wad &

popd