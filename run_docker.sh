#!/bin/bash
# Build image and add a descriptive tag
if docker build -t temporalhelloworkflow .;
then
    # List docker images
    docker images
    docker run -d -p 7233:7233 temporalhelloworkflow
    # debug docker
    # docker exec -it <container_id> sh
fi