## Lean Software Development: Muda (I)

Aquest estiu he revisat el llibre [*Lean Software Development: An Agile Toolkit*](https://www.goodreads.com/book/show/194338.Lean_Software_Development) de Mary & Tom Poppendieck i aprofitaré per fer una serie d'articles resum dels punts que crec més interessants del llibre.

En aquesta primera entrega parlarem del desperdici o el malbaratament (*waste, muda*).

El desperdici (*waste, muda*) és tot allò que al client no li aporta un valor directe. Les pràctiques àgils en el desenvolupament de software busquen eliminar aquest desperdici, i el primer pas per fer-ho és saber-lo identificar.

Una de les pràctiques *lean* ens diu que per a identificar el desperdici cal classificar-lo, així que influenciats pels 7 desperdicis del *lean manufacturing* es proposa classificar el desperdici en el desenvolupament de programari en 8 categories.


### Feina feta parcialment (*Partially Done Work*)

Fa referencia a desenvolupaments que es queden a mitges i no s'arriben a desplegar en un entorn de producció, aquest tipus de desenvolupaments tendeixen a quedar-se obsolets en poc temps, interferint en el desenvolupament d'altres tasques que s'han de realitzar. El principal problema es que el que s'ha fet no s'arriba desplegar, per tant no hi ha [*working software*](https://agilemanifesto.org/principles.html), el que ens impossibilita obtenir feedback i saber si realment funciona, si causa algun efecte no previst en el sistema o si realment estem solucionant el problema que voliem solventar.

S'ha de tenir en compte que en aquests desenvolupaments s'ha fet també una inversió en recursos (planificació, priorització, definició, disseny, codificació…), que encara no ha generat resultats, això implica que es "cancela una gran inversió", convertint-se en un risc si ho extrapolem a nivell financer.

Així doncs, el fet de reduir la feina parcialment redueix riscos i es converteix al mateix temps en una estrategia per a la reducció del desperdici.

### Processos extra (*Extra Processes*)

T'has preguntat mai si la burocràcia i la paperassa són necessaris? La burocràcia consumeix recursos, és lenta, es perd, queda obsoleta, i molts cops ningú li fa cas.

En el desenvolupament de programari, també hi ha burocràcia. Molts processos de desenvolupament requereixen d'omplir formularis de sol·licitud, requeriments, tests, actualitzar seguiments, reportar hores, documentar, etc.

Planteja’t si realment, al client, tots aquest processos importen i l'ajuden a tenir un producte més valuós, i en el cas de que ho sigui, recorda aplicar aquestes 3 regles: Que sigui la minima possible (*Keep it short*). que sigui a alt nivell, clara i consisa. (*Keep it high level*) i que estigui fora del procés de desenvolupament. (*Do it off line*).

En la majoria de desenvolupaments, hi ha requeriments escrits. En aquests casos, el fet que aquests requeriments siguin fàcilment accessibles i evaluats per a la seva comprovació es pot considerar una activitat que aporta valor. Estem parlant de taules i/o plantilles que fan que tant els clients com els desenvolupadors puguin ràpidament entendre i validar. L'utilització de pràctiques com BDD (*Behaviour Driven Design*), ATDD (*Acceptance Test-Driven Development*), *Specification by Example*, reduirien el desperdici en tant que es consideren pràctiques que aporten valor.

Una altra forma d'identificar si la burocràcia aporta valor o no es el fet d'identificar si hi ha algú que l'estigui esperant. Hi ha algú que escriu escenaris per a que es puguin interpretar i programar? Doncs probablement aquesta burocràcia aporta valor. Tot i això s'ha de treballar en millorar l'eficiencia en aquest sentit i buscar la millor manera de transmetre la informació, per exemple, no escriure requeriments i utilitzar pràctiques com les citades anteriorment o bé que els detalls d’implementació no fer-los massa aviat i limitar-se a aprofundir-hi en la iteració en la que s'haurien d'implementar.

### Funcionalitats extra (*Extra Features*)

Pot semblar molt bona idea afegir funcionalitats extra, per si de cas es necessiten. Als programadors ens encanta afegir complexitat tècnica i funcionalitats extra. Això que ens pot semblar inofensiu, és un dels mes grans desperdicis. Cada linia de codi s'ha de compilar, integrar, testejar, desplegar  i després, s'ha de mantenir. Cada linia de codi incrementa la complexitat i es un punt de fallida (*failure point*). Fins i tot hi ha la possibilitat de que aquella part de codi quedi obsoleta abans de que s'utilitzi, ja que en realitat mai s'ha arribat a demanar. Quan el codi no es necessita ara, és un desperdici. Que no us tempti la serp.


### Canvi de tasques (*Task Switching*)

Gent treballant en multiples projectes és despedici de per se. Cada cop que un programador canvia de tasca, hi ha un lapse de temps significatiu en el que es despren de les referencies de l'antiga tasca i comença a entrar en la dinàmica de la nova (DeMarco & Lister, 2003). Si algú forma part de varis equips i projectes, les  interrupcions i canvis de tasques es fan exponencials, tot això és desperdici.

Així doncs la millor forma de completar 2 projectes que utilitzen els mateixos recursos, és fer-los un després de l'altre. Goldratt (1997) planteja que quan tens 2 projectes d'aproximadament 2 setmanes de duració cadascún, esperes tenir-los enllestits en 4 setmanes. Si els realitzes al mateix temps, al afegir els canvis de context el resultat final és que el tens més aviat en 5 setmanes enlloc de les 4.

El fet d'afegir un excés de feina en el desenvolupament crea desperdici, fent que les coses vagin més lentes. Tot va més fluid per una canonada que no està plena (Poppendieck & Poppendieck, 2003).

### Esperant (*Waiting*)

Un dels maxims desperdicis en el desenvolupament de programari es esperar a que les coses passin. Endarrerir l'inici d'un projecte, la conformació de l'equip, la confecció de requeriments, les revisions de codi, les proves, desplegar funcionalitats, tot això és desperdici. 

Els endarreriments son comuns i poden arribar a forma part de la normalitat i no veure'ls com a desperdici. Quin és el problema d'esperar? Les esperes fan que el client no rebi valor aviat. Quan el client vol implementar una necessitat o solucionar un problema la velocitat en la que obtindrà la solució anirà estrictament lligada a la velocitat en la que va el nostre proces de desenvolupament.

En certs entorns, potser aquest no és un dels principals problemes. Però si que ho és si desenvolupes programari per a un domini en constant canvi, en el que s’han de prendre moltes decisions, i aquestes no són àgils. Un dels principis fonamentals de *lean* és pospondre les decisions fins a l'ultim moment responsable (*the Last Responsible Moment*), de tal manera que puguis decidir més endavant, quan tingui més context. Aquesta és una de les millors formes de manejar la incertesa. Posposar una decisió també és una decisió.

Es podria pensar que això i procrastinar ve a ser el mateix, però en realitat es una estrategia per evitar riscos. Una mala decisió feta molt al inici d'un projecte el pot comprometre per complet, ja sigui fent que el desenvolupament vagi molt més lent o lligar-se a infrastructures innecesaries, així que les decisions que s'han d'anar prenent han de ser decisions que no et collin massa, i siguin el maxim d'adaptables posibles.

### Moviment (*Motion*)

Quan un programador té dubtes, que és el que ha de fer fins aconseguir una resposta? Hi ha gent disponible per solucionar problemes tècnics? I els funcionals? El client o el seu representant (PO, PM) està disponible per contestar-li? Pot el programador interpretar correctament la feina a fer de forma senzilla sense haver d'anar a trobar algun company?

El desenvolupament de programari requereix d'una gran concentració, cada cop que se li plantegi alguna de les situacions anteriors li faran perdre el focus. Tenir l'equip disponible i treballant conjuntament fara que aquests no siguin grans problemes.

La gent no es la única que es mou, els requeriments, la documentació, el codi, també està en constant moviment durant el cicle de desenvolupament. Traslladar tota aquesta informació és també un desperdici, tots aquests artefactes no poden contenir la totalitat de la informació, sempre hi ha informació que es retindrà en els seus creadors com a individual o grup. Es per això que també, traslladar aquests recursos entre diferents grups també és desperdici.

### Defectes (*Defects*)

El principal desperdici causat pels defectes és l'impacte del defecte sobre el producte i el temps en que passa desapercebut. Un greu defecte que es localitza al cap de 3 minuts no és un gran desperdici. Però un petit problema que fa setmanes que ningú se n'ha adonat, es un desperdici molt més gran.

Així doncs, per tal de reduir l'impacte dels defectes el millor és identificar-los el més aviat possible i per fer-ho cal testar, integrar, i desplegar el més aviat possible.

### Activitats de la gestió (*Management Activities*)

Les activitats de gestió no afegixen valor directament a un producte, però tenen un gran impacte en el malbaratament en una organització. Considera per exemple el sistema de gestió de tàsques i projectes. En aquest cas minimitzar el desperdici implica mantenir al minim la feina fet a mitges, i això prové normalment de com es gestiona un projecte i les seves tasques. Si aquest sistema no va fluït probalement esdevingui en un gran generador de desperdici i malbaratament de recursos.

Els sistemes de control i seguiment tampoc aporten valor, i si existeixen acostumen a indicar que hi ha massa feina a fer. En *lean manufacturing* quan es parla d'un sistema *just-in-time*, es parla d'un sistema en que la feina es realitza de forma eficient i flueix de tal forma que no es necessari el seu control amb sistemes complicats d'analisis i seguiments.

Sistemes d'autorització per a la revisió i aprovació de canvis de requisits acostumen a aportar endarreriments enlloc de valor. Aquests sistemes també esdevenent simptoma d'un desperdici més gran lligat també a una definició previa i prematura de llargs requeriments.

Aprendre a identificar el desperdici és un process constant de canviar la manera que tenim de pensar sobre el que realment és i no és necessàri.

## Bibliografia

- DeMarco, T., & Lister, T. (2013). Peopleware: productive projects and teams. Addison-Wesley.
- Goldratt, E. M. (1997). Critical chain: A business novel. Routledge.
- Poppendieck, M., & Poppendieck, T. (2003). Lean software development: an agile toolkit. Addison-Wesley.

