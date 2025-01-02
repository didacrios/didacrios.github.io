---
title: "La internalització d'un producte legacy: Història d'una transformació digital (I)"
---

Quan parlem de software legacy, sovint pensem en aplicacions antiquades o mal dissenyades. Però la realitat és que el "legacy" pot ser qualsevol aplicació que, tot i funcionar correctament, presenta reptes significatius per a la seva evolució i manteniment. Aquesta és la història de com vam abordar la internalització d'una aplicació de gestió logística, amb el repte afegit d'una integració amb una nova plataforma de comerç electrònic.

## El context inicial

L'any 2018 es va desenvolupar una aplicació per gestionar els processos de picking i packing de la botiga online. L'aplicació, desenvolupada en Symfony 4.0, resolia eficaçment la gestió de comandes, des de la recepció fins a l'enviament, incloent la integració amb diversos transportistes.

Durant anys, l'aplicació va complir el seu objectiu principal: optimitzar els processos logístics i millorar l'eficiència del magatzem. No obstant això, el temps i l'evolució del negoci van començar a evidenciar limitacions importants.

## Els reptes que ens van portar a la internalització

### Deute tècnic acumulat

El primer repte significatiu era la versió de Symfony utilitzada. La versió 4.0 tenia un suport de seguretat limitat que va finalitzar el gener de 2019. Això significava que l'aplicació funcionava amb una versió que no rebia actualitzacions de seguretat des de feia més de quatre anys.

A més, el *codebase* presentava diversos problemes:

- Absència de tests automatitzats
- Manca d'estàndards de codi documentats
- Codi sense seguir principis de Clean Code
- Documentació escassa o inexistent

### Limitacions estructurals

L'arquitectura inicial presentava problemes d'acoblament significatius:

- Dependència total amb l'e-commerce principal
- Base de dades compartida que generava problemes de rendiment
- Impossibilitat de funcionar de manera independent
- Dificultat per implementar noves funcionalitats

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

## El punt d'inflexió: Un nou repte i una decisió estratègica

Al febrer de 2023, ens vam trobar davant d'un moment clau. No només havíem d'assumir la internalització d'un producte legacy amb tots els seus reptes tècnics i organitzatius, sinó que també teníem al davant la necessitat d'integrar l'aplicació amb una nova plataforma d'e-commerce. El deadline era clar i inamovible: necessitàvem tenir una solució estable abans del Black Friday 2023.

La situació requeria una anàlisi profunda i una decisió meditada. Teníem dues opcions sobre la taula: refactoritzar gradualment el projecte existent o començar de zero amb un "big bang refactor". Cada opció tenia les seves implicacions, i la decisió no era senzilla, finalment, tot i que personalment no crec que sigui la millor decisió tècnica, en aquesta situació en concret seria de les poques vegades en les que recomanaria un "big bang refactor". També influenciada pel compromís a nivell de negoci, de no ampliar funcionalitats en aquest període y un control total del backlog del projecte.

| Pros | Contres |
|---------------------------|----------|
| Treballar en un entorn no productiu, reduint riscos en producció | Necessitat de mantenir temporalment múltiples projectes |
| Llibertat per implementar noves tecnologies i patrons des de zero | Duplicació temporal d'esforços en manteniment |
| Capacitat de centrar-se exclusivament en les funcionalitats necessàries | Risc per als deadline per tenir dues bases de codi |
| Oportunitat d'implementar bones pràctiques des del principi | Complexitat en la gestió dels projectes |
| Possibilitat de repensar l'arquitectura sense limitacions legacy | Possible resistència al canvi per part dels usuaris |
| Major facilitat per incorporar testing des de l'inici | Necessitat de mantenir compatibilitat amb dades històriques |
| Flexibilitat per adaptar-se a nous requeriments de negoci | Cost inicial més alt en temps i recursos |
| Millor alineació amb l'estratègia global de l'empresa | Possible pèrdua temporal de funcionalitats no essencials |

## Conclusions i següents passos

La decisió d'internalitzar i reescriure un software legacy mai és fàcil, especialment quan aquest software compleix la seva funció. La dita de *si funciona no ho toquis* hi serà semprepresent. No obstant això, de vegades és necessari fer un pas enrere per poder fer-ne dos endavant.

En els propers articles d'aquesta sèrie, explorarem com vam abordar aquests reptes, les decisions tècniques que vam prendre, i com vam transformar aquests desafiaments en oportunitats de millora i creixement.

