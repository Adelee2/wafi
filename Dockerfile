# Use the official Go image as the base image
FROM golang:latest

# Set the working directory
WORKDIR /app

# Copy the Go source code
COPY . .

RUN go mod download
# Build the Go app
# RUN go build -o main .

# Use the official temporalio/server image as the base image for the Temporal server
FROM temporalio/server:latest

# Set the environment variables for the Temporal server
ENV TEMPORAL_NAMESPACE=default \
    TEMPORAL_CLUSTER_NAME=cluster \
    TEMPORAL_ADMIN_PASSWORD=secret \
    TEMPORAL_SHARD_COUNT=1

# Expose the GRPC port
EXPOSE 7233

# Start the Temporal server and the Go app
CMD temporal-server && go run ./worker && go run ./starter
