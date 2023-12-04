-- 1
select id 
from zamowienia
where wartosc = (select min(wartosc) 
				 from zamowienia);
          
