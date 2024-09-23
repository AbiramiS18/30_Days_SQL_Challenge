
create table mountain_huts 
	( 
	id integer not null, 
	name varchar(40) not null, 
	altitude integer not null, 
	unique(name), 
	unique(id) );
    
create table trails 
	( 
    hut1 integer not null,
    hut2 integer not null );
    
insert into mountain_huts values (1, 'Dakonat', 1900); 
insert into mountain_huts values (2, 'Natisa', 2100); 
insert into mountain_huts values (3, 'Gajantut', 1600); 
insert into mountain_huts values (4, 'Rifat', 782); 
insert into mountain_huts values (5, 'Tupur', 1370);

insert into trails values (1, 3);
insert into trails values (3, 2);
insert into trails values (3, 5);
insert into trails values (4, 5);
insert into trails values (1, 5);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         