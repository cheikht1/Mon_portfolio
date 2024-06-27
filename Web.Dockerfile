# Utilisez une image de base appropriée
FROM nginx:alpine

# Copiez les fichiers du site web dans le conteneur
COPY . /usr/share/nginx/html

# Exposez le port 80 pour accéder au site web
EXPOSE 80

# Commande par défaut pour démarrer le serveur web
CMD ["nginx", "-g", "daemon off;"]