# Using sbt scala image
FROM sbtscala/scala-sbt:eclipse-temurin-17.0.4_1.7.1_3.2.0

# Arguments definition
ARG HOST_UID

# Install usuful tools
RUN apt update && \
  apt install -y sudo && \
  apt install -y vim && \
  adduser --uid $HOST_UID --disabled-password --gecos "" nonroot && \
  echo 'nonroot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Setting new user
USER nonroot

# Set working directory
WORKDIR /home/nonroot/scala

# Copy scala projects into working dir
COPY --chown=nonroot . .

# Set entrypoint as executable
RUN chmod +x entrypoint.sh

# Use bash as the entry point
CMD ["./entrypoint.sh"]
