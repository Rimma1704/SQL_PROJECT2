DELIMITER $$

create trigger t1
before insert on achizitii 
for each row
/*declare disponibil integer */

begin 

select disponibil_in_cont into disponibil 
from clienti c
where new.cnp=c.cnp;

if(new.suma_incasata-new.pret)=0 then 
/*$query=sprintf ("S-a realizat cu succes !");*/

else if (disponibil>0) and (:new.pret-:new.suma_incasata)> then 
:new.suma_incasata:=disponibil+:new.suma_incasata;
disponibil:=0;
update clienti c set disponibil_in_cont=disponibil
where :new.cnp=c.cnp;

elseif (disponibil>0)and(:new.pret-:new.suma_incasata)<0 then 
:ew.suma_incasata:=disponibil+:new.suma_incasata;
disponibil:=0;
update clienti c set disponibil_in_cont=disponibil
where :new.cnp=c.cnp;
end if;

if (:new.suma_incasata=:new.pret)>0 then 
disponibil :=:new.suma_incasata-:new.pret;
:new.suma_incasata:=:new.pret;
update clienti c set disponibil_in_cont=disponibil
where :new.cnp=c.cnp;
end if;

end$$

DELIMITER ;
