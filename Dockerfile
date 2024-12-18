# Use Python 3.11 slim image as our base
# The slim version keeps our container small while including essential packages
FROM python:3.11-slim

# Set the working directory in the container
# This is where our app will live inside the container
WORKDIR /app

# Copy and install dependencies first
# This step is separated to leverage Docker's cache layer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn vizro

# Copy all application files
# We do this after installing dependencies to speed up rebuilds
COPY . .

# Tell Docker that our app will use port 80
EXPOSE 80

# Start the application with Gunicorn
# Breaking down the command:
# - gunicorn: production-grade WSGI server
# - app:server: references the 'server' variable in our app.py
# - --bind 0.0.0.0:80: makes the app accessible from outside the container
ENTRYPOINT ["gunicorn", "app:server", "run", "--bind", "0.0.0.0:80"]