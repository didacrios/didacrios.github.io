---
title: Plantilla per a les iniciatives
permalink: /plantilla-iniciatives/
tags: 
  - product
  - product owner
  - project manager
  - agile
  - initiative
  - user story
  - lean
  - software development
  - scrum
  - xp
  - iteration
---

En els meus últims projectes amb responsabilitats compartides de Product Owner i Team Lead en la que tenia més control sobre el backlog del producte, vaig veure la necessitat de crear una plantilla per treballar les nostres iniciatives. Aquest sistema no només ens ajuda a prioritzar el treball enfront d'altres tasques, sinó que també garanteix que tots els implicats comparteixin un mateix context abans de començar. Aquesta metodologia reforça la transparència i l’alineament dins de l’equip i facilita l’avaluació de les decisions durant el desenvolupament.

## Què és una iniciativa?
 
Podem debatre molt sobre organització i jerarquia de les tasques en un *backlog*, cada equip i empresa son completament diferents. Des del meu punt de vista, una iniciativa és una agrupació de desenvolupaments necessaris per solucionar un problema o implementar una funcionalitat o requeriment. Cada iniciativa pot dividir-se en:

- Èpiques: Conceptes generals que funcionen com a etiquetes.
- Històries d’usuari: Unitats més concretes de treball.
- Tasques: Accions específíques derivades de les històries.

![Backlog items](/images/backlog-items.png)

## Com es treballa una iniciativa?

Idealment, l'equip es centra en una única iniciativa a treballar, la que té la prioritat més alta i està lo suficientment refinada per poder començar el seu desenvolupament. I que vol dir **suficientment refinada** us preguntareu? Aquí és on entra la plantilla, la plantilla ens donarà uns mínims, però al igual que una història d'usuari, no ens donarà la solució, sinó que serà el tret de sortida per trobar la millor solució.

## Com és la plantilla?

La plantilla conté diferents apartats que permeten capturar tota la informació necessària. Vegem els més importants:

### 💡 Títol de la iniciativa

Un títol breu i descriptiu que resumeixi el propòsit de la iniciativa.

### Taula resum

Inclou informació clau com:

| **Summary** |  |
| ----------- | --- |
| **🧑‍🏫 Product** |  Name of the product owner/ project manager in charge of the initiative |
| **👩‍💼 Stakeholders** | Name of the stakeholders involved  |
| **👥 Teams Involved** | Name of the teams |

### Criteris de priorització

Aquí es pot afegir el criteri de priorització que cada equip consideri, en el nostre cas hem passat per varis criteris, des del [RICE](https://www.productplan.com/glossary/rice-scoring-model/) a una [versió simplificada de la matriu Value/Urgency](https://blackswanfarming.com/qualitative-cost-delay/) per quantificar el màxim possible el cost del endarreriment.

| **Priorization criteria** |     |
| ----------------- | --- |
| **🎯 RICE Score** | Points |
| **💎 Value** | Meh \| Bonus \| Killer |
| **⏰ Urgency** | ASAP \| Soon \| Whenever |

### 📚 Context

L'equip o persona de producte s'ha d'encarregar de donar el màxim de context possible de la iniciativa, deixant clar l'**oportunitat** que implica aquesta iniciativa, quin **impacte** ens aporta i el **criteri** pel qual sabrem que aquesta iniciativa l'hem complementat.

### 🧐 Problemes a resoldre

A omplir per l'equip o persona de producte que ha proposat la iniciativa. Una taula que connecta la iniciativa amb els objectius globals de l'empresa:

### 📐 Framing

Aquesta taula s'ha d'omplir per part de l'equip o persona de producte amb l'ajuda d'un referent tècnic de l'equip, aquí es tracta també d'identificar a quins punts claus dels objectius globals de l'empresa impacta. Pot ser una **⭐ North Star** o pot ser un OKR, etc, el que s'intenta aquí es identificar si anem alineats o no.

|  | |
| ----------- | --- |
| **⭐ North Star** | filled by PM/PO  |
| **🚀 Direct Impact** | filled by PM/PO  |
| **🌱 Indirect Impact** | filled by PM/PO  |
| **💻 Development effort** | Low, Middle, High (filled by team lead or team) |
| **📈 KPIs** | filled by PM/PO  |

Fins aquest punt de la plantilla, tot el que s'ha demanat no requereix cap tipus de desenvolupament, però es molt rellevant per entendre el que es vol fer i dona la informació suficient per poder-la prioritzar o descartar-la. Si la passem a prioritzar i volem començar-ne el desenvolupament, el que farem, ja per part de l'equip de desenvolupament, es omplir un últim apartat que anirà seguit d'una *kick-off* per presentar el document i anar tots alineats.

###  🔭 Descoberta

En aquest apartat s'hauran d'omplir els següents punts:

#### 🛠️ Solució

En aquest punt es tracta d'exposar una proposta de solució, tot i que és a nivell teòric també pot anar acompanyat d'una prova de concepte (POC)

#### 🐉 Riscs

Llistats d'impdiments i riscs que poden afectar el desenvolupament o al producte pel fet d'optar per aquesta solució

#### 🔖 Enllaços i altres documents

Llistat d'altra informació rellevant o enllaços d'interes que poden ser útils. (Diagrames, issue tracker, project managment tool ...)

A continuació us deixò la plantilla complerta en format Markdown

```markdown
# 💡 Initiative Title

| **Summary** |  |
| ----------- | --- |
| **🧑‍🏫 Product** |  Name of the product owner/ project manager in charge of the initiative |
| **👩‍💼 Stakeholders** | Name of the stake holders involved  |
| **👥 Teams Involved** | Name of the teams |

| **Priorization criteria** |     |
| ----------------- | --- |
| **🎯 RICE Score** | Points |
| **💎 Value** | Meh \| Bonus \| Killer |
| **⏰ Urgency** | ASAP \| Soon \| Whenever |

## 📚 Context

The context should be filled by the PM, PO or the person who is proposing the initiative. It should contain the following information:

- **Opportunity**: What is the opportunity that we are trying to take advantage of?
- **Impact**: What is the impact that we are trying to achieve?
- **Success Criteria**: What are the criteria that we will use to measure the success of the initiative?

## 🧐 Problems to solve

The problems to solve should be filled by the PM, PO or the person who is proposing the initiative.

### 📐 Framing

|  | |
| ----------- | --- |
| **⭐ North Star** | filled by PM/PO  |
| **🚀 Direct Impact** | filled by PM/PO  |
| **🌱 Indirect Impact** | filled by PM/PO  |
| **💻 Development effort** | Low, Middle, High (filled by team lead or team) |
| **📈 KPIs** | filled by PM/PO  |

## 🔭 Discovery

### 🛠️ Solution

To be filled by the whole team or the team lead during the Kickoff

### 🐉 Risks

To be filled by the whole team or team lead during the Kickoff

### 🔖 Important links and documents

- [project managment](#)
- [drive folder](#)

```
 
