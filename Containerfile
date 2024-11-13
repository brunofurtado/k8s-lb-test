# Use the UBI-based PHP image as a base
FROM registry.redhat.io/ubi9/php-82:9.5-1730595738

# Set the working directory to the Apache web root
WORKDIR /var/www/html

# Copy the PHP application to the container's web root
COPY index.php /var/www/html/

RUN chcon -R -t httpd_sys_content_t /var/www/html && restorecon -R -v

# Expose the port Apache will use (default 80)
EXPOSE 80

# Start Apache in the foreground
CMD ["httpd", "-D", "FOREGROUND"]