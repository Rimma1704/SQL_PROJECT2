select c.nume ,c.prenume,c.cnp,a.produs
from clienti c, achizitii a
where c.cnp=a.cnp and a.pret=a.suma_incasata