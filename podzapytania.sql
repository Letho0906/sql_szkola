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
          
--3
select nazwa, grupa, id
from towary
where id = (select towar_id 
	    from zamowienia
                 where wartosc = (select max(wartosc)
				  from zamowienia));

-- 4
select nazwa, grupa
from towary
where cena > (select avg(cena) 
			  from towary);

-- 5 
select count(imie) as "liczba wlascicieli mieszkajacych w bialystoku"
from wlasciciel
where wlascicielnr in (select wlascicielnr 
					  from nieruchomosc 
                      where miasto = "bialystok");
