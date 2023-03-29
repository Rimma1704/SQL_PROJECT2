DELIMITER $$

CREATE FUNCTION `functie8` (fcnp char(13), fprodus varchar(20))
RETURNS INTEGER 
BEGIN

declare fpret integer;
declare fplata integer;
declare rest integer;

select pret into fpret
from clienti c, achizitii a
where c.cnp=fcnp and f.produs=a.produs and c.cnp=a.cnp
group by pret;

select suma_incasata into fplata 
from clienti c, achizitii a
where c.cnp=f.cnp and c.cnp=a.cnp and fprodus=a.produs
group by suma_incasata;

select rest=fpret-fplata;

RETURN rest ;
END $$

DELIMITER ;

