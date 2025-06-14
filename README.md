# ContainerizedApi
This project was used as a study case to understand how to run a .NET API in a Docker container.  
A simple API was developed following this [tutorial](https://awswith.net/2021/11/01/running-asp-net-minimal-apis-with-docker/).  
Along with a Dockerfile to create an image and run it.

## How to run it?
When you have all the files of the repository, you need to execute the following commands:

```
docker build -t [image_name]:[tag] .
```

This command with the dot at the end will look for a Dockerfile in the same directory it was executed, if it is executed without errors, a new docker image will be created.  
The '-t' option is very important to identify the image and run it.

Let's suppose the build command is executed like this:

```
docker build -t api-with-docker:latest .
```

After a successful execution, you can validate the creation of your new image with the following command, it will list the available images on your computer, the highlighted one is the one we just created.

```
docker image ls
```

![images on my computer](./docker_image_ls_result.png)

With the image in hands, we can start a container with it, do it the following command needs to be executed:

```
docker run -p [P1]:[P2] -it [image]:[tag]
```

This command will start a container, here is an overview of each argument.

**-p**: Port identification.

**P1**: The port in your local computer which will be used to access the container.

**P2**: The port inside the container that P1 will redirect to, this must be the port you configured your API to be available on, in my case it was 8080.

**-it**: Starts an interactive container, it means you can directly access its shell (when available).

**image**: The name of the image.

**tag**: The version of the image (e.g. latest).

To run the container you can use the following example:

```
docker run -p 80:8080 -it api-with-docker
```

Is this case, it wasn't necessary to include the tag because there is only the 'latest'.

With following command you can validate your container is running.

```
docker ps
```

![docker_ps_result](./docker_ps_result.png)

After that you can execute a http GET on one of the endpoints.

Like this:

![get_example_1](./get_example_1.png)

And this:

![get_example_2](./get_example_2.png)

This is it!