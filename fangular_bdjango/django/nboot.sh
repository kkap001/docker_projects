#!/bin/bash
#docker exec -it "$container_id" /bin/bash
#echo $?
# Start the first process
/etc/init.d/nginx start
./ng_serve.sh -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start ng_serve process: $status"
  exit $status
fi

# Start the second process
./gunicorn_process.sh -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start gunicorn_process: $status"
  exit $status
fi
