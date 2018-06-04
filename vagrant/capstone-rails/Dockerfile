FROM ruby:2.4.1

USER root

RUN apt-get update \
&& apt-get install build-essential libpq-dev nodejs apache2-utils mysql-client postgresql npm -y \
&& apt-get autoclean \
#&& npm cache clean -f \
#&& npm install -g n \
#&& n stable \
#&& npm install yarn -y \
&& apt-get autoremove -y

RUN mkdir rails-app

ADD . rails-app

WORKDIR rails-app

EXPOSE 3000

RUN bundle install

#CMD bundler exec rake db:create


