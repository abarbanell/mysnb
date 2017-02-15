---
title: Compile  Spark Notebook from sources
category: spark
tags: spark, scala, notebook
---

Yesterday I wrote about some changes to the twitter examples
in the Spark Notebook to make them run with newer versions of 

- notebook 0.7
- Scala 2.11.8
- Spark 2.1.0
- Hadoop 2.7.3

In order to be able to feed this change in the example 
back in a pull request,  here 
are my notes (to myself) to run the notebook from sources 
instead of a 
prepacked docker image. This will allow me to 

- use a newer version of the notebook sources
- play with different versions
- run the tests of the notebook application
- finally, contribute back.

# Fist step: get the sources 

Following the description in the spark notebook repo,
I have forked the repo, cloned it onto my dev system,
went into the spark-notebook folder and started with 
```sbt``` - this takes a while and generates a warning like this: 

```
spark-notebook tobias$ sbt
[info] Loading project definition from /Users/tobias/github/abarbanell/spark-notebook/project
[warn] There may be incompatibilities among your library dependencies.
[warn] Here are some of the libraries that were evicted:
[warn] 	* com.typesafe.sbt:sbt-native-packager:0.7.4 -> 1.1.0-RC1
[warn] Run 'evicted' to see detailed eviction warnings
[info] Set current project to spark-notebook (in build file:/Users/tobias/github/abarbanell/spark-notebook/)
[spark-notebook] $ 
```

but it is just a warning, so I continue with the ```run``` command 
inside sbt.

This will compile the notebook and fire it up. Again, it will take a while
and issue loads of diagnostics and warning messages.

Finally we see this and know we are good to play: 

```
--- (Running the application, auto-reloading is enabled) ---

log4j:WARN No appenders could be found for logger (org.jboss.netty.channel.socket.nio.SelectorUtil).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.

(Server started, use Ctrl+D to stop and go back to the console...)
```

again some warnings and even some errors, but the notebook comes up on
port 9001 and so we can see it at http://localhost:9001

# Try to learn walking around

To switch to read-only mode, you can use this: 

````
$ VIEWER_MODE=true sbt
> clean
> run
```

Observation: the edit controls are gone, however you can still edit markdown 
cells in the browser (but the changes are not saved back). Code cells are truly
read-only.
to test: 

```
$ sbt test
```

to save a notebook pristine without the results from running it: 

Menu Option "Cell -> All Output -> Clear"





# Conclusion

I hope this was helpful, you may also like the articles on my 
[main blog](http://blog.abarbanell.de/) or, for less technical 
fun, how about some [videos](https://goo.gl/qT7GBy)?

You are always welcome to comment below.
