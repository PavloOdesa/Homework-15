# Use the official Node.js image as the base image
FROM node:16 as fe-builder
# Install the AWS CLI and other dependencies
RUN apt update && \
     apt install -y unzip curl \
     && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
     && unzip awscliv2.zip \
     && ./aws/install \
     && rm -rf \
         awscliv2.zip \
     && apt -y purge curl \
     && apt -y purge unzip

# Copy the rest of the application files to the container
COPY project-frontend/ts-redux-react-realworld-example-app /app

# Set the working directory in the container to /app
WORKDIR /app
# Set the default command to run when the container starts
RUN npm clean-install
RUN npm run build
