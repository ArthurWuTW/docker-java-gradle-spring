REPO_DIR=$(realpath $(realpath $(dirname $PWD)/dependencies))
HOSTNAME=wuguanlongs-MacBook-Pro
DOCKER_DIR=$REPO_DIR
IMAGE_NAME=${IMAGE_NAME:-project-java}
CONTAINER_USER=user
CONTAINER_NAME=project-java
