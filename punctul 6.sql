select c.nume,c.prenume,c.cnp,a.produs,a.pret, a.pret-a.suma_incasata as rest_plata
from clienti c, achizitii a
where c.cnp=a.cnp
order by c.nume asc ,c.prenume asc, c.cnp asc, a.data_achizitie asc, rest_plata desc;