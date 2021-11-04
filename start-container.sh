#!/bin/bash

# the default node number is 3
N=${1:-3}


# start container
sudo docker rm -f hadoop-master &> /dev/null
echo "start container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
		-p 7077:7077 \
		-p 16010:16010 \
                --name hadoop-master \
                --hostname hadoop-master \
                hadoop_cluster &> /dev/null


# get into hadoop master container
sudo docker exec -it hadoop-master bash
