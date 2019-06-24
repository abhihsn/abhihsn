use Organisation_structure;

CREATE TABLE Office (

    emp_id int(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    emp_name varchar(255),
    mng_id int(10), 
    foreign key(mng_id)references Office(emp_id)
    
); 

INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (1,'Abhishek B',null);
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (2,'Sai Deepak','1');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (3,'Shailesh Kumar','1');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (4,'Tinu','1');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (5,'Prabath','2');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (6,'Vineeth','2');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (7,'Kavana','3');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (8,'Pooja','3');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (9,'Ajith','4');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (10,'Sreejith','4');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (11,'Shyvil','5');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (12,'Arun','5');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (13,'Babu','6');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (14,'Kiran','7');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (15,'Venkat','9');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (16,'Jerry','10');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (17,'Raju','11');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (18,'Vivekanand','15');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (19,'Deepak','16');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (20,'Pracheta','18');
INSERT INTO Office (emp_id,emp_name,mng_id) VALUES (21,'Abhi','19');



select * from Office


Find the Office who are managers

SELECT DISTINCT e.emp_id AS 'mng_id'
FROM Office e, Office m WHERE e.emp_id = m.mng_id




Find the managers with the count of subordinates

SELECT COUNT(emp.emp_id) AS 'emp_count'
FROM Office emp,
(SELECT DISTINCT e.emp_id AS 'mng_id'
FROM Office e, Office m
WHERE e.emp_id = m.mng_id) mng
WHERE emp.mng_id = mng.mng_id
GROUP BY mng.mng_id





Find the managers with the count of subordinates greater than 1 (or any other number)

SELECT COUNT(emp.emp_id) AS 'emp_count'
FROM Office emp,
(SELECT DISTINCT e.emp_id AS 'mng_id'
FROM Office e, Office m
WHERE e.emp_id = m.mng_id) mng
WHERE emp.mng_id = mng.mng_id
GROUP BY mng.mng_id HAVING COUNT(emp.emp_id) > 1;



