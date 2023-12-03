
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


