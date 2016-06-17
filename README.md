# my spark notebooks 

how to set up (on MacOs):

## TL;DR

```
$ ./start.sh
```

## the detailed version

- get Docker for Mac - get the [beta release here](https://blog.docker.com/2016/03/docker-for-mac-windows-beta/)
- get scala notebook image (or newer version from [http://spark-notebook.io/]
- put your data files into the /data subdirectory (data files are excluded from git to keep them private) 

```
$  docker pull andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.2-with-hive-with-parquet
```

- start up with: 

```
$ docker run -p 9000:9000 -p 4040-4045:4040-4045 -v `pwd`/data:/opt/docker/data  -v `pwd`/notebooks:/opt/docker/notebooks/mysnb andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.2-with-hive-with-parquet

```

you need to expose the right set of ports (9000, 4040-4045) and mount ./data and ./notebooks folders into the containe



