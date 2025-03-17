--create database Cafenea
--use Cafenea

create table Prajitorie(
id_prajitorie int primary key identity(1,1),
denumire varchar(30),
adresa varchar(30)
)

create table Tip_Cafea(
id_tipcafea int primary key identity(1,1),
provenienta varchar(30),
intensitate varchar(30)
)

create table RelPrajTip(
id_prajitorie int foreign key references Prajitorie(id_prajitorie) on delete cascade on update cascade,
id_tipcafea int foreign key references Tip_Cafea(id_tipcafea) on delete cascade on update cascade,
data_prajire date
)

create table Cafenea(
id_cafenea int primary key identity (1,1),
denumire varchar(30),
adresa varchar(30)
)

create table Factura(
id_tipcafea int foreign key references Tip_Cafea(id_tipcafea) on delete cascade on update cascade,
id_cafenea int foreign key references Cafenea(id_cafenea) on delete cascade on update cascade,
factura_data date,
price int not null,
cantitate int not null
)


create function Gestionare(@id_cafenea int)
returns table as return 
select Tip_Cafea.intensitate,Tip_Cafea.provenienta from Tip_Cafea
inner join Factura on Factura.id_tipcafea = Tip_Cafea.id_tipcafea
where Factura.id_cafenea =@id_cafenea and Factura.factura_data='2025-10-01'

insert into Cafenea values('latte','strada1'),('cappu','strada2'),('simpla','strada3')
insert into Tip_Cafea values('asia','tare'),('china','lunga'),('europa','cu lapte')
insert into Factura values(1,1,'2025-10-01',10,1),(2,2,'2025-11-09',50,2),(3,3,'2024-01-01',100,5)

select *from dbo.Gestionare(1)

create or alter procedure Verifica
@Id int,
@Denumire varchar(30),
@Adresa varchar(30)
as begin
if exists (select 1 from Cafenea where @Id=id_cafenea) 
begin
	update Cafenea set denumire=@Denumire ,adresa=@Adresa where id_cafenea=@Id
end

else 
begin
insert into Cafenea values(@Denumire,@Adresa)
end
end

exec Verifica 1,'unlucky','Naspa'

select *from Cafenea

	 
