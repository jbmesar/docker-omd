docker-omd
==========

Dockerfile for Open Monitoring Distribution

- Forcked from [jwarlander/docker-omd] (https://github.com/jwarlander/docker-omd)
- Adding support for Centos 7 and OMD 1.20

Usage
=====

To build image run:

```bash
git clone https://github.com/baulito/docker-omd.git
docker build -t 'baulito/omd' .
```
or get from docker registry (comming soon...)

`docker pull baulito/omd`

To create the docker image run

`docker run -d --name docker-omd -p 5000 baulito/omd`

Then connect your browser to:

`http://[host_ip]:5000/monitor`

Enjoy!
