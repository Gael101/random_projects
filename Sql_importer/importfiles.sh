#!/usr/bin/env bash
compliation_des_fichiers_csv_en_sql(){
    username=$1
    password=$2
    filename=$3
    database=$4
    regex_temps="Temps_.*\.csv"
    regex_km="Km_.*\.csv"
    regex_paie="Paie_.*\.csv"
    #TODO: verif nom de l'host mysql
    if [ $filename =~ $regex_temps ]; then 
        mysql -h sql8166.webmo.fr -u $username -p$password $database <<EOF
        LOAD DATA INFILE "$filename" 
        INTO TABLE tiers_info_salarié 
        FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
        IGNORE 1 ROWS;
EOF 
    #TODO: ajuster table
    if [ $filename =~ $regex_km ]; then 
        mysql -h sql8166.webmo.fr -u $username -p$password $database <<EOF
        LOAD DATA INFILE "$filename" 
        INTO TABLE kilemeteres
        FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
        IGNORE 1 ROWS;
EOF
    #TODO: ajuster table
    if [ $filename =~ $regex_paie ]; then 
        mysql -h sql8166.webmo.fr -u $username -p$password $database <<EOF
        LOAD DATA INFILE "$filename"
        INTO TABLE paie 
        FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
        IGNORE 1 ROWS;
EOF
}

import_des_fichiers_des_clients(){
    liste_des_dossier_clients=$(ls ~/www/transfert_tms/omp)
    for dossier in $liste_des_dossiers_clients; do
        cd $dossier
        liste_des_fichiers=$(ls)
        for fichier in $liste_des_fichiers; do
            compliation_des_fichiers_csv_en_sql
} 