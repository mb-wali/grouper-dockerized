Internet2 Grouper Dockerized
==================

## Overview
"[Grouper](http://www.internet2.edu/products-services/trust-identity/grouper/) is an enterprise access management system designed for the highly distributed management environment and heterogeneous information technology environment common to universities. Operating a central access management system that supports both central and distributed IT reduces risk."

The project is a collection of dockerized images of the Grouper components:

* [Grouper API](https://hub.docker.com/r/unicon/grouper-api/)
* [Grouper Daemon](https://hub.docker.com/r/unicon/grouper-daemon/)
* [Grouper UI](https://hub.docker.com/r/unicon/grouper-ui/)
* [Grouper WS](https://hub.docker.com/r/unicon/grouper-ws/)

With these images, adoptors can quickly start up a Grouper environment by creating customize images that are based on these images and just overlay the customized Grouper property files. An example of doing this can be found at <https://github.com/Unicon/grouper-dockerized/tree/master/test-compose>.

## Grouper images
The full collection of Grouper images includes:

* [grouper-java-base](https://hub.docker.com/r/unicon/grouper-java-base) [![](https://badge.imagelayers.io/unicon/grouper-java-base:latest.svg)](https://imagelayers.io/?images=unicon/grouper-java-base:latest 'grouper-java-base'): This base image installs OpenJDK-based Zulu 8 Update 72 and is used by all of the other Grouper images.

* [grouper-api](https://hub.docker.com/r/unicon/grouper-api/) [![](https://badge.imagelayers.io/unicon/grouper-api:latest.svg)](https://imagelayers.io/?images=unicon/grouper-api:latest 'grouper-api'): This image builds on the `grouper-java-base` and installs the Grouper API. This images used used by the daemon, web-base (UI/WS), and any other images that need to utilize the Grouper API.

* [grouper-daemon](https://hub.docker.com/r/unicon/grouper-daemon/) [![](https://badge.imagelayers.io/unicon/grouper-daemon:latest.svg)](https://imagelayers.io/?images=unicon/grouper-daemon:latest 'grouper-daemon'): This image builds on the `grouper-api` and is configured to run the Grouper daemon.

* [grouper-web-base](https://hub.docker.com/r/unicon/grouper-web-base/) [![](https://badge.imagelayers.io/unicon/grouper-web-base:latest.svg)](https://imagelayers.io/?images=unicon/grouper-web-base:latest 'grouper-web-base'): This image builds on the `grouper-api` and installs Apache Ant and Tomcat. This images used used by the Grouper UI and Grouper WS services images.

* [grouper-ui](https://hub.docker.com/r/unicon/grouper-ui/) [![](https://badge.imagelayers.io/unicon/grouper-ui:latest.svg)](https://imagelayers.io/?images=unicon/grouper-ui:latest 'grouper-ui'): This image builds on the `grouper-web-base` and installs the Grouper UI.

* [grouper-ws](https://hub.docker.com/r/unicon/grouper-ws/) [![](https://badge.imagelayers.io/unicon/grouper-ws:latest.svg)](https://imagelayers.io/?images=unicon/grouper-ws:latest 'grouper-ws'): This image builds on the `grouper-web-base` and installs the Grouper WS.

## Image Comparisons
Visit the following links to visually see the layout of each image stack:

* [Daemon Related Layers Comparison](https://imagelayers.io/?images=unicon%2Fgrouper-java-base:latest,unicon%2Fgrouper-api:latest,unicon%2Fgrouper-daemon:latest)

* [Web Related Layers Comparison](https://imagelayers.io/?images=unicon%2Fgrouper-java-base:latest,unicon%2Fgrouper-api:latest,unicon%2Fgrouper-web-base:latest,unicon%2Fgrouper-ui:latest,unicon%2Fgrouper-ws:latest)

## Authors/Contributors

  * John Gasper (<jgasper@unicon.net>)

## LICENSE
Copyright 2016 Unicon, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

