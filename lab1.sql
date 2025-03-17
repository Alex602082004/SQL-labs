--create table Gamer(id_g int primary key, nume varchar(30), varsta int)

--create table Game(id_game int primary key)

--create table PC(
--id_pc int primary key, 
--id_g int foreign key references Gamer(id_g), 
--id_game int foreign key references Game(id_game))

--create table Componenta(
--id_c int primary key,
--id_pc int foreign key references PC(id_pc),
--)

--create table Skin(
--id_s int primary key,
--id_game int foreign key references Game(id_game)
--)


--alter table Game
--add eveniment int;
--alter table Game
--alter column eveniment varchar(30)

--insert into Gamer values (1,'IRaphahell',24)
--insert into Gamer values (2,'Xslayder',23)
--insert into Gamer values (3,'Musty',20)

--insert into Game values (1, 'turneu')
--insert into PC values (1,1,1)
--select *from PC
alter table Gamer
alter column nume varchar(50) 