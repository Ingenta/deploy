#!/bin/sh
docker rm -f node1
docker rm -f node2

rm -rf /volume/mongo/db/rs1/*
rm -rf /volume/mongo/db/rs2/*
rm -rf /volume/mongo/log/*

mkdir -p /volume/mongo/db/rs1
mkdir -p /volume/mongo/db/rs2
mkdir -p /volume/mongo/log

chgrp -R docker /volume/mongo
chmod -R g+w /volume/mongo

touch /volume/mongo/log/rs1.log
touch /volume/mongo/log/rs2.log

docker run -d --name node1 -p 27017:27017 -v /volume/mongo/db/rs1:/data/db -v /volume/mongo/log:/data/log mongo --logpath /data/log/rs1.log --oplogSize 100 --replSet rs/192.168.1.2:27018 --journal
docker run -d --name node2 -p 27018:27017 -v /volume/mongo/db/rs2:/data/db -v /volume/mongo/log:/data/log mongo --logpath /data/log/rs2.log --oplogSize 100 --replSet rs/192.168.1.2:27017 --journal