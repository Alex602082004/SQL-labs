--create database *NUME*
--use *NUME DATABASE*
--create table Gamer(
--id_g int primary key identity (1,1),
--nume varchar(30),
--varsta int)

---m-n tabel intre cu id-urile de la ambele
--1-n ala cu mai multe are id-ul de la ala singur

--!!!
--create table PC(
--id_pc int primary key identity (1,1), 
--id_g int foreign key references Gamer(id_g) on update cascade on delete cascade, 
--id_game int foreign key references Game(id_game) on update cascade on delete cascade)

--insert into Gamer values ('IRaphahell',24)
--alter table Game
--add game_name varchar(30)

--update Gamer
--set varsta = 25 where nume ='IRaphahell'

--delete from Game where game_name='clash royale'
--select *from Game where id_game <> 1
--select *from Game where game_name ='fifa' or game_name='joc2'
--select *from Game where id_game is not null

--select Gamer.nume,Game.game_name from Gamer
--inner join PC on Gamer.id_gamer=PC.id_gamer
--inner join Game on PC.id_game=Game.id_game

-- right outer join si full outer join

--select id_gamer,varsta from Gamer
--UNION 
--select id_gamer,id_game from PC

--select id_gamer from Gamer
--INTERSECT
--select id_gamer from PC
--INTERSECT
--select id_game from Game

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

DISTINCT
--select nume,
--sum(buget) as buget_total
--from (select distinct nume,buget,tip_video from Gamer) as Total
--group by nume

TRIGGER
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

VIEW
--create view GamerPc as
--select 
--Gamer.nume as NumeGamer,
--Gamer.tip_video as TipGamer,
--PC.id_pc as IdPc,
--PC.nume_marca as MarcaPC
--from Gamer
--inner join PC on Gamer.id_gamer=PC.id_gamer


!Procedura + Functie!
--create function Validarebuget(@buget int)
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





