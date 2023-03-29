SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select c.nume, c.prenume,a.cnp,a.suma_incasata as total 
from clienti c, achizitii a 
where c.cnp=a.cnp and a.pret-a.suma_incasata=0
group by c.nume,c.prenume,c.cnp
having count(a.produs)>4 or sum(a.suma_incasata)>100 and 
(max(truncate(a.data_achizitie,'yyyy'))-min(truncate(a.data_achizitie,'yyyy'))=1)
order by c.nume;