## Alias de terminal

Si hem de realitzar connexions a varis servidors, es fàcil que no recordem sempre les IP. Es aquí on podem utilitzar alias

En Linux podem configurar alias de moltes maneres, bé podria ser des de la nostra terminal al `.bashrc` o `.zshrc`.

Per exemple, si vull fer-me un alias d'access a la meva Raspberry PI i no anar sempre escribin l'usuari i la seva IP puc fer-me el seguent alias

1) Obrim el fitxer rc de la nostra terminal, en el meu cas Oh My

```bash
nano ~/.zshrc
```

2) Afegim el alias

```rc
alias ssh-rpi='ssh root@192.168.1.39'
```

Reiniciem la terminal o refresquem el fitxer 

```bash
source ~/.zshrc
```

I ara només ens cal utilitzar l'ordre i introduir la clau d'accés


```bash
ssh-rpi
```

## Alternativa a alias de terminal

Podem utilitzar el fitxer de configuració de ssh per configurar els diferents servidors amb un nom

```bash
nano ~/.ssh/config
``` 

Aquí podem configurar els nostres servidors amb un nom

```bash
Host rpi
Hostname 192.168.1.39
        User root
```

Ara només cal accedir al servidor ssh mitjançant la següent comanda

```bash
ssh rpi
```

## Desant el login dels servidors ssh

Anem un pas més enllà i podem guardar la clau d'accés amb la comanda `ssh-copy-id`. Aqui podrem utilitzar el nom que hem assignat al nostre servidor

```bash
ssh-copy-id rpi
```

Ens demanarà l'usuari per a l'usuari root de la nostra Raspberry PI

I ara ja tenim accés sense haver d'introduir la contrasenya



