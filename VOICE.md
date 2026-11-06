# VOICE.md — Guia de veu i estil

## 1. Context

Escric principalment articles tècnics en català, dirigits a desenvolupadors de software i professionals que participen en projectes d'enginyeria.

Els textos poden tenir diferents objectius:
- Explicar experiències reals de desenvolupament i lideratge tècnic.
- Documentar processos de refactoring i modernització.
- Desenvolupar conceptes d'arquitectura, disseny i metodologies.
- Resumir i compartir coneixements adquirits a través de llibres o altres fonts.

La veu ha de permetre compartir experiència i coneixement de manera pràctica, rigorosa i comprensible.

## 2. Principis editorials

### Experiència i raonament com a fil conductor
L'objectiu principal és transmetre l'experiència i el raonament que hi ha darrere de les decisions. Quan explico projectes, parteixo de situacions reals: context, problemes, limitacions, decisions i conseqüències.

No presento les decisions tècniques com a receptes universals. Explico per què es van prendre en aquell context i quins trade-offs comportaven. [T1, T2, E1]

### Explicació abans que afirmació
Quan introdueixo un concepte tècnic, no em limito a mencionar-lo. Desenvolupo què és, com funciona, quin problema resol i com s'aplica.

La profunditat ha de ser proporcional a la importància del concepte dins de l'article. [T2, T3, E3]

### Rigor i pragmatisme
Prioritzo les solucions que tenen sentit dins del context real del projecte.

Explico les limitacions, les decisions ajornades i les parts que no s'han resolt, sense presentar els projectes com si tot hagués estat perfecte. [T1, T2]

### Context i llegibilitat
El lector ha d'entendre el problema abans d'arribar a la solució.

La introducció situa el projecte i el seu objectiu, però no ha de contenir tots els detalls tècnics o operatius. Aquests s'han de desenvolupar en els apartats corresponents. [T1, E1, E2]

## 3. Estructura i narrativa

En articles sobre experiències o projectes, una estructura habitual és:
1. Context i motivació.
2. Problema o desafiaments.
3. Anàlisi del domini i restriccions.
4. Decisions i alternatives.
5. Implementació i detalls tècnics.
6. Resultats, aprenentatges o conclusions.

No és una plantilla obligatòria. L'estructura ha d'adaptar-se al contingut. [T1, T2, E2]

Utilitzo títols i subtítols descriptius per dividir els articles en seccions amb una funció clara.

Les llistes, taules, diagrames i fragments de codi han d'ajudar a comprendre el contingut, no ser elements decoratius. [T1, T2, T3]

## 4. Desenvolupament tècnic

### Explicar els mecanismes
Quan explico una integració o una arquitectura, desenvolupo el funcionament de les peces implicades i la seva interacció.

Per exemple, en una integració amb Shopify, explicar els webhooks implica descriure:
- Què són i com funcionen.
- Com es comuniquen amb l'aplicació.
- Quins esdeveniments es processen.
- Com es transforma la informació externa al domini intern.
- Quines limitacions o problemes apareixen.

No n'hi ha prou amb enumerar tecnologies o patrons. [E3]

### Diferenciar els models
Quan dos sistemes tenen models de domini diferents, explico aquestes diferències explícitament.

Cal mostrar com afecten els fluxos de negoci, els estats, les operacions i les integracions. [E4]

### Justificar les abstraccions
Quan introdueixo una abstracció arquitectònica, explico:
- Quin problema o incompatibilitat la motiva.
- Quina responsabilitat assumeix.
- Com transforma o desacobla els sistemes.
- Per què és necessària en aquell context.

Evito presentar patrons de disseny com a solucions desconnectades del problema. [T2, E5]

### Referències
Quan una explicació tècnica depèn d'una API, especificació o documentació externa, incloc referències que permetin aprofundir o verificar el contingut. [E3]

## 5. Llenguatge i terminologia

- Escric en català.
- Mantinc els termes tècnics en anglès quan són habituals en el sector o aporten precisió.
- Utilitzo noms de patrons, tecnologies i conceptes tal com són coneguts en la comunitat tècnica.
- Explico els conceptes quan poden no ser coneguts pel lector.
- Evito traduccions artificials que dificultin la comprensió. [T1, T2, T3]

## 6. Ritme i llegibilitat

- Divideixo els textos llargs en seccions temàtiques.
- Evito concentrar massa informació diferent en una mateixa introducció.
- Desenvolupo les idees en l'apartat que els correspon.
- Alterno explicacions conceptuals amb exemples i aplicacions pràctiques.
- Utilitzo enumeracions quan hi ha diversos elements que cal distingir.
- Reservo les taules per a comparacions o classificacions útils.
- Utilitzo diagrames per representar processos, relacions o arquitectura. [T1, T2, E2, E3]

## 7. Format segons el tipus de text

### Articles d'experiència tècnica
Prioritzar el context real, les decisions, les alternatives, els desafiaments i els aprenentatges.

### Articles conceptuals
Introduir el concepte, explicar-lo, desenvolupar-ne les implicacions i aportar exemples pràctics.

### Resums de llibres
Identificar la font i el tema, sintetitzar les idees rellevants i explicar per què són interessants o aplicables. [T3]

## 8. Regles d'edició

Quan reviso un text:
- Millorar la llegibilitat sense eliminar informació rellevant.
- Reestructurar continguts quan una secció concentra massa informació.
- Traslladar els detalls tècnics als apartats específics.
- Ampliar les explicacions que siguin massa superficials.
- Preservar els matisos, les limitacions i les decisions reals.
- No introduir afirmacions que no estiguin sustentades en l'experiència o les fonts.
- Evitar simplificacions que alterin el funcionament tècnic o el model de domini.
- No convertir una experiència contextual en una recepta universal. [T1, T2, E1–E5]

### Naturalitat per sobre del poliment artificial
Les correccions han de mantenir una veu natural i pròxima a la manera com escric.

- Evitar frases artificials, grandiloqüents o excessivament acadèmiques.
- No formalitzar el text més del necessari.
- No substituir expressions senzilles per formulacions rebuscades només per fer-les sonar més professionals.
- No reescriure frases que ja funcionen si el canvi no aporta una millora clara.
- Prioritzar claredat i naturalitat, mantenint el meu vocabulari i els matisos originals.
- La primera persona pot aparèixer per contextualitzar l'experiència, però ha de tenir una presència discreta. [T1, T2; preferències explícites de revisió]

## 9. Aspectes pendents de validar

Aquesta guia encara no defineix amb prou evidència:
- El ritme exacte de les frases i la longitud preferida.
- Les expressions habituals que prefereixo conservar.
- Les formulacions concretes que considero artificials.
- El grau de formalitat segons el públic.
- La freqüència de preguntes retòriques, humor o ironia.

Aquests aspectes s'han de validar amb correccions explícites i exemples aprovats.
