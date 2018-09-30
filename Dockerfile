ARG FROM_BASE=${DOCKER_REGISTRY:-}${CONTAINER_OS:-}supervisord:${BASE_TAG:-latest} 
FROM $FROM_BASE

# name and version of this docker image
ARG CONTAINER_NAME=cesi
# Specify CBF version to use with our configuration and customizations
ARG CBF_VERSION

# include our project files
COPY build Dockerfile /tmp/

# set to non zero for the framework to show verbose action scripts
#    (0:default, 1:trace & do not cleanup; 2:continue after errors)
ENV DEBUG_TRACE=0

ARG CESI_VERSION=2_api
LABEL cesi.version=$CESI_VERSION

# build content
RUN set -o verbose \
    && chmod u+rwx /tmp/build.sh \
    && /tmp/build.sh "$CONTAINER_NAME" "$DEBUG_TRACE"
RUN [ $DEBUG_TRACE != 0 ] || rm -rf /tmp/*

EXPOSE 5000

ENTRYPOINT [ "docker-entrypoint.sh" ]
#CMD ["$CONTAINER_NAME"]
CMD ["cesi"]
