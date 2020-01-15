/* Charger les données */

filename mesDos '/home/.../my_courses/nmeraihi1/data/hr/departments.csv';


proc import datafile=mesDos
    DBMS=csv
    out=departments
    replace
    ;
run;

FILENAME REFFILE '/home/.../my_courses/nmeraihi1/data/hr/employees.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.employees;
	GETNAMES=YES;
RUN;


filename mesDos '/home/.../my_courses/nmeraihi1/data/hr/jobs.csv';


proc import datafile=mesDos
    DBMS=csv
    out=jobs;
run;

filename mesDos '/home/.../my_courses/nmeraihi1/data/hr/job_history.csv';


proc import datafile=mesDos
    DBMS=csv
    out=job_history;
run;




filename mesDos '/home/.../my_courses/nmeraihi1/data/hr/locations.csv';


proc import datafile=mesDos
    DBMS=csv
    out=locations;
run;



filename mesDos '/home/.../my_courses/nmeraihi1/data/hr/regions.csv';


proc import datafile=mesDos
    DBMS=csv
    out=regions;
run;


proc sql outobs=5;
	select 	E.first_name,
			E.last_name,
			D.department_name,
			L.city,
			L.state_province
	from work.employees as E
	left join departments D
       ON E.department_id = D.department_id
       	left join locations L
           ON D.location_id = L.location_id;
	;
quit;



proc sql;
SELECT E.first_name , E.last_name ,
       E.department_id ,  D.department_name
         FROM employees E
         left JOIN departments D
          ON E.department_id = D.department_id
          AND E.department_id IN (80 , 40)
           ORDER BY E.last_name;
quit;


proc sql;
SELECT E.first_name,E.last_name,
   D.department_name, L.city, L.state_province
     FROM employees E
      left JOIN departments D
       ON E.department_id = D.department_id
        left JOIN locations L
         ON D.location_id = L.location_id
           WHERE E.first_name LIKE  '%z%';
quit;


/* Trouvez les employés qui gagnent moins que le salaire moyen */

proc sql;
select * from employees where salary < (select avg(salary) from employees);
quit;


proc sql;
SELECT job_title, first_name || ' ' || last_name AS Employee_name,
	max_salary-salary AS salary_difference
	FROM employees
		NATURAL JOIN jobs;
quit;


proc sql;
SELECT 	department_name,
		AVG(salary) as SalaireMoyen format=dollar15.2,
		COUNT(commission_pct) as nombre
	FROM departments D
		left JOIN employees E
		on E.department_id=D.department_id
GROUP BY department_name
order by nombre desc
;
quit;


proc sql;
SELECT job_title, AVG(salary) format=dollar15.2
	FROM employees as E, jobs as J
	where E.job_id=J.job_id
			GROUP BY job_title;
quit;
