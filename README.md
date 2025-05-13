
# **Glish-Scanner Script**

## **Résumé**

Ce script permet de scanner des ports et d'analyser une adresse IP cible à l'aide de plusieurs outils populaires de sécurité et de réseau. Il offre une interface interactive avec `dialog`, permettant à l'utilisateur de choisir les outils à utiliser, et affiche les résultats dans des fenêtres `xterm`. Les outils de scan disponibles incluent `nmap`, `dmitry`, `netcat`, `masscan`, `hping3`, `unicornscan`, et `zmap`.

### **Fonctionnalités principales** :
- **Choix des outils** : Sélectionne les outils que tu souhaites utiliser pour scanner l'adresse IP cible.
- **Exécution dans `xterm`** : Chaque outil sélectionné est exécuté dans une fenêtre `xterm` séparée.
- **Enregistrement des résultats** : Les résultats de chaque scan sont enregistrés dans un fichier `.log` dans le répertoire courant.
- **Privilèges sudo** : Certains outils nécessitent des privilèges sudo pour être exécutés (ex : `masscan`, `hping3`, `unicornscan`, `zmap`), et sont automatiquement exécutés avec `sudo`.

## **Mode d'emploi**

### 1. **Installation**

```bash
sudo dpkg -i glish-scanner.deb
```

Cela installera le script et les dépendances nécessaires sur ton système.

### 2. **Lancement du script**

Après l'installation, tu peux exécuter le script avec les privilèges `sudo` :

```bash
sudo glish-scanner
```

### 3. **Utilisation**

Lorsque tu exécutes le script :
- **Saisie de l'adresse IP** : Tu seras invité à entrer l'adresse IP cible à scanner.
- **Sélection des outils** : Une interface `dialog` te permet de choisir les outils que tu veux utiliser parmi les suivants :
  - **Nmap** (scan de ports)
  - **Dmitry** (information sur l'hôte)
  - **Netcat** (scan de ports)
  - **Masscan** (scan de ports rapide)
  - **Hping3** (outil pour tester la réponse des ports)
  - **Unicornscan** (scan de ports)
  - **ZMap** (scan de ports à grande échelle)
  
  Les outils sont sélectionnables par case à cocher.

- **Affichage des résultats** : Chaque outil sélectionné est lancé dans une fenêtre `xterm` distincte, et les résultats sont enregistrés dans des fichiers `.log` dans le répertoire courant.
- **Privilèges `sudo`** : Les outils nécessitant des privilèges élevés (comme `masscan`, `hping3`, `unicornscan`, et `zmap`) seront automatiquement exécutés avec `sudo`.

### 4. **Exemple de résultats**

Les résultats des scans seront sauvegardés sous forme de fichiers `.log` dans le répertoire où tu exécutes le script, avec des noms comme `nmap_<IP>.log`, `dmitry_<IP>.log`, etc.

---

## **Exemple d'utilisation**

1. **Installation du paquet** :

   ```bash
   sudo dpkg -i glish-scanner.deb
   ```

2. **Exécution du script** :

   ```bash
   sudo glish-scanner
   ```

3. **Choix des outils à utiliser** : 
   - Choisis les outils à utiliser parmi `Nmap`, `Dmitry`, `Netcat`, etc.
   - Entrez l'adresse IP de la cible.

4. **Analyse et résultats** :
   - Chaque outil sélectionné sera lancé dans une fenêtre `xterm`.
   - Les résultats seront enregistrés dans des fichiers `.log` dans le répertoire courant.

---

## **Dépendances**

Le script nécessite que les outils suivants soient installés sur ton système :
- `dialog`
- `xterm`
- `nmap`
- `dmitry`
- `nc` (Netcat)
- `masscan`
- `hping3`
- `unicornscan`
- `zmap`

Ces outils peuvent être installés à l'aide de `apt` sur une distribution Debian/Ubuntu :

```bash
sudo apt update
sudo apt install dialog xterm nmap dmitry netcat masscan hping3 unicornscan zmap
```

---
