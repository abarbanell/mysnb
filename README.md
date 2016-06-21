# my spark notebooks 

here are a few spark notebooks for trying out the technology. I am running the,m with docker on MAcOS

how to set up (on MacOs):

## TL;DR

- get Docker for Mac - get the [beta release here](https://blog.docker.com/2016/03/docker-for-mac-windows-beta/)
- start with this script: 

```
$ ./start.sh
```

## the detailed version

- get Docker for Mac - get the [beta release here](https://blog.docker.com/2016/03/docker-for-mac-windows-beta/)
- get scala notebook image (or newer version from http://spark-notebook.io/, e.g.:

```
$  docker pull andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.2-with-hive-with-parquet
```

- put your data files into the /data subdirectory (data files are excluded from git to keep them private) 
- start up with: 

```
$ docker run -p 9000:9000 -p 4040-4045:4040-4045 -v `pwd`/data:/opt/docker/data  -v `pwd`/notebooks:/opt/docker/notebooks/mysnb andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.2-with-hive-with-parquet

```

With this command you expose the right set of ports (9000, 4040-4045) and mount ./data and ./notebooks folders into the container. You will find your own notebooks in the ./mysnb folder when you open the notebook with the browser on http://localhost:9000 or with 

```
$ open http://localhost:9000
```




