FROM ubuntu:22.04

ENV PATH="/usr/local/go/bin:${PATH}"

# Install sudo
RUN apt-get update && \
    apt-get -y install sudo curl

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
	&& apt-get install -y --no-install-recommends \
	nodejs=14.* \
	make=4.* \
	# Cleanup APT cache to ease extension of this image
	&& apt-get clean \

  	&& rm -rf /var/lib/apt/lists/*


RUN npm install -g npm@9.5.1

## Install Golang from binary distribution
ARG GO_VERSION="1.20.4"
ARG GO_CHECKSUM="698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd"
# No need to use C-Go and avoid requirement to GCC
ENV CGO_ENABLED=0
ENV GO11MODULES=on
RUN curl --silent --show-error --location --output /tmp/go.tgz \
    "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" \
  # Control the checksum to ensure no one is messing up with the download
  && sha256sum /tmp/go.tgz | grep -q "${GO_CHECKSUM}" \
  # Extract to a directory part of the default PATH
  && tar -C /usr/local -xzf /tmp/go.tgz \
  # Sanity check
  && go version | grep "${GO_VERSION}" \
  # Cleanup
  && rm -f /tmp/go.tgz


# Create a new user called student
RUN useradd -m student

# Add the student user to the sudo group
RUN usermod -aG sudo student

# Allow the student user to use sudo without a password prompt
RUN echo 'student ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the student user
USER student

# Set the default command to run as the student user
CMD ["/bin/bash"]
