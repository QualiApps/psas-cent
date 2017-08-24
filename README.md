PSAS
==============

Installation
--------------

1. Install [Docker](https://www.docker.com)

2. Download automated build from public Docker Hub Registry: `docker pull qapps/psas-cent`
(alternatively, you can build an image from Dockerfile: `docker build -t="qapps/psas-cent" github.com/qualiapps/psas-cent`)

**Running**

`docker run -d -p 8080:80 --name psas-app qapps/psas-cent`

**Get access**

`http://localhost:8080`

**How to execute your own script**

Compile your cli app (cobol, c, etc...) with one cli argument.

Copy the file into ./files/app/ - cp your_binary ./files/app/cli-handler

chmod +x ./files/app/cli-handler

*Build an image from Dockerfile:*

`docker build -t psas-image .`

`docker run -d -p 8080:80 --name psas-app psas-image`

