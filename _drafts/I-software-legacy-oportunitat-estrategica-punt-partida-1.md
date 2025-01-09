---
title: "De software legacy a oportunitat estratègica: El punt de partida (I)"
permalink: /software-legacy-oportunitat-estrategica-punt-partida-1/
tags: 
  - product
  - technical debt
  - big bang rewrite
  - refactor
  - lean
  - software development
  - scrum
  - xp
  - symfony
  - iteration
  - strangler fig
published: false
---

Quan parlem de software legacy, sovint pensem en aplicacions antiquades o mal dissenyades. Però la realitat és que el "legacy" pot ser qualsevol aplicació que, tot i funcionar correctament, presenta reptes significatius per a la seva evolució i manteniment. Aquesta és la història de com vam abordar la internalització d'una aplicació de gestió logística, amb el repte afegit d'una integració amb una nova plataforma de comerç electrònic.

## El context inicial

L'any 2018 es va desenvolupar una aplicació (OMS) amb l'objectiu de optimitzar el procés de preparació de comandes i garantir una integració eficient amb diferents operadors logístics. Desenvolupada en PHP (Symfony), MySQL, Socket.io i React, l'aplicació gestionava des de l'empaquetat fins a l'enviament, amb funcionalitats com el seguiment d'enviaments i mètriques de rendiment de la preparació de les comandes.

Durant anys, aquesta eina va complir el seu propòsit, però amb el temps i l'evolució del negoci, van començar a evidenciar-se limitacions importants.

## Els reptes que ens van portar a la internalització

### Deute tècnic acumulat

La situació del deute tècnic era especialment preocupant, ja que afectava múltiples capes del projecte. A nivell d'infraestructura tecnològica, l'aplicació s'executava sobre versions obsoletes tant del framework com del llenguatge base:

- La versió de Symfony (4.0) no era LTS (Long Term Support) i havia deixat de rebre actualitzacions de seguretat des de gener de 2019
- PHP 7.1, la versió utilitzada, també havia arribat al final del seu cicle de suport, deixant el sistema sense actualitzacions crítiques de seguretat

Però més enllà de les versions obsoletes, el projecte presentava mancances significatives en aspectes fonamentals del desenvolupament de software:

