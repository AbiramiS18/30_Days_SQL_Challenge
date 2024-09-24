CREATE Table Footer(
			id int(5),
            car varchar(50),
            length int(5),
            width int(5),
            height int(5),
            primary key(id));
            
INSERT INTO Footer(id,car,length,width,height) 
	VALUES 
    (1,"Hyundai Tucson", 15,6, null),
	(2,null, null,null, 20),
	(3,null, 12,8, 15),
    (4,"Toyota Rav4", null,15, null),
	(5,"Kia sportage", null,null, 18);
