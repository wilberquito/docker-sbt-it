# Using sbt scala image
FROM sbtscala/scala-sbt:eclipse-temurin-17.0.4_1.7.1_3.2.0

# Install usuful tools
RUN apt update \
  && apt install -y vim

# Copy entry point to containers root
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint as executable
RUN chmod +x /entrypoint.sh

# Set working directory
WORKDIR /scala

# Create a dummy sbt project using g8 template scala generator
RUN sbt new scala/scala-seed.g8 --name=hello-world

# Use bash as the entry point
CMD ["/entrypoint.sh"]
