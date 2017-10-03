# Java development with Docker - examples

The following examples present four different approaches of how to build and test Java applications using Docker.

[anapsix/alpine-java:latest](https://hub.docker.com/r/anapsix/alpine-java/) and
[anapsix/alpine-java:8_jdk](https://hub.docker.com/r/anapsix/alpine-java/) images are used for running and building
the application respectively.

A sample HTTP server
[https://github.com/piotrpolak/android-http-server](https://github.com/piotrpolak/android-http-server)
is used for demonstration purposes.

# 1. Build on host machine, run in a temporary container

* [setup.sh](01_build_on_host_run_in_temporary_container/setup.sh)

The container will be immediately destroyed after the execution of `./setup.sh` is interrupted.

All the configuration and HTML document is mounted as a shared volume to the container.

This setup supposes you have both `git` and `java` available at the host machine.

# 2. Build on host machine, create dedicated image

* [setup.sh](02_build_in_host_create_dedicated_image/setup.sh)
* [Dockerfile](02_build_in_host_create_dedicated_image/Dockerfile)

After running `./setup.sh` you will be able to run the HTTP server again by executing `docker run -it 02_sample`.

All the configuration is bundled inside the container.

This setup supposes you both have `git` and `java` available at the host machine.

# 3. Build everything inside image upon image creation

* [setup.sh](03_build_everything_inside_image_upon_image_creation/setup.sh)
* [Dockerfile](03_build_everything_inside_image_upon_image_creation/Dockerfile)

After running `./setup.sh` you will be able to run the HTTP server again by executing `docker run -it 03_sample`.

All the configuration is bundled inside the container.

This setup DOES NOT REQUIRE you to have `git` nor `java` available at the host machine.

# 4. Checkout project locally, create base image and build project upon container start

* [setup.sh](04_checkout_on_host_build_on_start/setup.sh)
* [Dockerfile](04_checkout_on_host_build_on_start/Dockerfile)

After running `./setup.sh` you will be able to run the HTTP server again by executing `docker run -it 04_sample`.

All the configuration is bundled inside the container.

This setup supposes you have `git` installed but DOES NOT require to have `java` installed at the host machine.
