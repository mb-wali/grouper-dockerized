docker build --tag=unicon/grouper-java-base:7u95 java-base \
&& docker build --tag=unicon/grouper-api:2.2.2 api \
&& docker build --tag=unicon/grouper-daemon:2.2.2 daemon \
&& docker build --tag=unicon/grouper-web-base:2.2.2 web-base \
&& docker build --tag=unicon/grouper-ui:2.2.2 ui \
&& docker build --tag=unicon/grouper-ws:2.2.2 ws \

if [[ "$OSTYPE" == "darwin"* ]]; then
  say build complete
fi
