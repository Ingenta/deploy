#!/bin/sh

python /usr/local/lib/python2.7/site-packages/mongo_connector/connector.py -m 192.168.99.100:27017 -t http://192.168.99.100:8983/solr/articles -o oplog_progress.txt -n meteor.articles -u _id -d solr_doc_manager