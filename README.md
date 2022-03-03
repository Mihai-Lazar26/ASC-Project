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
informatie, sa se aseze, la STANDARD OUTPUT (pe consola) toate echipamentele de retea
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
Exemplu: pentru reteaua de mai sus, se va asa pe consola:
switch malitios index 6: controller index 3; controller index 8;
switch malitios index 9: controller index 3; host index 10;
