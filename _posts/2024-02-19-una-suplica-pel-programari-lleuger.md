## Una súplica pel programari lleuger

L'article "A Plea for Lean Software" de Niklaus Wirth, publicat a "Computer: Cybersquare" el febrer de 1995, aborda la problemàtica del creixement desmesurat del programari en comparació amb la seva funcionalitat, argumentant que els avenços en hardware han permès, però no justificat, aquesta expansió. 

Wirth critica la tendència del programari a ser "obès", que requereix més recursos que mai, per millorar la funcionalitat del programari, i suggereix que la solució és radical en disciplines metodològiques i repercuteix en les funcions essencials.

Tot i ser un article de gairebé 30 anys, es segueixen cometent els mateixos errors i caldria tenir-los presents a l'hora de desenvolupar programari i veure com les bones pràctiques de desenvolupament ens poden ajudar a evitar-lo.

D'aquesta manera enumera i descriu les causes per les que s'ha arribat aquí.

### Adopció acrítica de característiques soŀlicitades pels usuaris.

Els desenvolupadors de programari tenim tendència a incorporar qualsevol característica que els usuari demandin, sense considerar, de forma crítica la seva compatibilitat amb el concepte original del sistema. El que ens porta a dissenys complicats, i un ús inadequat del programari fomentant la quantitat enlloc de la qualitat.

Conèixer bé el domini del producte i l'aplicació de patrons tàctics i tècnics per al desenvolupament d'aquests projectes pot ajudar a resoldre aquest problema

### Disseny monolític

El fet d'incloure totes les característiques dins del disseny del sistema, sense considerar si tots els el usuaris ho necessiten. Això implica en que cada client pagui per totes les característiques, encara que no les utilitzi. 

Aquest punt molt actual sobretot amb l'auge els productes SaaS, on precisament es aquest el model de negoci.

L'aplicació de dissenys monòlits modulars pot ajudar a resoldre aquest problema.

### Augment de la potència del hardware

La millor continua en la potència del hardware  permet abordar problemes més complexes (complexitat essencial) oferint als desenvolupadors la possibilitat d'implementar solucions més sofisticades i funcionalitats abans impossibles per limitació de recursos, però pel contrari facilita un enfocament menys disciplinat que afavoreix la complexitat accidental.

Aquest fet que es tingui menys en consideració l'eficiència del programari el que es tradueix en un programari més "gras" i possiblement més complicat. A curt plaç pot ser imperceptible, i tot i que la potencia pot ajudar a mitigar aquesta complexitat accidental, només emmascara els problemes de fons, que sorgiran en el la escalabilitat i manteninment

### Complexitat per conveniència de l'usuari

Tendència a la interacció amigable de l'usuari amb l'us de finestres, icones, colors, ombres i d'altres elements visuals han fet augmentar la complexitat del programari. S'ha de trobar un equilibri entre la experiència de l'usuari i l'augment de la complexitat.

El fet de tenir un design system ben definit i estructurat i la seva bona aplicació podria mitigar aquesta problemàtica

### Equivalència errònia entre complexitat i poder

Existeix la percepció de que un sistema com més complex és, més poderós i sofisticat és. Això fomenta la pràctica d'afegir característiques com més complexes millor, que poden no ser essencials per la funcionalitat del programari. Aquest punt, també bastant relacionat amb el primer d'adopció acrítica dels requeriments.


Aquestes causes subratllen la necessitat d'un enfocament més disciplinat i conscient en el disseny de programari, on es prioritzi la funcionalitat essencial i l'eficiència sobre l'addició indiscriminada de característiques i complexitats innecessàries.


Per acabar, Wirth agafa d'exemple un projecte (Oberon) el que considera com a bon exemple de simplicitat i extensibilitat i ho resumeix en una sèrie de lliçons apreses:


1. Ús exclusiu d'un llenguatge fortament tipat: La utilització d'un llenguatge de programació amb tipificació forta i estàtica va ser crucial per al disseny eficient del sistema, permetent que el compilador identifiqui inconsistències abans de l'execució, facilitant canvis segurs i accelerant el procés de millora.
2. Decomposició adequada en una jerarquia de mòduls: Identificar la descomposició més apropiada del sistema en mòduls per minimitzar duplicacions de funcions i codi és una tasca desafiadora però essencial per al disseny eficient.
3. Extensió de tipus per a un sistema extensible: La construcció d'un sistema extensible, on nous mòduls poden afegir funcionalitats i integrar-se compatiblement amb classes o tipus de dades existents, és fonamental per mantenir un sistema àgil des del començament.
4. Identificació de primitives flexibles per a extensions: És crucial identificar aquelles primitives que ofereixen més flexibilitat per a futures extensions, evitant alhora la seva proliferació innecessària.
5. Equip de disseny reduït: Contrari a la creença popular, els sistemes complexos no requereixen grans equips de disseny. Un sistema que no pot ser comprès íntegrament per un individu probablement no s'hauria de construir.
6. Problemes de comunicació en equips grans: Els problemes de comunicació augmenten amb la mida de l'equip de disseny, cosa que pot posar en perill tant l'equip com el projecte.
7. Reducció de complexitat i mida a cada pas: La competència d'un programador hauria de mesurar-se per la seva capacitat per trobar solucions simples, no per la productivitat mesurada en línies de codi per dia.
8. Experiència pràctica pròpia: No hi ha substitut per a lesforç de programació propi. L´organització de l´equip en rols separats és perjudicial; tots han de participar en tots els aspectes del desenvolupament i fer servir el producte.
9. Qualitat de publicació dels programes: Els programes han de ser refinats fins a assolir qualitat de publicació, dissenyats per ser llegibles tant per humans com per ordinadors, contradient interessos comercials però sense resistència a l'acadèmia.


En conclusió, el manifest de Niklaus Wirth "A Plea for Lean Software" segueix essent profundament rellevant en l'era actual del desenvolupament de programari. Les leccions apreses del projecte Oberon i l'anàlisi de les causes subjacents del programari "obès" ofereixen una guia valuosa per a dissenyadors i desenvolupadors. La necessitat d'una disciplina rigorosa en la incorporació de característiques, un disseny modular que permeti la flexibilitat sense sacrificar la simplicitat, i la importància de l'eficiència en l'aprofitament dels avenços en hardware són principis que ens poden ajudar a evitar la trampa de la complexitat innecessària.

Mentre que els avenços tecnològics han transformat les capacitats del programari i la maquinària, el principi fonamental d'optimitzar per la simplicitat, la claredat i l'utilitat sense sacrificar la funcionalitat roman inalterat. Aprendre de les reflexions de Wirth ens pot capacitar per desenvolupar programari que no només satisfaci les necessitats actuals de manera eficient sinó que també sigui sostenible i adaptable en el futur. En última instància, el desafiament de reduir la complexitat del programari no és simplement una qüestió de preferència personal sinó un imperatiu per a la creació de tecnologia sostenible i accessible.
