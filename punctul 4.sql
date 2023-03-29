DELIMITER $$

create procedure vanzare 
(
	in pcnp varchar(13),
    in pnume varchar(20),
    in pdata date,
    in ppret integer,
    in psuma integer,
    out disponibil integer,
    out sum integer,
    out pretul integer,
    out x integer,
    out y integer
)

begin

insert into achizitii (cnp.produs, data_achizitiei,pret, suma_incasata) values (pcnp,pume,pdata,ppret,ppret);

select ppret into pretul 
from clienti c, achizitii a
where pcnp=c.cnp
group by ppret;

select disponibil_in_cont into disponibil
from clienti c, achizitii a
where pcnp=c.cnp
group by disponibil_in_cont;

select disponibil+psuma into sum
from clienti c,achizitii a 
where pcnp=c.cnp
group by disponibil+psuma;

update clienti c set disponibil_in_cont=0
where pcnp=c.cnp;

select sum-pretul into x
from clienti c
where pcnp=c.cnp
group by pretul-sum;

select pretul-sum into y
from clienti c
where pcnp=c.cnp
group by pretul-sum;

if y<0 then 
update clienti c set disponibil_in_cont=abs(y)
where pcnp=c.cnp;

elseif x>0 then 
update clienti c set disponibil_in_cont=x
where pcnp=c.cnp;
end if;

end$$

DELIMITER ;
