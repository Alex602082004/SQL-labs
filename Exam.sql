--create database Practic
--use Practic

create table Concert(
id_concert int primary key identity(1,1),
descriere varchar(30),
concert_data date,
ora varchar(30),
cap_max int not null,
bilete_vandute int not null
)

alter table Concert 
add id_artist int foreign key references Artist(id_artist) on delete cascade on update cascade


create table Artist(
id_artist int primary key identity (1,1),
nume varchar(30),
stil_muzical varchar(30),
descriere_artist varchar(30)
)

alter table Artist
add id_concert int foreign key references Concert(id_concert) on delete cascade on update c

create table GenMuzical(
id_gen int primary key identity(1,1),
tip_muzica varchar(30),
id_concert int foreign key references Concert(id_concert) on delete cascade on update cascade
)

create table Publicul(
id_public int primary key identity(1,1),
nume varchar(30),
id_concert int foreign key references Concert(id_concert) on delete cascade on update cascade
)


insert into Concert values ('descriere1','2024-01-01','12:00',1000,600),('descriere2','2025-01-01','13:00',100,60),('descriere3','2022-01-01','17:00',150,70)
insert into GenMuzical values ('pop',1),('rock',1),('populara',2)
insert into GenMuzical values('pop',2)

create function BileteVandute(@tip_muzica varchar(30))
returns table as return
select Concert.bilete_vandute from Concert
inner join GenMuzical on GenMuzical.id_concert =Concert.id_concert
where GenMuzical.tip_muzica=@tip_muzica


select *from BileteVandute('pop')

create function BileteTotale(@tip_muzica varchar(30))
returns int 
as begin
declare @nr int
set @nr=0

select @nr= sum(bilete_vandute) from Concert
inner join GenMuzical on Concert.id_concert=GenMuzical.id_concert
where GenMuzical.tip_muzica=@tip_muzica

return @nr
end

print dbo.BileteTotale('pop')
select *from Concert
select *from GenMuzical
select *from Publicul

delete from Concert where id_concert=1


insert into Artist values ('Michael Jackson','pop','misto'),('Artist1','rock','misto'),('Artist2','populara','misto')
insert into Publicul values ('tineri',1),('pensionari',2),('studenti',1)


