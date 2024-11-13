# Use the UBI-based PHP image as a base
FROM registry.access.redhat.com/ubi8/php:8.1

# Set the working directory to the Apache web root
WORKDIR /var/www/html

# Copy the PHP application to the container's web root
COPY index.php /var/www/html/

# Expose the port Apache will use (default 80)
EXPOSE 80

# Start Apache in the foreground
CMD ["httpd", "-D", "FOREGROUND"]