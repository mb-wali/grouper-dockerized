docker pull centos:centos7 \
&& docker build --tag=unicon/grouper-java-base:7u95 java-base \
&& docker build --tag=unicon/grouper-api:2.3.0 api \
&& docker build --tag=unicon/grouper-daemon:2.3.0 daemon \
&& docker build --tag=unicon/grouper-web-base:2.3.0 web-base \
&& docker build --tag=unicon/grouper-ui:2.3.0 ui \
&& docker build --tag=unicon/grouper-ws:2.3.0 ws \

if [[ "$OSTYPE" == "darwin"* ]]; then
  say build complete
fi
