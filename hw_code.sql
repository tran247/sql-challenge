--RECREATE TABLEs BECAUSE I FORGOT TO SAVE AND I SCROLLED RIGHT AND IT WENT BACK
--NOW I HAVE TO MAKE EVERYTHING AND SAVE AT EVERY TABLE SO I WONT FORGET
--DID I MENTION I HAVE TO DO THIS AGAIN? AHHHH!!!
--DID IT WRONG AGAIN!! FORGOT ABOUT PRIMARY AND FOREIGN KEY
--DROP TABLE CASCADE ALL tables and redo. 3rd times the charm!

-- Used ERD to create graphs
CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

-- AFTER SPAMMING "IMPORT" DATA INTO THE TABLES FOR OVER 3-5 DAYS WITH OCCASIONAL BREAKDOWNS
--I FINALLY GOT ALL THE DATA IN. I DON'T EVEN KNOW HOW?!


--employee number, last name, first name, gender, and salary.


SELECT e.emp_no, 
e.last_name,
e.first_name,
e.sex,
s.salary
FROM "Employees" AS e
LEFT JOIN "Salaries" AS s
ON e.emp_no = s.emp_no
ORDER BY emp_no


--employees hired 1986.

SELECT first_name, last_name, hire_date
FROM "Employees" 
WHERE hire_date >= TO_DATE('1986-01-01', 'YYYY-MM-DD')
AND hire_date <= TO_DATE('1986-12-31', 'YYYY-MM-DD');


--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" AS dm
LEFT JOIN "Departments" AS d
ON dm.dept_no = d.dept_no
LEFT JOIN "Employees" AS e
ON dm.emp_no = e.emp_no
ORDER BY emp_no

--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de ON e.emp_no=de.emp_no
INNER JOIN "Departments" AS d ON d.dept_no=de.dept_no




   