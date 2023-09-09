
# Use the official Python image as the base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the working directory
COPY . /app

# Fix typo: "apt-get" package manager should be used instead of "pipenv"
# Install the application dependencies
RUN apt-get update && apt-get install -y python3-dev libpq-dev
# Install pipenv package manager
RUN pip install --upgrade pip
RUN pip install pipenv
# Fix typo: "install" command should be used instead of "install --system"
# Install application dependencies using pipenv
RUN pipenv install

# Define the entry point for the container
CMD ["flask", "run", "--host=0.0.0.0"]
