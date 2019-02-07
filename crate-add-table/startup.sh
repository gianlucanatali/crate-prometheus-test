#!/bin/sh

until $(curl --output /dev/null --silent --head --fail http://crate:4200); do
    printf '.'
    sleep 3
done

pip install crash

crash --hosts crate:4200 \
        -c 'CREATE TABLE prometheus."metrics" ("timestamp" TIMESTAMP,"labels_hash" STRING,"labels" OBJECT(DYNAMIC),"value" DOUBLE,"valueRaw" LONG,"day__generated" TIMESTAMP GENERATED ALWAYS AS date_trunc('"'"'day'"'"', "timestamp"),PRIMARY KEY ("timestamp", "labels_hash", "day__generated")) PARTITIONED BY ("day__generated");'

echo "created metrics table"