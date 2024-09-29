CREATE TABLE Missing_Value
	(Row_id int(5),
     Job_role varchar(20),
     Skills varchar(20));
     
INSERT INTO Missing_value(row_id,job_role,skills) VALUES
			(1,"Data Engineer","SQL"),
            (2,null,"Python"),
            (3,null,"AWS"),
            (4,null,"Snowflake"),
            (5,null,"Apache Spark"),
            (6,"Web Developer","Java"),
            (7,null,"HTML"),
            (8,null,"CSS"),
            (9,"Data Scientist","Python"),
            (10,null,"Machine Learning"),
            (11,null,"Deep Learning"),
            (12,null,"Tableau");