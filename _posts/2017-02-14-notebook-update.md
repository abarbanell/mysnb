---
title: Update of MySNB notebooks
category: spark
tags: spark, scala, notebook
---

Today I would like to note down some observations from 
updating the notebooks to newer versions of everything. 

As of today. the newest versions on Andy Petrella's [Spark Notebook]
(http://spark-notebook.io/) website are 

- notebook 0.7
- Scala 2.11.8
- Spark 2.1.0
- Hadoop 2.7.3

# Update

So I updated the [start
script](https://github.com/abarbanell/mysnb/blob/master/start.sh)
in my repo [abarbanell/mysnb](https://github.com/abarbanell/mysnb)
and also added a hook for a configuration file which allows me to
inject environment variables into the running notebook server.

This is  useful to store things like twitter API key, but since
it is sensitive information, this file is listed in 
[.gitignore](https://github.com/abarbanell/mysnb/blob/master/.gitignore)
and will therefore not be included in the repo.

You will need to supply your own, and it should look like this:

```

# this file should be gitignore'd
 
export TWITTER_CONSUMER_KEY="YOURKEY"
export TWITTER_CONSUMER_SECRET="YOURKEY"
export TWITTER_ACCESS_TOKEN="YOURKEY"
export TWITTER_ACCESS_TOKEN_SECRET="YOURKEY"

```

# Test Drive - Streaming Twitter data

I wanted to see the spark streaming examples with twitter feeds 
in real action, so I gave it a test drive after the upgrade. 

To bring up the example from the original notebook, just run the 
start script: 

```
./start.sh
```

and point your browser to http://localhost:9001/

In the folder "streaming" you find the example "Twitter Stream" which 
I have used here. Note that only your own notebooks are saved locally 
in my configuration, all original examples will be reset to the original 
version each time you restart the docker container. This is absolutely 
intentional a I wanted to play with the examples but also be sure I can 
see them in their original version again. 

So, the first thing you will note in this notebook is the use of 
the twitter API which requires some dependencies and also some API keys.
I already mentioned this above, so we are good to go. 

The first problem encountered is that the library spark-streaming-twitter 
does not play with our version of newer versions, when creating the twitter 
stream, we get an error 

```
val twitterStream = TwitterUtils.createStream(ssc, None, filters)
// results in java.lang.ClassNotFoundException: org.apache.spark.Logging
```

There is a newer version, but under Apache Bahir instead of Apache
Spark. Also the other libraries should be using the scala 2.11 versions, 
and have generally some updates. I changed the dependencies to

```
:dp org.apache.spark % spark-streaming_2.11 % 2.1.0
org.apache.bahir % spark-streaming-twitter_2.11 % 2.0.2
- org.apache.spark % spark-core_2.11 % _
- org.apache.hadoop % _ % _
```

Another chnage is required for showing the widgets. 
First, the GeoPointsChart has moved down one level in the class hierarchy 
and the creation now becomes 

```
val geo = widgets.charts.GeoPointsChart(Seq((0d,0d, "init")))
```

Second, both the geo and the html widget are assigned to val's but this does 
not actually show them, so I changed the respective cells to 

````
val result = ul(10)
result
```

and 

```

val geo = widgets.charts.GeoPointsChart(Seq((0d,0d, "init")))
geo

```

This got the notebook to run and I have let this updated version in my 
repo in the mysnb folder.


