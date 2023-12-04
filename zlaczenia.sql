
use 5ti2p_biblioteka13;

-- 1
select nr_czytelnika, Nazwisko, imie, count(sygnatura) as "liczba wypozyczeń"
from czytelnicy as c
left join wypozyczenia as w
using(nr_czytelnika)
group by nr_czytelnika;
-- 2

select k.sygnatura, k.tytul, count(w.sygnatura) as "liczba wypozyczen"
from ksiazki as k
left join wypozyczenia as w
using(sygnatura)
group by sygnatura;

-- 3
select count(nr_czytelnika)
from czytelnicy as c
left join wypozyczenia as w
using(nr_czytelnika)
where w.nr_czytelnika is null;

-- 4
select k.sygnatura, k.tytul, count(w.sygnatura) as "liczba wypozyczen"
from ksiazki as k 
left join wypozyczenia as w
using(sygnatura)
group by sygnatura
having count(sygnatura) >= 5;

-- 5
select d.nazwa, count(k.id_dzial) as "liczba książek"
from dzialy as d
left join ksiazki as k
using(id_dzial)
where d.nazwa = "Informatyka"
group by id_dzial
union
select d.nazwa, count(k.id_dzial) as "liczba książek"
from dzialy as d
left join ksiazki as k
using(id_dzial)
where d.nazwa = "Literatura"
group by id_dzial;

-- 6
select s.nazwa, count(p.Imie) as "liczba ludzi"
from stanowiska as s 
left join pracownicy as p
using(id_stanowisko)
where p.miasto = "Lublin" and p.wynagrodzenie >= 2000
group by s.nazwa;

-- 7
select s.nazwa, count(w.id_pracownika)
from pracownicy as p
left join wypozyczenia as w
using(id_pracownika)
left join stanowiska as s
using(id_stanowisko)
group by s.nazwa;

-- 8 
select k.tytul, w.id_pracownika
from wypozyczenia as w 
left join ksiazki as k 
using(sygnatura)
where w.Nr_czytelnika = 11 and (w.Id_pracownika = 7 or w.Id_pracownika = 6);

-- 9 
select 	distinct c.imie, c.nazwisko 
from czytelnicy as c 
left join wypozyczenia as w
using(nr_czytelnika)
where Data_zwrotu is null and c.funkcja = "S"
order by c.nazwisko;

-- 10
select  k.tytul
from ksiazki as k 
left join wypozyczenia as w 
using(sygnatura)
where w.data_wypozyczenia is null;

-- 11 
select count(nazwisko) as "M albo S"
from czytelnicy 
where nazwisko like "M%" or nazwisko like "S%";

-- 12 
select concat(p.nazwisko," ",p.imie," ",p.id_pracownika) as "pracownik"
from pracownicy as p
left join wypozyczenia as w
using(id_pracownika)
where w.id_pracownika is null;

-- 13 
select count(sygnatura)
from wypozyczenia 
where Data_wypozyczenia is null;

-- 14
select w.data_wypozyczenia, c.nazwisko
from czytelnicy as c
left join wypozyczenia as w
using(nr_czytelnika)
where w.data_wypozyczenia between '2018-11-05' and '2020-03-08';

--15
select c.imie, c.nazwisko 
from czytelnicy as c
left join wypozyczenia as w 
using(nr_czytelnika)
where w.Nr_czytelnika is null;

