#!/bin/bash 
# Source : https://www.dsfc.net/infra/sauvegarde/sauvegarde-glpi/
DJ=$(date +%a|cut -d '.' -f 1) 
tar cfz /home/temp/glpi.$DJ.tgz -C /home/www glpi 
mariadb-dump --add-drop-database -B glpi -E -F --flush-privileges --single-transaction --protocol=socket -R | gzip > /home/temp/glpi.$DJ.sql.gz 
mariadb-dump -B mysql -E -F --flush-privileges -n --replace -x --protocol=socket -R --skip-add-drop-table | gzip > /home/temp/mysql.$DJ.sql.gz
