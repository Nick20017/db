use lab10;
go
create rule mark_rule
as @mark > 0 and @mark <= 5;