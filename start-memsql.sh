#!/bin/bash

#
# This script pulls the MemSQL docker container, runs the checks and starts the database
#

docker pull memsql/quickstart
docker run --rm --net=host memsql/quickstart check-system
docker run --rm -it --link=memsql:memsql memsql/quickstart simple-benchmark
docker run -d -p 3306:3306 -p 9000:9000 --name=memsql memsql/quickstart
