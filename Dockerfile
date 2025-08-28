# Use the official Elixir image
FROM elixir:1.15-alpine

# Install additional tools that might be useful
RUN apk add --no-cache bash nano vim

# Set working directory inside container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Make the script executable
RUN chmod +x hello.exs

# Set the default command to run our Elixir script
# But this can be overridden when running interactively
CMD ["elixir", "hello.exs"]
