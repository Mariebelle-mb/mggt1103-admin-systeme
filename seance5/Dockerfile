# --- ÉTAPE 1 : LA CUISINE (Builder) ---
FROM python:3.10-slim AS builder

WORKDIR /app

# On installe les outils nécessaires à la compilation
RUN apt-get update && apt-get install -y build-essential

# On copie notre fichier de liste de dépendances
COPY requirements.txt .

# On installe les bibliothèques dans un dossier spécifique (user)
RUN pip install --user --no-cache-dir -r requirements.txt

# --- ÉTAPE 2 : LA VITRINE (Production) ---
FROM python:3.10-slim

WORKDIR /app

# Sécurité : On crée un utilisateur non-root (un conteneur en root est dangereux)
RUN useradd -m appuser

# On copie UNIQUEMENT les bibliothèques compilées lors de l'étape 1 !
COPY --from=builder /root/.local /home/appuser/.local

# On copie le code de notre application
COPY app.py .

# On transfère la propriété des fichiers à notre nouvel utilisateur
RUN chown -R appuser:appuser /app

# On demande à Docker d'utiliser cet utilisateur sécurisé
USER appuser

ENV PATH=/home/appuser/.local/bin:$PATH

# On expose le port sur lequel l'API va écouter
EXPOSE 5000

# La commande finale pour lancer l'application
CMD ["python", "app.py"]