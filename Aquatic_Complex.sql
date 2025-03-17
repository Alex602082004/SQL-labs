--create database Acvatic
--use Acvatic

create table Complex(
id_complex int primary key identity(1,1),
nume varchar(30),
adresa varchar(30)
)

create table Tratament(
id_tratament int primary key identity (1,1),
denumire varchar(30),
pret int not null,
id_complex int foreign key references Complex(id_complex) on delete cascade on update cascade,
)

create table Piscina(
id_piscina int primary key identity(1,1),
nume varchar(30),
tip varchar(30),
id_complex int foreign key references Complex(id_complex) on delete cascade on update cascade,
)


create table Client(
id_client int primary key identity(1,1),
nume varchar(30),
nr_telefon varchar(30)
)

create table Inregistrare(
id_client int foreign key references Client(id_client) on delete cascade on update cascade,
id_tratament int foreign key references Tratament(id_tratament) on delete cascade on update cascade,
inregistrare_data date,
price int not null
)

insert into Client values('Alex','071234567892'),('Andrei','072134567893'),('Mihai','074321567893')
insert into Complex values('PiscinaFaina','Strada1')
insert into Tratament values('masaj',20,1),('piscina',30,1)
insert into Inregistrare values(1,1,'2024-12-31',20),(1,2,'2024-12-31',30)

create view PlataTotala as
select Client.nume as NumeClient,
Tratament.denumire as Tratamente,
Tratament.pret as Pret
from Client
inner join Inregistrare on Client.id_client = Inregistrare.id_client
inner join Tratament on Inregistrare.id_tratament = Tratament.id_tratament

select *from PlataTotala