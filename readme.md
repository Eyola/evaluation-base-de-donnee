# Création et alimentation de la base

Toutes les ligne de code SQL, avec l'intégration des données factice, sont dans le fichier "Commande SQL".
A executer dans un éditeur SQL Type PHPStorm ou PHPMyadmin.

# Backup

Ouvrir un terminal de commande dans le dossier où l'on souhaite réaliser la sauvegarde.
Executer la commande suivante :

```SQL 
mysqldump -u root cinema > dump_cinema.sql
```

Avec :

    - root = nom d'utilisateur pour entrer dans la base de donnée
    - cinema = nom de la base de donnée à sauvegarder
    - dump_cinema.sql = nom du fichier qui sera sauvegarder dans le dossier où l'on se trouve


# Restoration
Vérifier si la base de donnée existe, en ouvrant un invité de commande, et executer les commandes suivante :

```SQL
mysql -u root
SHOW DATABASES;
```
Si la base n'existe pas :
```SQL
CREATE DATABASE CINEMA
```
Sinon :
```SQL
exit
mysql -u root cinema < dump_cinema.sql
```

Ou relancer un invité de commande dans le dossier et executer :
```SQL
mysql -u root cinema < dump_cinema.sql
```
