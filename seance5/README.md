# Séance 5 — Conteneurisation Professionnelle et Docker Compose

## Contenu
- `Dockerfile` : build multi-stage pour l'API Python (Flask)
- `docker-compose.yml` : orchestration de l'API web + PostgreSQL
- `app.py` : code de l'API Web
- `requirements.txt` : dépendances Python
- `capture-docker-ps.png` : capture d'écran de `sudo docker ps` montrant les conteneurs en cours d'exécution

## Pourquoi aucune section `ports:` sous `base-donnees` ?

Nous n'avons pas exposé le port 5432 du service `base-donnees` car la base de données PostgreSQL n'a pas besoin d'être accessible depuis l'extérieur de la machine hôte : seule l'API web (`api-web`) doit pouvoir communiquer avec elle, via le réseau interne `reseau-interne`. En ne publiant pas ce port, on réduit la surface d'attaque : personne depuis l'extérieur ne peut tenter de se connecter directement à la base de données, même si son mot de passe était compromis.
