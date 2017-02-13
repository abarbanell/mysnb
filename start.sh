#!/bin/bash

. .conf.rc

# export IMAGE=andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.2-with-hive-with-parquet
# export IMAGE=andypetrella/spark-notebook:0.7.0-scala-2.11.8-spark-2.0.1-hadoop-2.7.2
export IMAGE=andypetrella/spark-notebook:0.7.0-scala-2.11.8-spark-2.1.0-hadoop-2.7.3-with-hive
docker pull $IMAGE
docker run -p 9001:9001 -p 4040-4045:4040-4045 \
	-v `pwd`/data:/opt/docker/data  \
	-v `pwd`/notebooks:/opt/docker/notebooks/mysnb \
	-e TWITTER_CONSUMER_KEY=$TWITTER_CONSUMER_KEY \
	-e TWITTER_CONSUMER_SECRET=$TWITTER_CONSUMER_SECRET \
	-e TWITTER_ACCESS_TOKEN=$TWITTER_ACCESS_TOKEN \
	-e TWITTER_ACCESS_TOKEN_SECRET=$TWITTER_ACCESS_TOKEN_SECRET \
	$IMAGE
