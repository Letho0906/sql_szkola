create table uczen (
id_uczen int not null primary key auto_increment,
imie varchar(15),
nazwisko varchar (20),
Nrtel varchar(15),
plec varchar(1),
wzrost varchar(15),
data_ur date
);

insert into uczen values(default, "Kacper", "Miłosz", "666666666","m","sredni", null);


create table towar (
id_towar int not null primary key auto_increment,
Nazwa varchar(30),
Rodzaj varchar(30),
Cena float(30),
data_prod date,
ilosc varchar(30),
waga float(30)
);

insert into towar values(default, "Kacper", "Miłosz", 666666.666,null,"sredni",3.33 );
