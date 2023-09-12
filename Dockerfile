FROM debian:testing-slim

ARG SCALA_VERSION
ENV SCALA_VERSION=$SCALA_VERSION

#######################
# Install dependencies
#######################
RUN apt-get update
RUN apt-get install -y git vim curl sudo
RUN apt-get install -y openjdk-17-jdk


#######################
# Set up user
#######################
ARG USERNAME=code
ARG USER_HOME=/home/$USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID


# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Make app dir where project will be loaded to and make it working dir

# Set the default user. Omit if you want to keep the default as root.
USER $USERNAME


#######################
# Install Scala
#######################
RUN mkdir $USER_HOME/install/
COPY scripts/install_scala.sh $USER_HOME/install/install_scala.sh
WORKDIR $USER_HOME/install/
RUN ./install_scala.sh

RUN mkdir $USER_HOME/app
WORKDIR $USER_HOME/app

CMD sleep infinity
