# Utilisez l'image officielle de Python comme base
FROM python:3.12

# Variables d'environnement pour Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Créez et définissez le répertoire de travail dans le conteneur Docker
WORKDIR /app

# Installez les dépendances Python
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiez tous les fichiers de votre projet dans le répertoire de travail du conteneur Docker
COPY . /app/
