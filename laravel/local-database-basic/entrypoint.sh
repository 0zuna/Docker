#!/bin/bash
 
apt update && apt upgrade                                                                                                                                                                                                                      
apt install -y mariadb-client mariadb-server
service mysql start
chmod -R 777 /var/lib/mysql
echo '============================'
echo 'Configurando base de datos ='
echo '============================'
mysql -hlocalhost -uroot -e 'CREATE DATABASE IF NOT EXISTS `inventario-api`;update mysql.user set plugin = "mysql_native_password" where User = "root";flush privileges;'
php artisan migrate --seed
php artisan passport:install --force
cat << "EOF"
                     .,:::::::,.
                   ,::;;;;;;;;;;::,
                 ,::;;;;;;;;;;;;;;::
                ::;;;;;;;;;;;;;;;;:::.
               ::;;;;;;;;;;;;;;:::::,;;.
             ,::;;;;;;;;;;;;;::::,;;;;;;::,
            ::;;;;;;;;;;;;;;;;;;;;;;;;;;;,;;::,
          ,::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;::,
         ,::;;;;;;;;;;;;;;;;;;;;;::,vvvvvvvvv,;;;::,
      ,:,;;;;;;;;;;;;;;;;;;;;::,vvnnnnnnnnnnnnvv,;;::.
    ,::,;;;;;;;;;;;;;;;;;::,vv;;;;vvnnv,vnnnvv;;;vv,::
  ,:::,;;;;;;;;;;;;;;;;::,vvvv''';;;vvnv,vv,v;;vvvvv,'
 ;::::,;;;;;;;;;;;;;;::##'vvv,a####a;;vv,v,v;a##@avv,
 ;::::,;;;;;;;;;;;;::'###'vv,a#######,vvnnv,#####@;v;
 ;::::;;;;;;;;;;;;::'###'vvvv,###' `#,vvnnvv' `#@,;'
 ;;;;;;;;;;;;;;;::'####'vvn;;vvvvvv;;nnnnnnnnmv;;vv,
 ;;;;;;;;;;;;;::'######'vvnnnn;;;;nnvmnnnnnnnnnm,%vv,
 ;;;;;;;;;;;::',######'vvnnnnnnnnnv;mnnnnnnnnnnnnm,v'
 ;;;;;;;;;;'::,####%##'vvnnnnnnnn;nv;mnnnnnnnnnnnn,
 ;;;;;;;;'::::,###%###'vvnnnnnn;nnnnvvv;mnnnnnnnnm
 ;;;;;;;':::::,###%###'vvnnnn;v nnnnnnvvv;mmmmmmm'
 ;;;;;;;':::::,##%####'vvnn;vvnn `nnnnnnnvvvvvv
 ;;;;;;;;;;;:::,######'vvn;vvnnnn.,,,,.   'vv'#
 ;;;;,:::;;;;;;,#####'v;vvn;vnnnn;;;;;;; ,v'###
 ;;;;;,::::;;;;,#####'v%%;vvnnnnnnnnnnnnvv,##%#
 ;;;;;;,::::;;;,#####'vvv%%%%%;vvvnnnnnnnvv;###
 ;;;;;;;,::::;;,#####'vvvvvv%%%;vvvvvvvvvv'###%
 ;;;;;;;,::::;;,##%###'vvvvvvvv%%%%%%%';;;####%
 ;;;;;;;,::::;;;##%###'vvvvvvvvvvvv';;;;,;###%#              .,,,;'
 ;;;;;;;;,::::;;##%###'vvvvvvvv;;;;;,::;,:#####           //;;;;;'
 ;;;;;;;;,::::;;###%##'vvvvv';;;;,:::;;,::#####          //''''
 ;;;;;;;;,::::;;#######;;;;;;,::::;;;::,:,#####    ,sSSSSssSSSSs,
 ;;;;;;;;;,::::;###;###;;,:::::;;;;;;;,::,####'   SSSSSSSSSSSSS@SS.v,
 ;;;;;;;;;;,::::##;;###;;;;;;;;;;;;;,::::,####   v;SSSSSSSSSSSS#@S;vv
 ;;;;;;;;;;;,:::##::###;;;;;;;;:,::::::::,####  vv;SSSSSSSSSSSS#@S;vv
 ;;;;;;;;;;;;;,::#:;###;;;;;;;;;;;;;;;:::,####  vv;SSSSSSSSSSSS@S;vnv
 ;;;;;;;;;;;;;;;,::::##::::::::::;;;;;:::,####  vnv;SSSSSSSSSSS;vnvv'
 ;;;;;;;;;;;;;;;;;,:::##;;;;;;;;;;;;;::::,###'  `vnv;SSSSSSS;vnnnvv'
 ;;;;;;;;;;;;;;;;::::,::#;;;;;;;;::::::::,###   ,vvnnnnnnnnnnvvv'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;::::::::::::::,#',vvnnnnnnnnnnvvvv'
 ;;;;;;;;;;;;;;;;;;;;:::::::::::::,;;;;;,vvvnnnnnnnnnvvv'
 ;;;;;;;;;;;;;;;:::::::::::,;;;;;;;;;;;,vvnnnnnnnnnvv'
 ;;;;;;;;:::::::::::::,;;;;;;;;;;;;;;;,vvnnnnnnnnvv'
 ;;::::::::::::,;;;;;;;;;;;;;;;;;;;;;,vvnnnnnnnvv'
 ;;::::::,;;;;;;;;;;;;;;;;;;;;;;;;;,vvnnnnnnnvv'                                                                                                                                                                                               
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,vvnnnnnnvv'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,vvnnnnnvv'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,vvnnnnvv'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,vvnvv:::
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,vvv::::::
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;,:::::::::'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;,::::::::::
 ;;;;;;;;;;;;;;;;;;;;;;;;;;,::::::::::'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;,:::::::::'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;,::::::::'
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;,::::::'
EOF
echo 'welcome master'
