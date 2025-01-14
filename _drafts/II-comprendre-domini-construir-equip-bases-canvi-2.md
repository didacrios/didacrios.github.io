---
title: "Comprendre el domini i construir l'equip: Les bases del canvi (II)"
permalink: /comprendre-domini-construir-equip-bases-canvi-2/
tags: 
  - domain-driven design
  - team building
  - collaboration
  - agile
  - scrum
  - lean
  - product
  - software development
  - TDD
  - event storming
  - ddd
  - domain driven design
published: false
markdown: true
---

Quan comences un projecte complex com el que estem abordant, és essencial partir de zero en el coneixement del domini. Aquesta comprensió no només ajuda a l'equip tècnic a alinear-se amb els objectius del negoci, sinó que també estableix les bases per prendre decisions informades al llarg del desenvolupament.

El primer que calia fer era entendre com funcionava l'aplicatiu existent, identificar els diferents procesos que s'executaven i veure com estaven representats, establir un llenguatge comú amb l'anterior equip i els usuaris actuals del aplicatiu. Les primeres sessions realitzades amb l'equip anterior, no van ser gaire fructíferes i vam haver de buscar alguna que altre solució.

## Domain-Driven Design (DDD)

Al incorporar-me com a *tech lead* des d'un principi vaig tenir clar que li haviem de donar un enfocament domain-driven tant al projecte com a l'equip. Això ens permetria moure el domini al centre de la narrativa, d'aquesta manera alineariem l'equip al voltant d'un llenguatge comú (*ubiquitous language*) que ens facilitaria la comunicació i ens permetria fer un mapa de l'estat actual de l'aplicació.

Així que un cop format aquest equip inicial vam començar a prepar sessións d'[EventStorming](https://www.eventstorming.com/). Aquesta metodologia visual ens va ajudar a descompondre els processos clau del sistema i identificar esdeveniments de domini rellevants.

### Sessions EventStorming

