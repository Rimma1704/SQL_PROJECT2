select 
c.nume, c.prenume, c.cnp, count(a.produs) as nr_produse
from 
clienti c inner join  achizitii a using(cnp)
where
 c.cnp=a.cnp and a.pret-a.suma_incasata>0 and 
 count(a.produs)= (select max(count(a.produs)) from clienti c inner join  achizitii a using(cnp)  
   where c.cnp=a.cnp and a.pret-a.suma_incasata>0)




 




