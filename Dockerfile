# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app 

# Copy package.json to the working directory
COPY package*.json ./

# Copy the rest of the application code to the working directory
COPY . .

# Define the command to run your application
CMD [ "node", "index.js" ]