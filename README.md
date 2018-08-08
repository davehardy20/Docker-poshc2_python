PoshC2_Python Docker Build Info
===============================

## Install Docker for your OS

I've tested this using Docker in Ubuntu, from here - https://docs.docker.com/install/linux/docker-ce/ubuntu/

And

Docker for Mac, from here - https://docs.docker.com/docker-for-mac/install/

Create a folder for the Dockerfile called PoshC2_Python and copy the Docker file into into
CD into the new folder

Run the following to build a new image from the docker file

## Clone this repository

git clone https://github.com/davehardy20/Docker-poshc2_python.git

CD into the new repo, and run

```
docker build --tag=poshc2-python:latest .
```
this will take a few minutes, once complete you will have a new docker image, list it with this command

```
docker images
```

```
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
poshc2-python                 latest              c9dcd1a8d926        13 minutes ago      2.91GB
```
You should have something like the above

To run a new container based upon your image run the following command 
```
docker run --name poshc2-python -ti -p host ip to listen on:443:443 poshc2-python:latest /bin/bash
```
so if your hosts external IP is 192.168.0.117
```
docker run --name poshc2-python -ti -p 192.168.0.117:443:443 poshc2-python:latest /bin/bash
```
This will place you in a bash shell inside the running container.

From here enter:
```
chmod +x /root/tmux-sessions.sh
/root/tmux-session.sh
```
Running this script will create a tmux session with 2 windows, one window split into 2 panes with C2Server running on the left and ImplantHandler on the right.

![Alt text](./screenshots/poshc2-windows.png?raw=true "PoshC2 Windows")
Tmux uses Ctrl + b as its prefix, its similar to screen.

To switch windows Ctrl +b n
To switch panes Ctrl +b o
To scroll a panes you have to enter whats called copy mode via Ctrl +b [ then use the arrow keys and / or page up/down, use the Escape key to exit copy mode.

You can detach from tmux by using ctrl + b d, this will leave PoshC2 running, just as in screen.

To detach from the running docker container enter ctrl p and then ctrl q, this will leave it running.

Just exiting the container will close it, so you will need to enter the following to re-start the container

docker container start poshc2-python

To enter the running container:

docker attach poshc2-python


# Important Step
This is important to do this as the default payloads won't work due to the payload generation picking up the wrong IP address.
In the ImplantHandler window, run the command to createnewpayload and set the url to the ip or hostname of the docker hosts network adaptor, as set in the docker run command above.