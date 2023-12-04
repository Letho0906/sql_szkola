-- 1
select id 
from zamowienia
where wartosc = (select min(wartosc) 
		 from zamowienia);

-- 2 
select nazwa, id
from towary
where id in (select id 
	     from zamowienia 
             where wartosc = (select min(wartosc) 
			      from zamowienia));
          
