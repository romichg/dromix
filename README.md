# dromix
Docker based (read only) linux apps

dromix-s is an extendible dromix image that proivdes security by using VNC over unix socket to communicate to the app inside the docker container. 

## Installing

Running the ./install script will install all the necessary prerequisites (except docker itself), build all the containers and set up all the links. 

The invocation of the dromix app will be ```/usr/bin/dromix-<appname>``` for exmple to run chromium run ```dromix-chromium```

The dromix-s invocation of the app will be ```/usr/bin/dromix-s-<appname>```


If you want to build a custom image take a look at one of the Dockerfiles and customize it then:


1. 
Build the Docker Image:
   
      docker build -t romich-g/dromix .

2. 
Extend the image by running it and installing whatever soft is desired
     
     docker run -it --name setup_soft romich-g/dromix /bin/bash

3. 
Commit the changes to a new image

     docker commit setup_soft romich-g/dromix-<name of image>

4. 
Run the new image 

    dromix.sh --dromix-<name of image> --dri=[Y/N]  <name of soft executable>

Note that this will automaticaly delete the container after closing. If you want to keep the changes then use a local copy of dromix.sh, and remove the "--rm" in the docker run line

To run the new image in VNC mode, which is more secure do

    dromix-s.sh <name of the soft executable>

VNC mode is more secure since whatever is running does not have direct access to your X server. In VNC mode we communicate back to your X through a VNC veiwer talking to a VNC server via unix socket. It is still slower and you cannot resize the window. 

6. 
Once you've set things up time to integrate things with your desktop. For the browser, for exmaple, create an executable file /usr/bin/dromix-browser and add this line

     dromix-s.sh --dromix=firefox --dri=N firefox --no-remote

Then use udate-alternatives

```update-alternatives --install /usr/bin/x-www-browser x-www/browser /usr/bin/dromix-browser```




Special thanks to:
https://www.jann.cc/2014/09/06/sandboxing_proprietary_applications_with_docker.html

Yoctoproject Matchbox Window Manager
https://www.yoctoproject.org/tools-resources/projects
