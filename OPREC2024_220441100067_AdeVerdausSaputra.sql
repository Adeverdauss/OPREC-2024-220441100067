CREATE DATABASE db_user_management;

USE db_user_management;

DROP DATABASE db_user_management;

CREATE TABLE departments (
departments_id INT NOT NULL PRIMARY KEY,
NAME VARCHAR(15) NOT NULL,
location VARCHAR (20) NOT NULL
);

DROP TABLE departments;
-- INSERT into TABLE: departments
INSERT INTO departments (departments_id,NAME, location)
   VALUES
      (1,'HR', 'New York'),
      (2,'IT', 'San Francisco'),
      (3,'Finance', 'Chicago'),
      (4,'Marketing', 'Los Angeles'),
      (5,'Sales', 'Houston');
      
      
 CREATE TABLE employees (
 employees_id INT NOT NULL PRIMARY KEY,
 NAME VARCHAR (20) NOT NULL,
 date_birth DATE NOT NULL, 
 hire_date DATE NOT NULL, 
 departments_id INT NOT NULL, 
 POSITION VARCHAR (20) NOT NULL, 
 base_salary INT
 );

-- INSERT into TABLE: employees
INSERT INTO employees (employees_id,NAME, date_birth, hire_date, departments_id, POSITION, base_salary)
   VALUES
      (1,'Alice Smith', '1985-06-15', '2010-03-01', 1, 'HR Manager', 80000),
      (2,'Bob Johnson', '1990-09-20', '2012-07-15', 2, 'Software Engineer', 95000),
      (3,'Charlie Davis', '1982-11-30', '2008-11-01', 3, 'Accountant', 70000),
      (4,'David Thompson', '1993-04-25', '2014-02-10', 4, 'Marketing Specialist', 65000),
      (5,'Eve Parker', '1979-01-18', '2005-06-23', 5, 'Sales Executive', 75000);

 CREATE TABLE projects (
 NAME VARCHAR (20) NOT NULL PRIMARY KEY,
 budget INT NOT NULL, 
 start_date DATE, 
 end_date DATE
 );


-- INSERT into TABLE: projects
INSERT INTO projects (NAME, budget, start_date, end_date)
   VALUES
      ('Project Alpha', 5000000, '2022-01-01', '2022-12-31'),
      ('Project Beta', 3000000, '2022-02-01', '2022-11-30'),
      ('Project Gamma', 7000000, '2022-03-01', '2023-03-31'),
      ('Project Delta', 4500000, '2022-04-01', '2022-10-31'),
      ('Project Epsilon', 6000000, '2022-05-01', '2023-05-31');

CREATE TABLE employee_projects (
 employee_id INT NOT NULL, 
 project_id INT NOT NULL, 
 hrs_worked INT NOT NULL
 );
 
-- INSERT into TABLE TRANSACTION: employee_projects
INSERT INTO employee_projects (employee_id, project_id, hrs_worked)
   VALUES
      (1, 1, 120),
      (2, 2, 100),
      (3, 3, 140),
      (4, 4, 80),
      (5, 5, 90);
      
CREATE TABLE  salaries (
employee_id INT NOT NULL PRIMARY KEY, 
payment_date DATE NOT NULL , 
gaji_dasar INT NOT NULL, 
bonus INT NOT NULL, 
potongan INT NOT NULL, 
pendapatan INT NOT NULL

);

-- INSERT into TABLE: salaries
INSERT INTO salaries (employee_id, payment_date, gaji_dasar, bonus, potongan, pendapatan)
   VALUES
      (1, '2023-01-31', 80000, 5000, 2000, 83000),
      (2, '2023-02-28', 95000, 6000, 2500, 98500),
      (3, '2023-03-31', 70000, 4000, 1500, 72500),
      (4, '2023-04-30', 65000, 3500, 1800, 66700),
      (5, '2023-05-31', 75000, 4500, 2200, 77300);


CREATE TABLE LeaveRequests (
employee_id INT NOT NULL PRIMARY KEY, 
request_date DATE, 
start_date DATE, 
end_date DATE, 
STATUS VARCHAR (20) NOT NULL
);

