docker-omd
==========

Dockerfile for Open Monitoring Distribution

- Forcked from [jwarlander/docker-omd] (https://github.com/jwarlander/docker-omd)
- Adding support for Centos 7 and OMD 1.20
- Adding https support

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

`docker run -d --name docker-omd -p [host_ip]:[host_port]:443 baulito/omd`

Then connect your browser to:

`https://[host_ip]:[host_port]/monitor`

Enjoy!
