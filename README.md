PSAS
==============

Installation
--------------

1. Install [Docker](https://www.docker.com)

2. Download automated build from public Docker Hub Registry: `docker pull qapps/psas`
(alternatively, you can build an image from Dockerfile: `docker build -t="qapps/psas" github.com/qualiapps/psas`)

**Running**

`docker run -d -p 8080:80 --name psas-app qapps/psas`

**Get access**

`http://localhost:8080`

**How to execute your own script**

Compile your cli app (cobol, c, etc...) with one cli argument.

Copy the file into ./files/app/ - cp your_binary ./files/app/cli-handler

chmod +x ./files/app/cli-handler

*Build an image from Dockerfile:*

`docker build -t psas-app .`

