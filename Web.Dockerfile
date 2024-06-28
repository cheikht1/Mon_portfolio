# Utiliser l'image officielle PHP avec Apache
FROM php:7.4-apache

# Activer mod_status d'Apache pour exporter les métriques
RUN a2enmod status

# Configurer l'accès aux métriques (autoriser depuis tous les hôtes)
RUN echo "ExtendedStatus On\n<Location /server-status>\n  SetHandler server-status\n  Require all granted\n</Location>" >> /etc/apache2/apache2.conf

# Copier le code de l'application dans le répertoire approprié
COPY . /var/www/html/

# Configurer les permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exposer le port 80
EXPOSE 80

# Démarrer Apache
CMD ["apache2-foreground"]