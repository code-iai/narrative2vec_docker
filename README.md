# narrative2vec

## Prerequisites

1. Make sure you have your NEEMs generate.
2. Docker installed on your computer with support for Linux containers.
3. ROS is installed. See https://www.ros.org .
4. Knowrob is installed. See http://knowrob.org/installation.
5. A running Mongo DB instance.

## How to use it
1. Start a roscore 
    ```bash
   roscore
   ```
2. To execute narrative2vec for the first time just execute the following command: 
   ```bash
   docker run --network host --name narrative2vec --mount type=bind,source=<path-to-the-local-neems-storage>,target=/neems --mount type=bind,source=<path-to-the-local-csv-storage>,target=/csv --env ROS_HOSTNAME=<ROS_CORE_IP> --env NEEM_HOME=<path-to-the-local-neems-storage> --env ROS_IP=<ROS_CORE_IP> --env ROS_MASTER_URI=http://<ROS_CORE_IP>:11311 codeiai/narrative2vec:1.0.0
   ```   
3. If you started the container once with the "docker run" command, please use the following command for future usage: 
    ```bash
    docker start narrative2vec --attach
    ```
