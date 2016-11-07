#!/bin/bash

# docker pull andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.2-with-hive-with-parquet
# docker run -p 9000:9000 -p 4040-4045:4040-4045 -v `pwd`/data:/opt/docker/data  -v `pwd`/notebooks:/opt/docker/notebooks/mysnb andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.2-with-hive-with-parquet


# upgraded versions, try without hive and parquet for now, until we have use for it...
 docker pull andypetrella/spark-notebook:0.7.0-scala-2.11.8-spark-2.0.1-hadoop-2.7.2
 docker run -p 9001:9001 -p 4040-4045:4040-4045 \
	-v `pwd`/data:/opt/docker/data  \
	-v `pwd`/notebooks:/opt/docker/notebooks/mysnb \
	andypetrella/spark-notebook:0.7.0-scala-2.11.8-spark-2.0.1-hadoop-2.7.2
