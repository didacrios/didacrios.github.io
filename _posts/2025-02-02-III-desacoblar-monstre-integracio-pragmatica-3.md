---
title: "Desacoblant el monstre: Una integració pragmàtica (III)"
permalink: /desacoblar-monstre-integracio-pragmatica-3/
tags:
  - decoupling
  - integration
  - pragmatic solutions
  - legacy systems
  - technical debt
  - software development
  - refactor
  - symfony
  - messenger
  - rabbitmq
  - sqs
  - webhooks
published: false
mermaid: true
toc: true
part: 3
series:
  - title: "De software legacy a oportunitat estratègica: El punt de partida"
    part: 1
    permalink: /software-legacy-oportunitat-estrategica-punt-partida-1/
  - title: "Comprendre el domini i construir l'equip: Les bases del canvi"
    part: 2
    permalink: /comprendre-domini-construir-equip-bases-canvi-2/
  - title: "Desacoblant el monstre: Una integració pragmàtica"
---

En les enteriors entrades de la sèrie hem vist els reptes tècnics principals i com vam abordar-los, però també haviem de tenir clar quins eren els objectius de l'empresa, i mirant a un any vista, ens haviem d'adherir a uns terminis inamovibles, especialment els lligasts a les campanyes més importants de l'any per a l'empresa: la campanya d'estiu i el Black Friday. I la veritat, es que aquestes dues campanyes tan fortes no deixen gaire marge de maniobra amb l'estiu i moltes vacances pel mig, així que vam haver de ser molt pragmàtics en les nostres decisions i implementacions, prioritzant un MVP funcional que pogués estar en producció al juliol.

![Roadmap del projecte a 1 any vista](https://res.cloudinary.com/dufky4znh/image/upload/v1737921425/shopify-timeline_nkaypq.png)

L'arribada del nou ecommerce (Shopify) es faria en dues fases, obrint primer els mercats amb menys volum (*soft launch*) durant l'estiu i després els més grans (*hard launch*) abans de Black Friday, per tal de minimitzar riscos i aprendre de les primeres integracions.

Així doncs, el nostre objectiu era tenir l'aplicatiu completament funcional i en producció al juliol, amb la intenció d'obrir alguns mercats amb menys volum utilitzant el nou ecommerce basat en Shopify.

## Desafiaments específics amb Shopify

L'ecosistema de Shopify està preparat per a que el client final de Shopify no s'hagi de preocupar gaire més que del seu negoci i encara que ofereixin, a nivell de màrqueting, totes les garanties i suport al client, al final recomana que es treballi directament amb un *partner*, es a dir a través d'un intermediari, ja sigui un desenvolupador o una agència especialitzada en Shopify, per tal de garantir que tot funcioni correctament i que el client tingui un suport tècnic adequat.

En el nostre cas, que voliem fer la integració nosaltres mateixos i no utilitzar un partner, vam valorar les diferents opcions, que eren **Webhooks**, **Google PubSub** o **Amazon EventBridge**. Amb les limitacions de temps que teniem en aquell moment, i coneixements limitats amb els sistemes de missatgeria recomanats, vam deciri ser pragmàtic i utilitzar **Webhooks**.

Qualsevol de les opcions, requeriem de realitzar [Custom apps de Shopify](https://shopify.dev/concepts/apps?itcat=partner_blog&itterm=how_to_build_a_shopify_app#custom-apps) ja que no havía de ser una app pública disponible a la **Shopify App Store**, i per fer aquest tipus de apps només es podia fer a través d'un *partner* que com que l'haviem descartat, en el nostre cas vam ser nosaltres mateixos.

Aquí es on vam haver de començar a revisar documentació sobre com fer una app, de quin tipus, els permisos necessaris per a que ens arribes la informació necessària a través dels webhooks, etc. I tot i que Shopify ofereix una API bastant completa i ben documentada, no deixa de ser un nou ecosistema amb el que no estàvem familiaritzats.

![Comunicació Shopify-App](https://res.cloudinary.com/dufky4znh/image/upload/v1737709355/xs4sdofvyb7rtloivm4n.svg)

La primera preocupació que vam tenir era la d'assegurar una ràpida resposta als webhooks, i processar-los de forma asincrònica, ja que no podíem permetre'ns que la nostra aplicació estigués bloquejada esperant una resposta de Shopify. Per això vam decidir utilitzar el component de missatgeria de Symfony, el **Messenger**, que ens permetia processar els missatges de forma asincrònica i amb diferents transports.

---

 fins i tot revisar-ne de tercers, però vam decidir utilitzar els webhooks per rebre notificacions en temps real de canvis en les comandes. Això ens permetria mantenir la nostra arquitectura actual i processar les comandes de Shopify com si fossin comandes tradicionals a la nostra app.

 a que els desenvolupadors puguin integrar-se amb la plataforma de moltes maneres diferents, d'aquí

Teniem varies opcions per integrar-nos amb Shopify, des de buscar una app de tercers per.

però vam decidir utilitzar els webhooks per rebre notificacions en temps real de canvis en les comandes. Això ens permetria mantenir la nostra arquitectura actual i processar les comandes de Shopify com si fossin comandes tradicionals.



Tot i que la integració inicial amb els webhooks va anar bé, els desafiaments específics no van trigar a aparèixer:

- Friccions amb el model de negoci: Shopify opera amb un sistema més estricte que el nostre model tradicional, i això va requerir ajustar expectatives i processos.

- Integració tècnica: Vam desenvolupar una capa de ACL per transformar els payloads dels webhooks al nostre domini. Aquest enfocament ens va permetre gestionar les diferents parts de l’agregat "Order" (Payment, DeliveryOption, Customer, BillingAddress, DestinationAddress) mitjançant el patró Builder.

- Problemes amb la càrrega: Durant el "hard launch" al setembre, el volum de peticions en el mercat més gran va provocar errors 404, bloquejant la API de Shopify per seguretat i deixant l’aplicatiu parcialment inutilitzable.

## Preparant-nos per llançar l'aplicatiu amb el nou e-commerce

Amb la data límit de la campanya d’estiu al juliol de 2023, vam prioritzar:

1. Proves de rendiment: Realització de tests d’estrès per garantir la robustesa del sistema.
2. Soft-launch: Migració progressiva de mercats a Shopify a partir del 17 de juliol per minimitzar riscos.
3. Monitoratge i ajustos: Identificació de problemes i recopilació de feedback durant l’agost.

## Cap al futur: De webhooks a EDA

Els problemes trobats al setembre de 2023, especialment els bloquejos d’IPs, van evidenciar les limitacions dels webhooks com a solució a llarg termini. Això ens va portar a plantejar la transició cap a una arquitectura orientada a esdeveniments (EDA), que explorarem en detall en el proper article.

La integració pragmàtica que vam implementar no només ens va permetre assolir els objectius immediats, sinó que també va establir les bases per a futures millores, demostrant que un enfocament incremental pot ser tan efectiu com una transformació tecnològica completa.
