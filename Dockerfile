# Use Nginx as the base image
FROM nginx:latest

# Install necessary tools
RUN apt-get update && \
    apt-get install -y procps curl jq netcat-traditional && \
    rm -rf /var/lib/apt/lists/*

# Copy the system_info.sh script and the modified index.html
COPY system_info.sh /usr/local/bin/system_info.sh
RUN chmod 777 /usr/local/bin/system_info.sh
COPY index.html /usr/share/nginx/html/index.html

# Expose port 8080 for the system information endpoint
EXPOSE 80

# Run the system_info.sh script to serve system information and start Nginx
CMD ["/usr/local/bin/system_info.sh"]
