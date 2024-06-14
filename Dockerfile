# Utilisez l'image officielle de Python comme base
FROM python:3.12

# Variables d'environnement pour Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git-core \
        build-essential \
        binutils \
        libproj-dev \
        gdal-bin \
        supervisor && \
    rm -rf /var/lib/apt/lists/*
# Créez et définissez le répertoire de travail dans le conteneur Docker
WORKDIR /app

# Installez les dépendances Python
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiez tous les fichiers de votre projet dans le répertoire de travail du conteneur Docker
COPY . /app/
