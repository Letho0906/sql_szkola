-- 1.1
select id 
from zamowienia
where wartosc = (select min(wartosc) 
		 from zamowienia);

-- 1.2 
select nazwa, id
from towary
where id in (select id 
	     from zamowienia 
             where wartosc = (select min(wartosc) 
			      from zamowienia));
          
-- 1.3
select nazwa, grupa, id
from towary
where id = (select towar_id 
	    from zamowienia
                 where wartosc = (select max(wartosc)
				  from zamowienia));

-- 1.4
select nazwa, grupa
from towary
where cena > (select avg(cena) 
	      from towary);

-- 2.1
select count(imie) as "liczba wlascicieli mieszkajacych w bialystoku"
from wlasciciel
where wlascicielnr in (select wlascicielnr 
		       from nieruchomosc 
                       where miasto = "bialystok");

-- 2.2
select count(biuronr) as "liczba biuro w łomży"
from biuro
where biuronr in (select biuronr 
		  from biuro
                  where miasto = "lomza");

-- 2.3
select *
from biuro
where biuronr in (select biuronr
		  from personel
            	  group by biuronr
            	  having count(*) >= 3);

-- 2.4
select *
from nieruchomosc
where nieruchomoscnr in (select nieruchomoscnr
	   		 from wynajecie 
                         group by nieruchomoscnr
                         having count(nieruchomoscnr) >=2);
-- 2.5
select imie, nazwisko, (select count(personelnr) 
			from nieruchomosc
                        group by personelnr
                        having count(personelnr) >= 2) as "liczba nieruchomości"
from personel
where personelnr in (select personelnr
			 from nieruchomosc 
                         group by personelnr
                         having count(personelnr) >= 2);

-- 2.6
select *
from klient
where klientnr in (select klientnr
		   from wynajecie 
                   group by klientnr
                   having count(klientnr) >= 2);
