# This is just to help me run elm-test locally.
FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -yq
RUN apt-get install -yq nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g elm@0.18.0
RUN npm install -g elm-test
VOLUME ["/home"]
WORKDIR /home
CMD ["/home/run-tests"]
