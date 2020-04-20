


brainstorm
----
/www/transfert_tms/omp/trans1/1.csv 2.csv 3.csv > sql8166_1
/www/transfert_tms/omp/trans2/1.csv 2.csv 3.csv > sql8166_2

	• 1 fichier
		○ Noms des transporteurs=nom de la base
 lire le fichier pour chaque ligne du fichier -> cd /www/transfert_tms/omp/$clé && pour chaque fichier dans le dossier mysql <commande d'import >  1 .csv ->  valeur.bdd

Script.sh CRON = taches planifiées exécute le script toto.sh tous les jours a 6h écris ok + la sortie des commandes dans le fichier /var/toto.log

Contraintes /questions
----- 
1 est ce que le serveur sftp peut joindre le serveur mysql ? (/!\ trou de sécu) != ->
2 comment exec le script ? Cron (tache planifié) , ou manuel ? 
3 comment gérer les logs/ les erreurs potentielles ? 

Fonctions principales----
	- Récup un fichier depuis le serveur
	- Importer ce fichier dans une bdd 
	- Faire correspondre transporteur=base
	- Automatisé + optimisé au max

Remarques
----
Si le serveur sftp peut joindre le serveur de bdd  = beaucoup moins de contraintes techniques
Si non , tu peux exec le script sur le serv web a condition qu'il puisse se connecter en sftp au serveur sftp.
Si acces ssh => pas d'exec en tant que root -> créer user spécifique
Meilleure solution d'apres moi = cron qui execute un script bash ou php a horaire fixe avec sortie de logs (par mail ? )  import ok >> import.log
