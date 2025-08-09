# Project Template

[![Made With Love](https://img.shields.io/badge/Made%20With-Love-orange.svg?style=for-the-badge)](https://github.com/chetanraj/awesome-github-badges) ![py_version](https://img.shields.io/badge/python-^3.11-blue?style=for-the-badge&logo=python&logoColor=9cf) ![version](https://img.shields.io/badge/version-0.1.0-gree?style=for-the-badge&logo=semver) ![code quality](https://img.shields.io/badge/code_quality-A-51C62B?style=for-the-badge&logo=codeforces&logoColor=9cf)

A project template created by [`Cookiecutter`](https://github.com/cookiecutter/cookiecutter) to automate projects creation for python applications.

## 🚀 Contexte

Un template de projet créé via Cookiecutter permettant d'automatiser et standardiser la création de projets Python. Ce template fournit une structure complète et prête à l'emploi, intégrant des bonnes pratiques telles que la gestion des dépendances avec `UV`, des scripts automatisés avec `Make`, et un workflow clair et organisé pour améliorer la **collaboration** et la **productivité** des équipes de développement.

## 🛠️ Installation & Configuration

Avant de démarrer un nouveau projet, il est nécessaire d'installer certains outils indispensables.
Installez d'abord Python via le [site officiel](https://www.python.org/downloads/), puis exécutez le script suivant pour configurer votre environnement :

```sh
.\setup_dev.bat
```

Une fois que Python ainsi que toutes les dépendances système sont installées, vous pouvez créer un nouveau projet suivant ce template comme suit :

```sh
cookiecutter https://github.disney.com/DLP-WFI-Etudes-Optimisation/project-template
```

Lors de cette étape, le nom du projet et l'auteur vous seront demandés pour personnaliser votre nouveau projet.

## 📂 Organisation & Structure

Avoir un template de projet bien défini permet d’assurer une cohérence entre les différents projets et de faciliter la collaboration. Un bon template permet :

- Une meilleure lisibilité du projet.
- Une standardisation des pratiques au sein d’une équipe.
- Une mise en place rapide sans avoir à tout recréer à chaque nouveau projet.
- Une meilleure gestion des versions et de la maintenance du code.

L’adoption des bonnes pratiques dès le début du développement permet d'éviter des erreurs coûteuses, de rendre le code plus lisible et d'améliorer la productivité de l'équipe. Ces pratiques incluent :

- L'utilisation d’un gestionnaire de dépendances comme UV.
- Une structure de projet claire et bien organisée.
- La mise en place de tests pour éviter les régressions.
- L’intégration d’un fichier .gitignore pour éviter d’inclure des fichiers inutiles dans le dépôt.

Un projet bien structuré suit cette hiérarchie :

```sh
mon_projet/
│-- data/
│   ├── input/
│   ├── output/
│-- docs/
│-- tests/
│-- models/
│-- notebooks/
│-- logs/
│-- src/
│   ├── preprocessing.py
│   ├── utils.py
│-- .gitignore
│-- README.md
│-- CHANGELOG.md
│-- pyproject.toml
│-- requirements.txt
│-- Makefile
│-- run.bat
│-- setup.bat
```

- `README.md`: présentation du projet
- `data/` : données brutes et résultats.
    - `input/` : données d'entrée.
    - `output/` : données de sortie.
- `docs/` : documentation du projet.
- `tests/` : tests unitaires.
- `models/` : modèles de prédiction.
- `notebooks/` : jupyter notebook pour les analyses exploratoires.
- `logs/` : les logs générés lors de l'exécution de l'application.
- `src/` : code source du projet.
    - `preprocessing.py` : code nécessaires pour le préprocessing des données.
    - `utils.py` : fonctions utilitaires pour l'ensemble de l'application.
- `.gitignore` : fichier définissant les fichiers et dossiers à ignorer dans Git.
- `CHANGELOG.md` : historique des modifications.
- `pyproject.toml` : gestion des dépendances avec UV.
- `requirements.txt` : permettant l'installation des dépendances sans passer via UV.
- `Makefile` : script pour exécuter des commandes utiles.
- `run.bat` : exécuter le script principal sur Windows.
- `setup.bat` : configurer et installer les dépendances.

### 🌱 Gestion des Branches & Versioning

Avant de présenter les différentes branches, nous devons introduire les environnements où le code sera déployé :

- **Développement (development)** : environnement où le code est développé, mis à jour et testé fréquemment. Rien de ce qui est fait dans cet environnement n'affecte les utilisateurs finaux. C'est une zone de test pour les développeurs.
- **Pré-production (staging)** : environnement qui imite le plus fidèlement possible la production afin de tester les fonctionnalités avant leur mise en ligne.
- **Production (prod)** : environnement final où le projet est accessible aux utilisateurs après validation et tests.

Les branches peuvent être créées à tout moment, mais certaines branches principales ont des noms fixes et servent de référence selon l’environnement de déploiement :

- **main:** cette branche est déployée sur l’environnement de **pré-production (staging)**. Une fois le code testé et approuvé pour la production, une étiquette Git **(git tag)** est ajoutée pour déployer officiellement le code en **production**.
- **develop:** branche de développement où le code est déployé dans l’environnement de développement.
- **feat/{branch_name}:** branche utilisée pour ajouter une nouvelle fonctionnalité au code.
- **fix/{branch_name}:** branche utilisée pour corriger un bug après le déploiement d’une fonctionnalité.

Le versionnement des versions suit la norme de [semantic versioning](https://semver.org/). Par exemple, la convention de nommage des tags Git est du type v0.1.0. Selon la nomenclature `MAJOR.MINOR.PATCH`, on incrémente :

- **MAJOR** lorsque des changements incompatibles sont apportés à l’API.
- **MINOR** lorsqu’une nouvelle fonctionnalité est ajoutée de manière rétrocompatible.
- **PATCH** lorsqu’un bug est corrigé sans impact sur la compatibilité.

### 📢 Commits Conventionnels

Pour garder un historique des commits clair et organisé, il est recommandé de suivre une convention définissant une structure standardisée pour les messages de commit. Inspirée de [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/),la structure des messages de commit doit être la suivante :

``` sh
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
```

Le `<type>` décrit le type de commit et peut prendre les valeurs suivantes :

``` sh
- :feat:          feat: ajout d'une nouvelle fonctionnalité
- :fix:           fix: correction d'un bug
- :docs:          docs: modifications apportées à la documentation uniquement
- :style:         style: modifications n'affectant pas la logique du code
                  (espaces, formatage, suppression de points-virgules, etc.)
- :refactor:      refactor: modifications du code sans ajout de fonctionnalité ni correction de bug
- :perf:          perf: amélioration des performances du code
- :test:          test: ajout ou correction de tests unitaires
- :chore:         chore: modifications du processus de build ou outils auxiliaires 
                  (ex. génération de documentation)
- :chore-release: chore(release): déploiement ou publication du code dans un dépôt externe
- :chore-deps:    chore(deps): ajout ou suppression de dépendances
- :build:         build: modifications liées aux processus de compilation
- :ci:            ci: mises à jour des configurations d'intégration continue
- :config:        config: modifications des fichiers de configuration
- :security:      security: correction de failles de sécurité
```

## 🤝 Contribution

Pour toute nouvelle idée ou amélioration du template, n'hesitez pas à le partager avec l'ensemble de l'equipe afin de faciliter le workflow global de développement.
