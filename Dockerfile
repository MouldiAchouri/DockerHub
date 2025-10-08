# Utiliser Ubuntu 20.04
# Utiliser Ubuntu 20.04
FROM ubuntu:20.04

# Éviter les questions interactives pendant l'installation
ENV DEBIAN_FRONTEND=noninteractive

# Installer cowsay et nettoyer le cache pour alléger l'image
RUN apt-get update && \
    apt-get install -y cowsay --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    mv /usr/share/cowsay/cows/default.cow /usr/share/cowsay/cows/orig-default.cow

# Ajouter /usr/games au PATH pour pouvoir lancer cowsay
ENV PATH=$PATH:/usr/games

# Copier ton cow personnalisé dans le conteneur
COPY docker.cow /usr/share/cowsay/cows/

# Définir le cow personnalisé comme cow par défaut
RUN ln -sv /usr/share/cowsay/cows/docker.cow /usr/share/cowsay/cows/default.cow

# Définir cowsay comme ENTRYPOINT et un message par défaut
ENTRYPOINT ["cowsay"]
CMD ["Hello!"]