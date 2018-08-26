# Setup

git clone https://github.com/pclinger/docker-apache-perl.git

cd docker-apache-perl

docker build -t docker-apache-perl .

#docker run -v c:/www:/var/www/html -p 80:80 -d docker-apache-perl /usr/sbin/apache2ctl -D FOREGROUND
docker run -v C:/work/docker/docker-apache-perl-master/var_log:/var/log/apache2 -p 11151:11151 -d docker-apache-perl /usr/sbin/apache2ctl -D FOREGROUND
docker run -v C:/work/docker/docker-apache-perl-master/var_log:/var/log/apache2 -v C:/work/docker/docker-apache-perl-master/cgi-bin:/var/www/cgi-bin -p 11151:11151 -d wmed /usr/sbin/apache2ctl -D FOREGROUND


Access 
http://localhost:11151
http://localhost:11151/cgi-bin/printenv.pl
http://localhost:11151/cgi-bin/test.pl

