#!/bin/bash

# Build the Docker image if it doesn't exist or if forced
if [ "$1" = "--build" ] || ! docker image inspect elixir-hello >/dev/null 2>&1; then
    echo "Building Elixir Hello World Docker image..."
    docker build -t elixir-hello .
    
    if [ $? -ne 0 ]; then
        echo "Build failed. Please check the Dockerfile and try again."
        exit 1
    fi
fi

echo "Starting interactive Elixir container..."
echo "Your local files are mounted at /app"
echo "You can run 'elixir hello.exs' or any other Elixir commands"
echo "Type 'exit' to leave the container"
echo "----------------------------------------"

# Run the container interactively with a shell
docker run -it --rm \
    -v $(pwd):/app \
    -w /app \
    elixir-hello \
    sh