-- INSERT into TABLE: leave_requests
INSERT INTO LeaveRequests (employee_id, request_date, start_date, end_date, STATUS)
   VALUES
      (1, '2024-01-10', '2024-02-01', '2024-02-10', 'Approved'),
      (2, '2024-02-05', '2024-03-01', '2024-03-05', 'Pending'),
      (3, '2024-03-12', '2024-04-01', '2024-04-07', 'Denied'),
      (4, '2024-04-20', '2024-05-01', '2024-05-10', 'Approved'),
      (5, '2024-05-15', '2024-06-01', '2024-06-05', 'Pending');

CREATE TABLE performance_reviews (
employee_id INT NOT NULL, 
review_date DATE NOT NULL, 
reviewer VARCHAR (20) NOT NULL, 
performance_score INT NOT NULL, 
comments VARCHAR (20) NOT NULL
);
DROP TABLE performance_reviews;
-- INSERT into TABLE: performance_reviews
INSERT INTO performance_reviews (employee_id, review_date, reviewer, performance_score, comments)
   VALUES
      (1, '2024-05-01', 'John Doe', 85, 'Konsisten memenuhi ekspektasi. Etos kerja yang kuat.'),
      (2, '2024-05-10', 'Jane Smith', 90, 'Kinerja luar biasa. Pemain tim yang sangat baik.'),
      (3, '2024-05-15', 'Robert Brown', 78, 'Memenuhi ekspektasi. Bisa meningkatkan manajemen waktu.'),
      (4, '2024-05-20', 'Emily White', 88, 'Kinerja yang kuat. Kemampuan memecahkan masalah yang hebat.'),
      (5, '2024-06-01', 'Michael Green', 92, 'Hasil yang luar biasa. Melebihi ekspektasi di sebagian besar area.'),
      (1, '2024-06-10', 'Laura Black', 80, 'Kinerja solid. Dapat diandalkan dan tepat waktu.'),
      (2, '2024-06-15', 'William Grey', 83, 'Kinerja yang baik. Menunjukkan potensi untuk peran kepemimpinan.'),
      (3, '2024-06-20', 'Sophia Blue', 87, 'Konsisten berkinerja baik. Kemampuan analisis yang kuat.'),
      (4, '2024-06-25', 'Oliver Purple', 75, 'Memenuhi persyaratan dasar. Perlu peningkatan dalam komunikasi.'),
      (5, '2024-06-30', 'Isabella Red', 91, 'Kinerja sangat baik. Menunjukkan inisiatif yang kuat.');
      
      
 -- view 
 CREATE VIEW laporangaji AS SELECT a.name, POSITION, departments_id, payment_date, gaji_dasar, bonus, potongan, pendapatan FROM employees a NATURAL JOIN salaries b GROUP BY payment_date;
 
 CREATE VIEW rata_bonus AS SELECT a.name, b.name, average(bonus) FROM employees a NATURAL JOIN departments b;
 
 CREATE VIEW evaluasi AS SELECT a.name, POSITION, b.name, review_date, average(performance_score), reviewer FROM employees a NATURAL JOIN departments b  NATURAL JOIN performance_reviews c;
 
 
 
 
 -- stored procedure
 
 DELIMITER // 
 CREATE PROCEDURE CalculateBonus ( IN employees_i, IN bonus_percentage)
 
 BEGIN
 
 
 END // 
 DELIMITER ;
 
  DELIMITER // 
 CREATE PROCEDURE AdjustSalary ( IN employees_id, IN bonus_percentage)
 
 BEGIN
 
 
 END // 
 DELIMITER ;
 
 
 
 
 -- create trigger
 
 CREATE TRIGGER kurang_bonus AFTER INSERT ON performance_reviews FOR EACH ROW
 IF performance_score < 75
	SET new.bonus = old.bonus - 1000
END IF ;


CREATE TRIGGER 	updateposisi AFTER INSERT ON performance_reviews FOR EACH ROW
 IF performance_score > 85
	SET new.position = 'Senior'
END IF;