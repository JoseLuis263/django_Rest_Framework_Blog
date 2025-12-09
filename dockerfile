FROM python:3.13

# Install SSH client
RUN apt-get update && apt-get install -y openssh-client

# set environment variables
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /app

# copy requirements
COPY requirements.txt /app/requirements.txt

# install dependencies
RUN pip install -r requirements.txt

# Copy the application to the working directory
COPY . /app/

# Start the tunel SSH 
CMD python manage.py runserver 0.0.0.0:8000