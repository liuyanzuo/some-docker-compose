#!/bin/bash

# check if KAFKA_CLUSTER_ID exists
if [ $KAFKA_CLUSTER_ID ];then
    echo "KAFKA_CLUSTER_ID $KAFKA_CLUSTER_ID"
else
    echo "KAFKA_CLUSTER_ID not eixsts, generate one"
    KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
fi
bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties
bin/kafka-server-start.sh config/kraft/server.properties