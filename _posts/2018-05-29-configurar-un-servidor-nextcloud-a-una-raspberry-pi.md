# Configurar un servidor NextCloud en una Raspberry PI

En un moment d'auge dels serveis Cloud i sobretot d'aquells que emmagatzemen dades personals, som molt poc conscients de les implicacions que pot tenir que les nostres dades, documents i en general la nostra vida, estigui en mans de ves a saber qui -en realitat en mans de grans empreses de publicitat-. Ens han fet creure que els serveis que ofereixen totes aquells neoliberals de la vall del silíci són gratuïts a canvi de res, hi vam caure de quatre potes.

És hora d'anar poc a poc migrant cap a models de consum tecnológics més ètics i lliures, empoderar-nos i aconseguir una sobirania tecnològica per a un canvi real de la societat.

Una de les coses que podem fer és migrar serveis d'emmagatzematge com Dropbox o Google Drive a plataformes que no facin negoci amb la teva informació i t'assegurin la teva privacitat i seguretat dels teus arxius, la [Cooperativa proComuns](https://twitter.com/femprocomuns) per exemple va llançar un projecte interessant anomenat [CommonsCloud](https://en.goteo.org/project/commonscloud) del qual estar pendents

D'altra banda, podem instal·lar-nos a casa un petit servidor d'emmagatzematge com el [NextCloud](https://nextcloud.com) que ens servirà per desar-hi les nostres dades, jo ho faré amb una Raspberry PI 2 i un disc dur extern de 3TB

## Requeriments de memòria

* Mínim de 128MB de RAM, recomanats 512MB

Podeu veure'n els requeriments complerts a https://docs.nextcloud.com/server/13/admin_manual/installation/system_requirements.html#system-requirements

## Què utilitzarem?

* Raspberry PI 2 (A 900MHz quad-core ARM Cortex-A7 CPU, 1GB RAM) + carcassa
* Targeta microSD 16GB
* Adaptador targeta SD
* Disc dur extern 3TB
* Lector de targetes SD
* Cable de xarxa
* PC o Portàtil connectat a la mateixa xarxa


### Instal·lació del sistema operatiu

Utilitzarem l'última versió d'un sistema ja preparat per a aquestes màquines i basat en Debian, Raspbian Stretch Lite

Podem descarregar la imatge de https://downloads.raspberrypi.org/raspbian_lite_latest

#### Volcar la imatge a la targeta SD

La forma més senzilla de fer-ho és amb el programa [Etcher](https://etcher.io/) multiplataforma, per Windows, Linux i Mac OS i és tan senzill com fer 3 passos:

1. Seleccionar la imatge descarregada de Raspbian
2. Seleccionar l'unitat de la targeta SD
3. Fer clic a Flash!

TODO: imatge

Un cop ha acabat el procés hem de fer un pas adicional en el nostre cas, ja que no disposarem d'interfície gràfica per accedir a la màquina i hi voldrem accedir per SSH, que en aquesta versió de Raspian Stretch ve desactivat per defecte.

Per solucionar-lo un cop instal·lat el sistema a la SD crearem un fitxer buit ``ssh`` a l'arrel de la targeta SD.

Si no teniu cable de xarxa també haureu de [configurar la Wi-Fi](https://www.raspberrypi.org/forums/viewtopic.php?t=191252).

#### Accés a la Raspberry PI per ssh

Primer haurem de saber en quina IP està la màquina, per això des d'un altre PC amb GNU/Linux o Mac podrem fer us de la terminal.

```shell
$ sudo nmap -sn 192.168.1.0/24
```

O podem fer servir una aplicació GUI, [Nutty](https://itsfoss.com/nutty-network-monitoring-tool/) si tenim una distribució basada en Ubuntu

D'aquesta manera identificarem la nostra Raspberry, en el nostre cas és troba sota la IP ``192.168.1.103``

```shell
$ ssh pi@192.168.1.103
```

Per defecte, en aquesta distribució el ``root`` és l'usuari ``pi`` i té per defecte la contrassenya ``raspberry`` així que el primer que farem un cop connectats serà canviar-la.

```shell
$ passwd
```

#### Preparant el servidor

NextCloud basicament és com una web així que té els requeriments bàsics avui en dia de qualsevol servidor web.

Recomanen:

* Red Hat Enterprise Linux 7 / Ubuntu 16.04 LTS
* MySQL/MariaDB
* PHP 7.0, 7.1 or 7.2.
* Apache 2.4 with mod_php

Així que començarem actualitzant el sistema i instal·lant el servidor ``Apache2``

```shell
$ sudo apt-get update
$ sudo apt-get upgrade
```

```shell
$ sudo apt-get install apache2
```

Instal·lem PHP i tots els móduls necessaris

```shell
$ sudo apt-get install php7.0 php7.0-gd sqlite php7.0-sqlite php7.0-curl php7.0-mbstring php7.0-zip php7.0-xml
```

**NOTA 1:** Hem optat per _SQL Lite_ per que no consumeix tans recursos com un _MySQL_, si teniu una maquina més potent o esta pensat per albergar més usuaris us recomano utilitzar _MySQL_

```shell
$ php7.0-mysql mysql-server php-mysql
```

**NOTA 2:** Paquets opcionals

```shell
$ redis-server php-redis letsencrypt python-letsencrypt-apache
```

Reinciem i comprovem que tot esta funcionant correctament accedint a la IP de la maquina des del navegador

```shell
$ sudo service apache2 restart
```

#### Instal·lant NextCloud

Ens situem al directori arrel del servidor web

```shell
$ cd /var/www/html
```
I descarreguem i descomprimim l'última versió del NextCloud

```shell
$ curl https://download.nextcloud.com/server/releases/nextcloud-13.0.2.tar.bz2 | sudo tar -jxv
```

Això ens crearà un directori amb la instal·lació

```shell
$ cd /var/www/html/nextcloud
```

Per a seguir amb la configurarció hem d'especificar un directory ``data`` en el que emmagatezmarà la informació

```shell
$ sudo mkdir -p /var/www/html/nextcloud/data
```

Canviem els permisos per a que el servidor web en sigui el propietari d'aquests nou directori i dels de configuració i les aplicacions

```shell
$ sudo chown www-data:www-data /var/www/html/nextcloud/data
$ sudo chown www-data:www-data /var/www/html/nextcloud/config
$ sudo chown www-data:www-data /var/www/html/nextcloud/apps
```
o

```shell
$ sudo chown www-data:www-data data config apps
```

Li donem permisos d'escriptura i lectura

```shell
$ sudo chmod 750 /var/www/html/nextcloud/data
```

#### Accedint a NextCloud

Amb la IP de la nostra màquina accedim a ``http://192.168.1.103/nextcloud`` i veurem una pantalla d'accés en la que ens demana un usuari i contrassenya d'administrador que haurem de crear.

TODO: Imatge pantalla login

Un cop dins poden accedir a configurar diverses opcions i instal·lar aplicacions.

Activarem **External storage support** i la configurarem per accedir al nostre disc dur connectat a la Raspberry PI 2 a ``/media/rasp3tb``


TODO: Imatge configuració ruta


#### NextCloud Online

TODO: Manual per configurar router per poder accedir a la IP de fora de la xarxa local. Accedir a la gateway i mirar les opcions que hi ha
basicament és mapejar el port 8080 del router, per exemple, per a que apunti a la ip local de la raspberry al port 80

Despres podriem agafar un subdomini didacrios.cat i apuntar-lo a la ip, el problema és cada cop que canviï la IP quan reinicia el router)


## Referències

[How to Setup a Raspberry Pi Nextcloud Server](https://pimylifeup.com/raspberry-pi-nextcloud-server/)

[Nextcloud 13 Administration Manual](https://docs.nextcloud.com/server/13/admin_manual/contents.html)

[NextCloud on the Raspberry Pi DIY Dropbox](http://www.instructables.com/id/NextCloud-on-the-Raspberry-Pi-DIY-Dropbox/)