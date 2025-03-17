--create database Lab2
--use Lab2

--create table Gamer(
--id_g int primary key identity (1,1),
--nume varchar(30),
--varsta int)

--create table Game(
--id_game int primary key identity (1,1)
--)

--create table PC(
--id_pc int primary key identity (1,1), 
--id_g int foreign key references Gamer(id_g) on update cascade on delete cascade, 
--id_game int foreign key references Game(id_game) on update cascade on delete cascade)

--create table Componenta(
--id_c int primary key identity (1,1),
--id_pc int foreign key references PC(id_pc) on update cascade on delete cascade,
--)

--create table Skin(
--id_s int primary key identity (1,1),
--id_game int foreign key references Game(id_game) on update cascade on delete cascade
--)


--insert into Gamer values ('IRaphahell',24)
--insert into Gamer values ('Xslayder',23)
--insert into Gamer values ('Musty',20)

--alter table Game
--add game_name varchar(30)

--insert into Game values ('minecraft'),('fifa')

--insert into PC values (1,1)
--insert into PC values(2,2)

--alter table Componenta
--add piesa_name varchar(30)

--insert into Componenta values (1,'placa video'),(2,'RAM')

--alter table Skin
--add skin_name varchar(30)

--insert into Skin values (1,'urs'),(2,'monstru')
--insert into Skin values(4,'skin')
--insert into Skin values(6,'skin1')

--update Gamer
--set varsta = 25 where nume ='IRaphahell'

--update Gamer 
--set varsta = 21 where nume ='Musty'

--insert into Game values('clash royale'),('clash of clans')

--delete from Game where game_name='clash royale'

--insert into Game values('joc1'),('joc2'),('joc3')

--delete from Game where game_name='joc1' or game_name='joc3'

--select *from Game where id_game <> 1
--select *from Game where game_name ='fifa' or game_name='joc2'
--select *from Game where id_game is not null
--select *from Componenta where piesa_name is not null

--alter table Gamer
--alter column varsta int not null

--select *from Skin
--select *from Game
--select *from Componenta
--select *from PC
--select *from Gamer

--insert into PC values(3,4)
--delete from Game where id_game=2

--alter table PC
--add nume_marca varchar(30)

--update PC set nume_marca ='ASUS' where id_pc =1
--update PC set nume_marca ='Aqiris' where id_pc=4

--insert into Gamer values('Malakay',26),('TheRealRed',24),('Theo',27)
--insert into Componenta values(4,'placa de baza'),(5,'SSD'),(6,'RAM')
--insert into Game values('politist'),('monstru'),('zombie')

--delete from Game where id_game=11 or id_game=12 or id_game=13 

--insert into PC values(4,6,'Fractal'),(5,8,'ROG'),(6,9,'Montech')
--insert into Skin values(8,'Scorpion'),(9,'Zoro')

--select *from Gamer

--alter table Gamer
--add buget int

--alter table Gamer
--add tip_video varchar(30)

--update Gamer set tip_video='Gaming' where nume='IRaphahell'
--update Gamer set tip_video='Gaming' where nume='Xslayder'
--update Gamer set tip_video='Gaming' where nume='Musty'
--update Gamer set tip_video='Gaming' where nume='Theo'
--update Gamer set tip_video='Stream' where nume='TheRealRed'
--update Gamer set tip_video='Stream' where nume='Malakay'


--update Gamer set buget =1000 where id_gamer =1
--update Gamer set buget =900 where id_gamer =2
--update Gamer set buget =1200 where id_gamer =3
--update Gamer set buget =750 where id_gamer =4
--update Gamer set buget =1500 where id_gamer =5
--update Gamer set buget =900 where id_gamer =6

--insert into Gamer values('IRaphahell',25,900,'Gaming'),('Musty',21,3000,'Gaming')


										--LAB3--

--select Gamer.nume,Game.game_name from Gamer
--inner join PC on Gamer.id_gamer=PC.id_gamer
--inner join Game on PC.id_game=Game.id_game

--select Gamer.nume, Skin.skin_name from Gamer
--right outer join PC on Gamer.id_gamer=PC.id_gamer
--right outer join Game on PC.id_game=Game.id_game
--right outer join Skin on Game.id_game=Skin.id_game

--select Gamer.nume,Componenta.piesa_name from Gamer
--full outer join PC on Gamer.id_gamer=PC.id_gamer
--full outer join Componenta on PC.id_pc=Componenta.id_componenta


--select id_gamer,varsta from Gamer
--UNION 
--select id_gamer,id_game from PC

--select id_gamer from Gamer
--INTERSECT
--select id_gamer from PC
--INTERSECT
--select id_game from Game

--select id_gamer,
--count(buget) as buget_total
--from Gamer
--group by id_gamer

--select id_gamer,
--sum(buget) as buget_total
--from Gamer
--group by id_gamer