- **Testing inexistent o inadequat**: La falta de tests automatitzats (unitaris, d'integració i end-to-end) no només dificultava la detecció primerenca d'errors, sinó que també feia que qualsevol modificació fos un risc potencial per a l'estabilitat del sistema.

- **Absència d'estàndards de codi**: El codebase no seguia patrons ni estàndards documentats, i els que s'aplicaven no estaven alineats amb les millors pràctiques de la indústria. Això dificultava tant el manteniment com la incorporació de nous desenvolupadors al projecte.

- **Documentació insuficient**: La documentació existent era escassa i sovint incompleta. Això no només afectava el desenvolupament tècnic, sinó també la comprensió dels processos de negoci implementats en el codi.

- **Control de versions deficient**: L'històric de Git era poc explicatiu, amb commits poc granulars i missatges que no seguien cap convenció ni aportaven context sobre els canvis realitzats. Això dificultava entendre l'evolució del codi i les decisions preses al llarg del temps.

Aquesta acumulació de deute tècnic no només representava un risc per a l'estabilitat i seguretat del sistema, sinó que també:

- Alentia el ritme de desenvolupament de noves funcionalitats
- Augmentava el risc d'introducció d'errors
- Dificultava l'onboarding de nous membres a l'equip
- Incrementava els costos de manteniment
- Complicava la diagnosi i resolució de problemes

### Limitacions estructurals

L'arquitectura inicial presentava problemes d'acoblament que afectaven greument la seva flexibilitat i escalabilitat:

- *Dependència total amb l'e-commerce principal*:  L'aplicació no podia operar de manera autònoma, ja que totes les operacions logístiques depenien directament de les dades i processos de l'e-commerce. Això feia que qualsevol canvi en la plataforma principal pogués trencar la funcionalitat del sistema.
- *Base de dades compartida que generava problemes de rendiment*: Tant l'aplicació logística com l'e-commerce utilitzaven la mateixa base de dades, fet que ocasionava problemes de rendiment, especialment durant pics de càrrega en qualsevol de les dues aplicacions. A més, aquesta configuració complicava la gestió de permisos, ja que qualsevol accés a la base de dades podia comprometre dades crítiques d'altres sistemes.
- *Impossibilitat de funcionar de manera independent:*  L'aplicació estava dissenyada per operar exclusivament en conjunt amb l'e-commerce. Això no només limitava la seva portabilitat, sinó que també dificultava proves en entorns aïllats o la migració cap a altres plataformes. Les seves dependències no estaven adequadament encapsulades, fent que qualsevol intent d'aïllar-la requerís canvis massius i costosos en tot el sistema i no es respectava el principi de separació de responsabilitats (*Single Responsibility Principle*).
- *Dificultat per implementar noves funcionalitats:*La falta d'adhesió a principis com l'Obert/Tancat (OCP) i la Substitució de Liskov (LSP) dificultava enormement l'evolució del sistema. Les noves funcionalitats requerien modificar codi existent, augmentant el risc d'introduir regressions. A més, la dependència directa entre mòduls feia gairebé impossible seguir el principi d'Inversió de Dependències (DIP).

Aquest conjunt de limitacions estructurals no només reduïa la mantenibilitat i escalabilitat del sistema, sinó que també incrementava els riscos associats a qualsevol modificació o evolució, situant l'aplicació en un estat tècnicament fràgil i estratègicament vulnerable.


### Gestió del desenvolupament i alineació estratègica

Un dels reptes més significatius no era només tècnic, sinó estratègic. El desenvolupament extern, tot i ser funcionalment correcte, presentava limitacions importants en l'àmbit organitzatiu:

- *Desconnexió amb l'estratègia global:* El desenvolupament es realitzava de manera aïllada, sense una visió completa dels objectius i processos interns de l'empresa. Això resultava en funcionalitats que, tot i ser tècnicament correctes, no sempre s'alineaven amb les necessitats reals del negoci.
- *Manca de priorització estratègica*: Les noves funcionalitats s'implementaven sense un procés clar de valoració i priorització. No es qüestionava si una funcionalitat era realment necessària, si era la millor manera d'implementar-la, o si existien alternatives més eficients.
- *Desenvolupament reactiu vs. proactiu*: El desenvolupament seguia un patró majoritàriament reactiu, resolent necessitats immediates sense considerar l'impacte a llarg termini o les possibles sinergies amb altres processos de l'empresa.
- *Absència de processos de validació*: La manca d'un procés estructurat de revisió i validació resultava en funcionalitats que, tot i ser operatives, no sempre representaven la millor solució per als usuaris finals o per als objectius globals de l'empresa.

Aquesta situació no era sostenible a llarg termini, ja que:

- Generava un producte cada cop més desalineat amb les necessitats reals
- Dificultava la integració amb altres sistemes i processos de l'empresa
- Complicava la presa de decisions estratègiques sobre el producte
- Limitava la capacitat d'innovació i millora continua

### Impacte del cost basal

Un aspecte sovint oblidat però especialment rellevant en aquest projecte va ser el cost basal, un concepte que considero clau en el desenvolupament de software que es refereix al cost mínim necessari per mantenir operatiu un sistema, fins i tot sense afegir-hi noves funcionalitats o fer-hi millores.

En el nostre cas, el cost basal incloïa totes aquelles despeses derivades de la necessitat de mantenir versions obsoletes del framework i del llenguatge, solucionar incidències urgents derivades del deute tècnic acumulat, gestionar la dependència amb altres sistemes, adaptar-se a una arquitectura acoplada i poc coneixement del domini. Tot això consumia una part significativa dels recursos disponibles, afectant directament la capacitat d'invertir en innovació i millora contínua.

Si bé aquest factor no va ser determinant per prendre la decisió d’internalitzar el desenvolupament, va tenir un pes rellevant en la diagnosi inicial del projecte. Sovint, el cost basal es passa per alt en l'avaluació de la sostenibilitat d’un sistema, però en aquest cas, era una evidència clara que l’estratègia actual no era sostenible a llarg termini. A més, va quedar palès, com veurem en posteriors articles, que qualsevol intent de mantenir l’estructura existent augmentaria el cost basal de manera exponencial amb el pas del temps.

Per a una explicació més detallada sobre el concepte de cost basal i la seva importància, recomano consultar [l'article original d'Eduardo Ferro](https://www.eferro.net/2024/07/el-coste-basal-del-software.html)

## El punt d'inflexió: Un nou repte i una decisió estratègica

En qualsevol projecte de refactorització, es poden adoptar varies estratègies i es habitual trobar-se amb la dicotomia de: l'estratègia ([strangler fig](https://martinfowler.com/bliki/StranglerFigApplication.html) o començar de zero amb un "[big bang rewrite](https://scalablehuman.com/2023/10/14/why-a-big-bang-rewrite-of-a-system-is-a-bad-idea-in-software-development/)".

![Red pill blue pill meme, the question says Choose Refactor Strategy and options between Strangler Fig and Big Band Rewrite](https://res.cloudinary.com/dufky4znh/image/upload/v1736252569/refactor-strategy_jsl6bflh6bm5q9i1xgcn.png)

Inicialment, la decisió tècnica va ser treballar dins del mateix projecte legacy, aplicant l'estratègia **Strangler Fig**, un enfocament que consisteix a desenvolupar un nou mòdul o sistema que, progressivament, substitueixi les parts del sistema antic. Aquesta estratègia ens permetia fer canvis paral·lels (*parallel changes*), reduint riscos i mantenint la funcionalitat actual mentre construíem una base més sòlida per a les funcionalitats futures. 

Tanmateix, des del punt de vista de negoci, es va considerar que aquesta opció suposava un risc massa elevat per al sistema actual, que ja estava operatiu i complint les seves funcions. Es va prendre la decisió d’evitar tocar el projecte existent i apostar per desenvolupar una aplicació independent que complís amb els nous requeriments.

Aquest canvi de rumb ens va portar a fer un *fork* de la codebase existent, una decisió que, tot i ser tècnicament viable, comportava certs hàndicaps:

- Duplicació del codebase: Ara caldria mantenir dues bases de codi separades.
- Bases de dades separades: Es va haver de duplicar i adaptar l'estructura de dades per a cadascun dels sistemes.
- Infraestructura replicada: Era necessari desplegar un servidor independent i garantir una observabilitat adequada per a cada sistema.
- Major carrega cognitiva per a l'equip: Totes aquestes duplicitats requerien un esforç addicional per mantenir consistència entre els dos sistemes, augmentant la complexitat i el risc d'errors de l'equip.

Aquest enfocament ens va permetre avançar cap a una solució independent, garantint l'estabilitat del sistema existent mentre construíem un projecte alineat amb els nous objectius estratègics, també amb el compromís a nivell de negoci, de no ampliar funcionalitats y un control total del backlog del projecte fins haver fet la migració al nou ecommerce

| Pros | Contres |
|---------------------------|----------|
| Treballar en un entorn no productiu, reduint riscos en producció | Necessitat de mantenir temporalment múltiples projectes |
| Llibertat per implementar noves tecnologies i patrons des de zero | Duplicació temporal d'esforços en manteniment |
| Dpreocupar-se per les limitacions tècniques o dependències del sistema antic | La duplicació de funcionalitats pot alentir el desenvolupament a llarg termini per la necessitat de sincronitzar canvis entre sistemes |
| Capacitat de centrar-se exclusivament en les funcionalitats necessàries | Risc per als deadline per tenir dues bases de codi |
| Oportunitat d'implementar bones pràctiques des del principi | Complexitat en la gestió dels projectes |
| Major facilitat per incorporar testing des de l'inici | Necessitat de mantenir compatibilitat amb dades històriques |
| Flexibilitat per adaptar-se a nous requeriments de negoci | Cost inicial més alt en temps i recursos |
| Millor alineació amb l'estratègia global de l'empresa | Possible pèrdua temporal de funcionalitats no essencials |

## Conclusions i següents passos

La decisió d'internalitzar i reescriure un software legacy mai és fàcil, especialment quan aquest software compleix la seva funció. La dita de *si funciona no ho toquis* hi serà sempre present. No obstant això, de vegades és necessari fer un pas enrere per poder fer-ne dos endavant.

En els propers articles d'aquesta sèrie, explorarem com vam abordar aquests reptes, les decisions tècniques que vam prendre, i com vam transformar aquests desafiaments en oportunitats de millora i creixement.

