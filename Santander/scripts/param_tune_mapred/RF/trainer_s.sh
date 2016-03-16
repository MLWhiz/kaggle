#!/bin/bash
	
	

IP="/data/gcbcrscutn/rahul/saurabh_k/train/train.txt"
OP="/data/gcbcrscutn/rahul/saurabh_k/train_results56"
HADOOP_JAR_PATH="/opt/cloudera/parcels/CDH/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming.jar"
MAPPER="trainer_m.py"
REDUCER="trainer_r.py"

hadoop fs -rmr -skipTrash $OP

	hadoop jar  $HADOOP_JAR_PATH \
	-D mapred.task.timeout=96000000 \
	-D mapred.map.tasks=200 \
	-D mapred.reduce.tasks=1000 \
	-file $MAPPER -mapper 'python trainer_m.py' \
	-file $REDUCER -reducer 'python trainer_r.py' \
	-input $IP -output $OP 

	
	echo "----------------First MapReduce Job Done------------------"
