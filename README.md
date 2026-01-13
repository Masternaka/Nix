# Configuration personnelle de NixOS

Configuration NixOS modulaire avec support pour plusieurs environnements de bureau et applications.

## Structure du projet

```
.
├── configuration.nix              # Configuration système principale
├── flake.nix                      # Flake NixOS pour la gestion des dépendances
├── hardware-configuration.nix     # Configuration matérielle spécifique
├── home.nix                       # Configuration Home Manager
└── modules/                       # Modules modulaires
    ├── appsconfig/               # Configuration des applications
    │   ├── alacritty.nix         # Terminal Alacritty
    │   ├── fastfetch.nix         # Outil d'affichage système Fastfetch
    │   └── kitty.nix             # Terminal Kitty
    ├── system/                   # Configuration système
    │   ├── filesystem.nix        # Configuration du système de fichiers
    │   ├── gnome.nix             # Bureau GNOME
    │   ├── kde.nix               # Bureau KDE
    │   ├── samba.nix             # Partage réseau Samba
    │   ├── service.nix           # Services système
    │   └── xfce.nix              # Bureau XFCE
    └── user/                     # Configuration utilisateur
        ├── flatpak.nix           # Gestion Flatpak
        ├── git.nix               # Configuration Git
        ├── programs.nix          # Programmes utilisateur
        └── sh.nix                # Configuration shell
```

## Description des modules

### Applications (`modules/appsconfig/`)
- **alacritty.nix** : Configuration du terminal Alacritty
- **fastfetch.nix** : Configuration de Fastfetch pour l'affichage système
- **kitty.nix** : Configuration du terminal Kitty

### Système (`modules/system/`)
- **filesystem.nix** : Configuration du système de fichiers (montages, partitions, etc.)
- **gnome.nix** : Configuration du bureau GNOME
- **kde.nix** : Configuration du bureau KDE
- **samba.nix** : Configuration du partage réseau via Samba
- **service.nix** : Services système (daemons, services background)
- **xfce.nix** : Configuration du bureau XFCE

### Utilisateur (`modules/user/`)
- **flatpak.nix** : Gestion et configuration de Flatpak
- **git.nix** : Configuration Git (utilisateur, clés SSH, etc.)
- **programs.nix** : Programmes et utilitaires utilisateur
- **sh.nix** : Configuration du shell (bash, zsh, etc.)

## Fichiers racine

- **configuration.nix** : Fichier de configuration principal du système
- **flake.nix** : Déclaration Flake pour les dépendances
- **hardware-configuration.nix** : Configuration spécifique au matériel
- **home.nix** : Configuration Home Manager pour l'environnement utilisateur
