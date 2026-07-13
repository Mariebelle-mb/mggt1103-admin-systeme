# Séance 6 — Orchestration Kubernetes Locale avec K3s (via k3d)

## Contenu
- `1-deployment.yaml` : Deployment avec 3 replicas de nginx:alpine
- `2-service.yaml` : Service interne exposant les Pods sur le port 80
- `3-ingress.yaml` : Ingress (Traefik) exposant l'application publiquement
- `capture-kubectl-get-all.png` : capture d'écran de `kubectl get all` montrant les Deployments, ReplicaSets, Pods et Services

## Pourquoi utiliser un Service plutôt que l'IP directe d'un Pod ?

Les Pods sont éphémères : leur adresse IP change à chaque fois qu'ils meurent et sont recréés (par exemple lors de l'auto-healing). Un Service fournit une IP fixe et un nom stable qui ne changent jamais, quel que soit le nombre de Pods créés ou détruits en arrière-plan. Il agit comme un standardiste qui distribue automatiquement (load-balancing) le trafic entrant vers l'un des Pods sains disponibles, sans que le client ait besoin de connaître leurs IP individuelles.

## Commande pour passer de 3 à 10 replicas (scaling)

```bash
kubectl scale deployment serveur-web-app --replicas=10
```