--select nume,
--max(buget) as buget
--from Gamer
--group by nume

--select nume,
--min(buget) as buget
--from Gamer
--group by nume

--select id_gamer,
--sum(buget) as buget_total
--from Gamer
--group by id_gamer
--having sum(buget)<1500 and sum(buget) >800 or sum(buget)=3000

--select *from Gamer

--select nume,
--sum(buget) as buget_total
--from (select distinct nume,buget,tip_video from Gamer) as Total
--group by nume

--insert into Gamer values('IRaphahell', 25,900,'Stream')

									---LAB4---

--create function ValidareVarsta(@Varsta int)
--returns bit
--as
--begin
--return case
--when @Varsta > 0 AND @Varsta < 110 then 1
--else 0
--end
--end

--create function Validarebuget(@Buget int)
--returns bit
--as begin
--return case
--when @Buget>=1 then 1
--else 0
--end
--end

--create procedure AdaugaGamer
--@Nume varchar(30),
--@Varsta int,
--@Buget int,
--@Tip_video varchar(30)
--as 
--begin
--if dbo.ValidareVarsta(@Varsta) = 0
--begin

--raiserror('Varsta gresita!',16,1)
--return
--end

--if dbo.Validarebuget(@Buget) = 0
--begin
--raiserror('Buget gresit!',16,1)
--return end
--insert into Gamer(nume,varsta,buget,tip_video)
--values(@Nume,@Varsta,@Buget,@Tip_video)
--end

--select dbo.ValidareVarsta(25)
--select dbo.ValidareBuget(0)
--exec AdaugaGamer @Nume='Test', @Varsta=10,@Buget=-1,@Tip_video='Gamer'
--exec AdaugaGamer @Nume='Test', @Varsta=10,@Buget=1,@Tip_video='Gamer'

--select *from Gamer


--create table Periferice(
--id_periferice int,
--nume_periferice varchar(30),
--pret_periferice int,
--constraint key_periferice primary key (id_periferice,nume_periferice) )

--select *from Periferice
--insert into Periferice values(1,'mouse',200),(2,'tastatura',400),(3,'microfon',600),(4,'volan',200)


--select *from Game

--create function ValidareNume(@Nume varchar(30))
--returns bit
--as begin
--if @Nume is null or len(@Nume) = 0  
--return 0
--return 1
--end

--create procedure AdaugaGame
--@Game_name varchar(30)
--as begin
--if dbo.ValidareNume(@Game_name) =0
--begin
--raiserror ('Invalid name',16,1)
--return 
--end
--insert into Game(game_name)
--values(@Game_name)
--end

--select dbo.ValidareNume(NULL)

--exec AdaugaGame @Game_name='Test'

--select *from Game

--create function ValidarePret(@Pret int)
--returns bit
--as begin
--if @Pret <0 return 0
--return 1
--end

--!!!
--create procedure AdaugaPerif
--@Id_periferice int,
--@Nume_periferice varchar(30),
--@Pret_periferice int
--as begin
--if exists (select 1 from Periferice where id_periferice =@Id_periferice and nume_periferice=@Nume_periferice)
--begin 
--raiserror('Id-ul si numele exista deja!',16,1)
--return
--end

--if dbo.ValidarePret(@Pret_periferice) = 0
--begin
--raiserror ('Pret gresit',16,1)
--return
--end

--insert into Periferice(id_periferice,nume_periferice,pret_periferice)
--values(@Id_periferice,@Nume_periferice,@Pret_periferice)
--end

--exec AdaugaPerif @Id_periferice=5,@Nume_periferice='test',@Pret_periferice=100 
--exec AdaugaPerif @Id_periferice=5,@Nume_periferice='test1',@Pret_periferice=100 
--exec AdaugaPerif 6,'test2',100

--create view GamerPc as
--select 
--Gamer.nume as NumeGamer,
--Gamer.tip_video as TipGamer,
--PC.id_pc as IdPc,
--PC.nume_marca as MarcaPC
--from Gamer
--inner join PC on Gamer.id_gamer=PC.id_gamer

--select *from GamerPC

--create trigger Insert_Gamer
--on Gamer
--after insert
--as
--begin
--declare @CurrentTime datetime
--set @CurrentTime = getdate()

--print 'Operatia: insert'
--print 'tabel: gamer'
--print 'data si ora: ' + convert(nvarchar,@CurrentTime,120)
--end

--create trigger Delete_Gamer
--on Gamer
--after delete
--as
--begin
--declare @CurrentTime datetime
--set @CurrentTime = getdate()

--print 'Operatia: delete'
--print 'tabel: gamer'
--print 'data si ora: ' + convert(nvarchar,@CurrentTime,120)
--end

--insert into Gamer values ('Mihai',20,100,'Gamer')
--delete from Gamer where id_gamer=5

--select *from Gamer
