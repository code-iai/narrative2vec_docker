FROM ros:kinetic-robot-xenial as base
WORKDIR /home/ros/catkin_ws/src

RUN  apt-get update && apt-get install -y swi-prolog libjson-glib-dev

FROM base
COPY json_prolog_msgs ./json_prolog_msgs
COPY narrative2vec/narrative2vec ./narrative2vec/narrative2vec
COPY narrative2vec/narrative2vec.py ./narrative2vec/
COPY rosprolog ./rosprolog

RUN /bin/bash -c 'source /opt/ros/kinetic/setup.bash; cd /home/ros/catkin_ws/; catkin_make'
ENTRYPOINT /bin/bash -c 'source /opt/ros/kinetic/setup.bash; source /home/ros/catkin_ws/devel/setup.bash; python narrative2vec/narrative2vec.py /neems /csv'
