
docker rm -f solr5;

if [ -d /docker_volume/solr ]; then  rm -rf /docker_volume/solr ; fi 

mkdir -p /docker_volume/solr/articles ;

wget -O /articles.zip https://github.com/Ingenta/deploy/blob/master/science/articles.zip?raw=true ;

unzip /articles.zip -d /docker_volume/solr/articles ;

chgrp -R docker /docker_volume/solr/articles
chmod -R g+w /docker_volume/solr/articles

docker run -d -p 8983:8983 -v /docker_volume/solr/articles/:/opt/solr/server/solr/articles --name solr5 makuk66/docker-solr ;