Vam utilitzar una [plantilla de Miro](https://miro.com/miroverse/event-storming/) per facilitar les sessions, aquesta ja porta una mica de guía i llegenda de les referències claus que s'han de tenir en compte per enfocar aquestes sessions i que vindria bé familiaritzar-se amb elles abans de fer una sessió d'aquest tipus

```mermaid
flowchart TD
    subgraph Legend["Llegenda Event Storming"]
        direction TB

        Event["Event"]:::event
        Command["Command"]:::command
        Aggregate["Aggregate"]:::aggregate
        Policy["Policy"]:::policy
        Actor["Actor"]:::actor
        Note["Note"]:::note
    end

    classDef event fill:#fc5e03,stroke:#782c00,stroke-width:2px,corner-radius:5px;  
    classDef command fill:#00b2e8,stroke:#005c78,stroke-width:2px,corner-radius:5px; 
    classDef aggregate fill:#ffbf00,stroke:#7a5c00,stroke-width:2px,corner-radius:5px; 
    classDef policy fill:#6f00ff,stroke:#240054,stroke-width:2px,corner-radius:5px; 
    classDef actor fill:#ffdd00,stroke:#756600,stroke-width:2px,corner-radius:5px;
    classDef note fill:#fa0000,stroke:#660000,stroke-width:2px,corner-radius:5px;
```

Per maximitzar l'efectivitat de les sessions vam desenvolupar un procés estructurat en diverses fases:

1. **Exploració d'Events de Domini** (Foto inicial)
- Identificar els esdeveniments clau del sistema
- Ordenar-los cronològicament
- Detectar gaps i dependències
- Validar la seqüència amb els experts

2. **Refinament i Anàlisi**
- Afegir notes explicatives
- Documentar dubtes i preguntes
- Entrar més en detall en cada esdeveniment
- Marcar punts de decisió crítics

3. **Modelatge del Domini**
- Identificar agregats (*aggregates*) i les seves fronteres
- Definir actors i els seus rols
- Establir comandes (*commands*) que inicien processos
- Documentar polítiques (*policies*) i regles de negoci
- Identificar triggers externs i interns de cada esdeveniment

4. **Documentació i Validació**
 - Netejar i organitzar la informació recollida
 - Establir relacions clares entre elements
 - Validar el model amb tots els stakeholders
 - Crear documentació de referència


L'Event Storming no només ens va servir per entendre el domini, sinó que també va ser el punt de partida per aplicar els principis de Domain-Driven Design (DDD) tant a nivell estratègic com tàctic.

### DDD Estratègic

El procés de descobriment del domini a través de les sessions d'Event Storming ens va permetre aplicar els principis estratègics del Domain-Driven Design d'una manera més natura.. Aquest enfocament va ser fonamental per entendre no només com funcionava el sistema, sinó també per identificar oportunitats de millora i simplificació. No son fàcils aquest tipus de  sessions, a vegades et perds en detalls, d'altres no aprofundeixes prou, a vegades cometem l'error de nou incloure els experts del domini (*domain experts*) a la conversa, però cal fer aquest treball en comú, per aclarir conceptes i unificar-los, alinear-se per trobar un consens a l'hora de modelar el domini i que aquest es pugui representar de igual manera també en el codi. 

#### Establint els Límits (*Bounded Contexts*)

Les sessions ens van permetre identificar els diferents contextos delimitats (Bounded Contexts) del nostre domini. Aquest procés va ser crucial ja que ens va ajudar a entendre on havíem de dirigir els esforços de desenvolupament i quines parts del sistema podien ser simplificades, desacoblades o eliminades. Tecnicament, ens vam centrar especialment en la implementació de *Anti-Corruption Layers* (ACL), ja que ens permetien interactuar amb sistemes externs sense comprometre la integritat del nostre sistema.

Inicialment vam poder establir 5 grans contexts diferenciats clarament:
- Assignació de comandes
- Generació d'etiquetes
- Preparació de comandes
- Integració E-commerce
- Preparació de comandes massiu

[![Bounded Contexts, OMS](https://res.cloudinary.com/dufky4znh/image/upload/c_thumb,w_200,g_face/v1736502607/event-storming2_nlyn9s.png)](https://res.cloudinary.com/dufky4znh/image/upload/v1736502607/event-storming2_nlyn9s.png)


#### Llenguatge Ubic (*Ubiquitous language*)

Un altre aspecte fonamental va ser establir un llenguatge ubic (*ubiquitous language*) sòlid i es que els avantatges d'estabir-lo son molt superiors a qualsevol sobresforç de traducció, o el risc de malinterpretar conceptes. Els experts de domini (*Domain Experts*) i els programadors han de treballar conjuntament en establir aquest llenguatge comú, que va més enllà d'un simple glossari de termes, es tracta d'establir un recurs viu i dinàmic que connecta l'equip tècnic amb els experts del domini. L'esforç en la seva implementació va facilitar la comunicació, va reduir malentesos i va assegurar que el codi fos una representació fidel del domini, per que al final desenvolupar software no es una questió tècnica, és comunicar-se i treballar conjuntament.


### DDD Tàctic

Un cop definit el marc estratègic, vam passar a implementar principis de DDD tàctic en el sistema. Això ens va permetre estructurar el codi de manera que reflectís la realitat del domini i fos més sostenible a llarg termini.

#### Entitats (*Entities*) i Objectes de Valor (*Value Objects*)

Les entitats (Entities) i els objectes de valor (Value Objects) són dos conceptes fonamentals en el Domain-Driven Design (DDD). Per entendre com funcionen, és important destacar les seves diferències i el paper que juguen dins del domini.

#### Entitats (*Entities*) 

Les entitats són elements del domini que tenen una identitat única que perdura al llarg del temps, fins i tot si els seus atributs canvien. Aquesta identitat única és el que les distingeix d'altres elements del mateix tipus. A més, les entitats solen tenir un cicle de vida definit dins del sistema. Exemples d'entitats que vam identificar en el projecte són:

* Order: Representa una ordre de compra amb una identitat única i un estat associat.
* Product: Element del catàleg amb atributs com el codi SKU, preu i descripció.
* Carrier: Empresa encarregada de lliurar les comandes amb opcions de servei específiques.
* Shop: Identifica de quin e-commerce o plataforma ens ha arribat la comanda.
* Customer: Persona o entitat que realitza la comanda i rep el producte.

#### Objectes de Valor (Value Objects)

Els objectes de valor, en canvi, són elements del domini que no tenen identitat pròpia. El seu valor és el que els defineix, i per això, dos objectes de valor amb els mateixos atributs són considerats equivalents. Això els fa immutables i ideals per encapsular conceptes clau que poden aparèixer en diverses parts del domini. Alguns exemples d'objectes de valor en el projecte inclouen:

* ProductReference: Codi únic per identificar un producte.
* OrderReference: Identificador únic d'una comanda.
* Price: Amb moneda i valor precís.
* Weight: Amb unitats de mesura estandarditzades.
* ShippingNumber: Número d'identificació per seguiment.

Aquest enfocament ens ajuda a crear codi més comprensible i modular, ja que cada element del sistema té una responsabilitat clara i ben definida.


#### Serveis (Services)

En una aplicació complexa com la nostra, el concepte de Serveis juga un paper central en el manteniment d'un codi net i modular. Els serveis es classifiquen en diferents capes i tipus segons el seu propòsit i els patrons que implementen. Explorem l'estructura i els patrons que fem servir per organitzar i implementar serveis de manera efectiva.

##### Serveis de Domini

Els Serveis de Domini encapsulen lògica de negoci que no encaixa directament en cap entitat o valor específic. Són serveis que operen estrictament dins de les regles del domini i no tenen dependències amb components d'infraestructura.

```php
class CheapestCarrierGetter
{
    public function get(
        DeliveryOptionCarrierCollection $deliveryOptionCarriers,
        Weight                          $orderWeight,
        Country                         $country,
        PostalCode                      $postalCode,
        bool                            $isCashOnDelivery = false,
    ): Carrier {
        // Lògica per obtenir el transportista més econòmic
    }
}
```

##### Serveis d'aplicació

Els Serveis d'Aplicació encapsulen i coordinen lògica que combina operacions de domini amb interaccions externes per implementar escenaris específics de negoci o aplicació. Aquests serveis centralitzen i simplifiquen la implementació d'operacions complexes, assegurant una separació clara entre el domini i la infraestructura. Els més coneguts són els casos d'ús (use cases) però en el nostre cas  també tindrem *Command Handlers* i *Event Handlers*.

```mermaid
graph TD
    ApplicationServices["Application Services"] --> UseCases["Use Cases"]
    ApplicationServices --> EventHandlers["Event Handlers"]
    ApplicationServices --> CommandHandlers["Command Handlers"]
```

Els Use Cases representen accions o processos específics que l'aplicació necessita realitzar per complir amb els requisits de negoci. Encapsulen la lògica necessària per executar operacions complexes, incloent-hi interaccions amb serveis de domini i infraestructura, mantenint el domini net i focalitzat. Podriem dir que la seva responsabilitat hauria de ser nomes la d'orquestrar entre aquestes dues capes, i deixant la responsabilitat cap al domini, com diu Vaughn Vernon *“Keep Application Services thin, using them only to coordinate tasks on the model.”*

Els *Command Handlers* són la porta d'entrada per a les modificacions en el domini. En rebre un *Command*, validen la petició, deleguen la lògica de negoci als agregats corresponents i, finalment, publiquen un esdeveniment que reflecteix el canvi produït en el sistema.

D'altra banda els *Event Handlers* actuen com a *listeners* a canvis en el sistema. Escolten esdeveniments i executen accions específiques en resposta, com ara enviar notificacions, actualitzar altres agregats o integrar-se amb sistemes externs. Aquesta reacció desacoblada permet construir sistemes més flexibles i escalables. Ampliaré els detalls i conceptes en pròximes entrades quan parlem sobre l'evolució de l'aplicatiu com a una arquitectura basada en events i sistemes de cues(Event-Driven Architecture, EDA).


```php
readonly class NotifyShopOnOrderShipped implements EventHandlerInterface
{
    public function __construct(
        private OrderRepositoryInterface    $orderRepository,
        private ExternalOrderUpdaterFactory $externalOrderUpdaterFactory,
        private LoggerInterface             $logger
    ) {}

    public function __invoke(OrderShippedDomainEvent $event): void
    {
        // Lògica per notificar la botiga quan una comanda ha estat enviada
        $order = $this->orderRepository->findById($event->getOrderId());
        if (!$order) {
            $this->logger->error("Comanda no trobada", ['orderId' => $event->getOrderId()]);
            return;
        }

        $updater = $this->externalOrderUpdaterFactory->create($order);
        $updater->updateStatus('shipped');

        $this->logger->info("Notificació d'enviament completada", ['orderId' => $order->getId()]);
    }
}
```
##### Serveis d'Infraestructura

Els Serveis d'Infraestructura implementen operacions que depenen de components externs com bases de dades, sistemes de fitxers o serveis de tercers. Sovint actuen com adaptadors per garantir que el domini es mantingui agnòstic a la implementació concreta.

```php
namespace Picking\Infrastructure\Service\Logger;

use Picking\Domain\Service\LoggerInterface;
use Monolog\Logger;

class MonologLogger implements LoggerInterface
{
    private $logger;

    public function __construct(Logger $logger)
    {
        $this->logger = $logger;
    }

    public function info(string $message, array $context = []): void
    {
        $this->logger->info($message, $context);
    }

    public function warning(string $message, array $context = []): void
    {
        $this->logger->warning($message, $context);
    }

    public function critical(string $message, array $context = []): void
    {
        $this->logger->critical($message, $context);
    }

    public function error(string $message, array $context = []): void
    {
        $this->logger->error($message, $context);
    }
}
```

##### Classificació dels serveis

Com hem vist, els serveis ens serveixen per desacoblar i descomposar lògica de la nostra aplicació d'una forma més granular i independent., aquí us deixo una classificació de serveis comuns que hem identificat en els nostre projecte, agrupant-los segons la seva funció principal i associant-los a patrons de disseny coneguts. Aquesta classificació ens permet tenir una visió més estructurada de la nostra arquitectura i facilita la presa de decisions a l'hora de dissenyar noves funcionalitats. 


| Tipus de Servei  | Descripció                                                                | Patró       | Exemple                                                 |
| ---------------- | ------------------------------------------------------------------------- | ----------- | ------------------------------------------------------- |
| **Transformers** | Converteixen dades entre diferents formats o representacions.             | *Adapter*   | Convertir respostes d'API externes en models de domini. |
| **Builders**     | Construeixen objectes complexos pas a pas.                                | *Builder*   | Crear un objecte `Order`.                               |
| **Factories**    | Creen objectes de domini assegurant que compleixen regles i restriccions. | *Factory*   | Crear instàncies de `Product`.                          |
| **Presenters**   | Donen format a les dades per a la interfície d'usuari o respostes d'API.  | *Decorator* | Enriquir dades per mostrar-les a l'usuari.              |
| **Notifiers**    | Envien notificacions (correu, SMS, etc.).                                 | *Observer*  | Notificar l'usuari de canvis importants.                |
| **Validators**   | Asseguren que objectes compleixin regles de negoci.                       | *Strategy*  | Validar sol·licituds d'usuari o formularis.             |
| **Clients**      | Interactuen amb aplicacions o serveis externs.                            | *Proxy*     | Consumir APIs externes per obtenir informació.          |

---

Tots aquests conceptes de domini són només una petita mostra de tot el que vam arribar a fer modelat. Evidentment, tampoc ho vam fer de cop ni vam encertar tot a la primera: hi ha moltes parts que encara van quedar pendents de reestructurar, conceptes que no vam acabar d'aclarir del tot i repositoris que sabíem que no tenien sentit, però que havíem de mantenir per funcionalitats, però que haviem d'acabar d'eliminar.

Però amb aquesta feina feta inicialment, es va permetre que tot l'equip participés en aquest procés i tingués un compromís (*commitment*) per tot el que estàvem construint.

Per aprofundir en aquests conceptes de DDD i com aplicar-los, recomano llegir els llibres següents:

- "Domain-Driven Design: Tackling Complexity in the Heart of Software" d'Eric Evans: L'obra fundacional sobre DDD que introdueix i explica en profunditat els conceptes d'entitats i objectes de valor.
- "Implementing Domain-Driven Design" de Vaughn Vernon: Un llibre pràctic que ofereix exemples concrets de com implementar DDD en projectes reals.
- "Domain-Driven Design in PHP" de Carlos Buenosvinos, Christian Soronellas & Keyvan Akbary

## Construïnt equip

l procés d'adopció de DDD va anar paral·lel a l'evolució de l'equip. Aquí és on entra el model d'etapes de Tuckman (1965): *Forming, Storming, Norming, Performing*. Segons aquest model, els equips passen per quatre fases distintives per arribar al màxim rendiment. Durant la fase inicial (Forming), els membres de l'equip s'introdueixen i defineixen objectius generals. A la fase de Storming, emergeixen conflictes mentre es comencen a establir els rols. Amb el temps, en la fase de Norming, els equips aconsegueixen una dinàmica de treball cohesionada, que culmina en Performing, on es treballa de manera eficient cap als objectius comuns.

Aquest procés no només ens va ajudar a alinear les nostres pràctiques tècniques, sinó també a desenvolupar una cultura de col·laboració i confiança. Tal com descriu Tuckman (1965), comprendre i abraçar aquestes etapes és clau per construir equips d'alt rendiment. La referència original pot trobar-se al seu treball: Tuckman, B. W. (1965). Developmental sequence in small groups. Psychological Bulletin, 63(6), 384–399.

### Forming

L’equip es va formar amb dos desenvolupadors inicials, que van començar revisant el projecte i documentant el seu funcionament, mentre altres membres tancaven els seus respectius projectes per incorporar-se en aquest. Jo em vaig incorporar com a tech lead i posteriorment es va afegir un altre programador.

### Storming

No podríem dir que hi va haver grans desavinences dins l'equip, però sí que vam veure la necessitat de "regular" certs aspectes. En aquest procés va destacar la importància d'establir acords d’equip (team agreements) i estàndards per al codi i els processos.

### Norming

Durant aquest període vam acordar diversos aspectes per facilitar el treball en equip:
- Team Agreements: Normes per al treball en equip i la comunicació.
- Coding Standards: Guies per escriure codi net i mantenible.
- Procés de Desenvolupament: Definició clara de pipelines i fluxos de treball.
- Límits de WIP (Work In Progress): Per garantir un flux sostenible de treball.
- Deployments: Regles per a desplegaments controlats i fiables.
- Deute Tècnica i ADRs: Registre i justificació de decisions arquitectòniques.

### Performing

Amb tota la feina feta en les etapes anteriors, vam crear la guia perfecta per tenir un equip d'alt rendiment. Això ens va permetre implementar moltes millores tècniques i funcionals al producte, aportant valor i reduint la complexitat en pro de la simplicitat, a més de seguir ampliant els nostres coneixements a través de formacions conjuntes.

## Documentació

Tot aquest esforç no tenia sentit si no es feia visible. Ho vam documentar perquè estigués accessible en qualsevol moment i fàcil d'actualitzar. Utilitzàvem GitLab per gestionar el codi del projecte, així que vam activar la funcionalitat de GitLab Pages i utilitzar Jekyll amb el tema [Just the Docs](https://just-the-docs.com/).

Per organitzar la informació, vam adoptar el model [Diátaxis](https://diataxis.fr/):
- Tutorials: Guies per a funcionalitats del aplicatiu, destinades principalment a l'usuari final (exemple: Configuració de Transportistes).
- Guies: Instruccions pràctiques i solucions de problemes específics, tant per a usuaris finals com desenvolupadors (exemple: Com instal·lar l'aplicació).
- Explicacions: Coneixements en profunditat dels processos d'equip i estàndards (exemple: Team agreements i estàndards de codi).
- Referències: Informació detallada per a desenvolupadors (exemple: ADRs, arquitectura del aplicatiu).
  
Un següent pas que no vam arribar a implementar del tot va ser automatitzar la documentació tècnica mitjançant [Event Catalog](https://www.eventcatalog.dev/) i [AsyncAPI](https://www.asyncapi.com/).

