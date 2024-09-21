CREATE TABLE brands
	(Brand1 VARCHAR(15),
     Brand2 VARCHAR(15),
     Year int,
     Custom1 int,
     Custom2 int,
     Custom3 int,
     Custom4 int
     );
    
INSERT INTO brands(Brand1, Brand2, Year, Custom1, Custom2, Custom3, Custom4)
	VALUES
		("apple","samsung",2020,1,2,1,2),
		("samsung","apple",2020,1,2,1,2),
		("apple","samsung",2021,1,2,5,3),
		("samsung","apple",2021,5,3,1,2),
		("google",null,2020,5,9,null,null),
		("oneplus","nothing",2020,5,9,6,3);