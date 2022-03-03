# ASC-Project
Fie urmatoarea arhitectura de retea:

![image](https://user-images.githubusercontent.com/79991306/156546226-3b913858-509d-470d-b1c2-121f5ecd9240.png)

care poate fi privita ca un graf

![image](https://user-images.githubusercontent.com/79991306/156546357-53a76030-74e8-4587-af26-3fbbcf6fb174.png)

unde stim, pentru fiecare element in parte, ce rol are, astfel:
• 1 - host;
• 2 - switch;
• 3 - switch malitios;
• 4 - controller logic.
Aceste informatii sunt stocate intr-un array de intregi, de forma:
roles = [1, 1, 2, 4, 2, 1, 3, 2, 4, 3, 1]
cu urmatoarea semnificatie: nodul 1 este, in prima imagine, un host, astfel ca il codificam prin
rolul 1, identic al doilea nod, al treilea nod este un switch obisnuit, astfel ca il codificam prin rolul
2. Se procedeaza analog cu restul nodurilor. Atentie! In imagine, numerotarea nodurilor a fost
facuta de la 1, dar consideram ca, in implementare, nodurile sunt de la 0. Astfel, pentru n noduri
date, vom avea indecsii de la 0 la n - 1.
Toate cerintele care vor fi formulate sunt cerinte care se pot rezolva utilizand cel mult array-uri
de elemente intregi, NU vor fi necesare conceptele de functii si proceduri.

Fie reteaua de mai sus reprezentata prin R = (G; roles), unde G este un graf dat prin matricea lui
de adiacenta. Pentru a retine o matrice intr-un limbaj de asamblare, folosim aceeasi reprezentare
ca la array-uri: o matrice este, in memorie, tot inlantuit alocata, doar ca in loc sa avem accesare
prin intermediul unui singur index, avem accesare prin intermediul a doi indecsi. Avand aceasta
informatie, sa se afiseze, la STANDARD OUTPUT (pe consola) toate echipamentele de retea
(nodurile) care sunt direct conectate la un switch malitios: la ce switch malitios sunt conectate, care
sunt aceste echipamente si ce rol au in retea. Reprezentarea se va face exclusiv prin index-ul lor in
graful asociat.
Matricea de adiacenta pentru reteaua de mai sus este urmatoarea:
0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0
0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0
1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0
0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0
0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0
0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0
0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0
0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0
0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0
0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0
Exemplu: pentru reteaua de mai sus, se va afisa pe consola:
switch malitios index 6: controller index 3; controller index 8;
switch malitios index 9: controller index 3; host index 10;

Plecand din primul echipament din retea (i.e. din echipamentul cu index 0), sa se afiseze toate
host-urile cu care acest echipament poate comunica (indiferent daca este interpus in comunicare
un switch malitios). In plus, sa se decida si daca exista o conexiune (sigura sau nesigura, nu ne
intereseaza) intre oricare doua echipamente.

Se va aplica algoritmul BFS, care utilizeaza o coada. Pentru a nu ne complica foarte tare
prin eliminarea elementelor din coada, putem sa avem un array care doar creste, si indexul curent
la care am ajuns, considerand ca elementele de la stanga au fost "eliminate". De exemplu, pentru
queue = [0, 2, 1, 3, 4, 6, 7]
queueIndex = 2
queueLength = 7
inseamna ca elementul curent din coada este 1. Nu eliminam elementul ca sa scapam de el, ci
pur si simplu facem un queueIndex := queueIndex + 1. Pentru a adauga elemente, le punem la
final (ne asiguram ca am declarat suficient spatiu pentru queue) si incrementam queueLength-ul.
Exemplu: pentru reteaua de mai sus, se va afisa pe consola:
host index 0; host index 1; host index 5; host index 10;
Yes
cu explicatia ca, plecand din host index 0, atunci il consideram si pe el ca fiind host accesibil.
Pana la celelalte trei host-uri, este evidenta conexiunea prin intermediul grafului de mai sus. Pe a
doua linie se va scrie un mesaj Yes sau No, dupa cum toate echipamentele pot comunica, fara sa
tinem cont de faptul ca unele switch-uri pot fi sau nu malitioase.
Important! Host-urile vor fi afisate in ordinea descoperirii lor prin parcurgerea in latime.
