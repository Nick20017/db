if db_id('lab10') is not null
	drop database lab10;

create database lab10;

use lab10;
go
create type mark
from tinyint null;

create default dbo.default_mark as 3;

exec sp_bindefault default_mark, mark;
exec sp_bindrule mark_rule, mark;

create table lab10.dbo.student (
	Name varchar(20) not null,
	LastName varchar(30) not null,
	Maths mark not null,
	Physics mark not null,
	Biology mark not null
)

insert into lab10.dbo.student
values ('Name1', 'LName1', 3, 2, 4);

insert into lab10.dbo.student
values ('Name2', 'LName2', 3, 2, 5);

insert into lab10.dbo.student
values ('Name3', 'LName3', 5, 5, 5);

drop table lab10.dbo.student;
exec sp_unbindefault mark;
exec sp_unbindrule mark;
drop type dbo.mark;
drop default dbo.default_mark;
drop rule dbo.mark_rule;
