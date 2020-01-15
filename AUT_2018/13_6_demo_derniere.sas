
%macro genExpo(lambda, seed);
	data exponential (drop=i);
 		call streaminit(&seed);
 		do i=1 to 1000;
    		x=rand('exponential',&lambda); /* car uniform de 0 a 1 */
    		y_pexp=pdf("EXPO", x);
    		y_cexp=cdf("EXPO", x);
     		output;
		end;
	run;
	title "avec proc print";
	proc print data=exponential (obs=3);
	run;
	proc sql outobs=3;
	title "avec procSQL";
		select * from work.exponential;
	quit;
	title "fonction de masse";
	
	proc sgplot data=exponential;
		scatter x=x y=y_pexp;
	run;
	title "CDF";
	proc sgplot data=exponential;
		scatter x=x y=y_cexp;
	run;
%mend genExpo;
%genExpo(2, 3035);

/* Jointure de tables */
FILENAME refDep '/home/ec2913580/my_courses/nmeraihi1/data/hr/departments.csv';

PROC IMPORT DATAFILE=refDep
	DBMS=CSV
	OUT=WORK.departments;
	GETNAMES=YES;
RUN;

FILENAME refEmp '/home/ec2913580/my_courses/nmeraihi1/data/hr/employees.csv';

PROC IMPORT DATAFILE=refEmp
	DBMS=CSV
	OUT=WORK.employees;
	GETNAMES=YES;
RUN;


FILENAME refHis '/home/ec2913580/my_courses/nmeraihi1/data/hr/job_history.csv';

PROC IMPORT DATAFILE=refHis
	DBMS=CSV
	OUT=WORK.job_history;
	GETNAMES=YES;
RUN;

FILENAME refJobs '/home/ec2913580/my_courses/nmeraihi1/data/hr/jobs.csv';

PROC IMPORT DATAFILE=refJobs
	DBMS=CSV
	OUT=WORK.jobs;
	GETNAMES=YES;
RUN;

FILENAME refLoc '/home/ec2913580/my_courses/nmeraihi1/data/hr/locations.csv';
PROC IMPORT DATAFILE=refLoc
	DBMS=CSV
	OUT=WORK.locations;
	GETNAMES=YES;
RUN;


FILENAME refReg '/home/ec2913580/my_courses/nmeraihi1/data/hr/regions.csv';
PROC IMPORT DATAFILE=refReg
	DBMS=CSV
	OUT=WORK.regions;
	GETNAMES=YES;
RUN;

/*first_name
last_name
department_name,
city,
state_province  */


proc sql ;
	select 
		E.first_name,
		E.last_name,
		D.department_name,
		L.city,
		L.state_province
		
	from work.EMPLOYEES as E
		left join work.DEPARTMENTS as D
		on E.DEPARTMENT_ID=D.DEPARTMENT_ID
			left join work.locations as L
			on E.LOCATION_ID=L.LOCATION_ID
	;
quit;

/* FIRST_NAME	LAST_NAME	DEPARTMENT_ID	DEPARTMENT_NAME */

proc sql outobs=5;
	select 
		E.FIRST_NAME,
		E.LAST_NAME, 
		D.DEPARTMENT_ID,
		D.DEPARTMENT_NAME
		
	from EMPLOYEES as E
		left join DEPARTMENTS as D 
		on E.DEPARTMENT_ID = D.DEPARTMENT_ID
/* 			and E.DEPARTMENT_ID in (40, 80) */
		where E.DEPARTMENT_ID between 40 and 80
		order by E.LAST_NAME
	;

quit;


/* JOB_TITLE	Employee_name	salary_difference */

proc sql outobs=5;
	select
		J.JOB_TITLE,
		E.FIRST_NAME ||" "||  E.last_name as Employee_name,
		J.max_salary-E.salary as salary_difference format=dollar15.2
	from EMPLOYEES as E left join jobs as J
	on E.job_ID=J.job_id
	order by J.JOB_TITLE
	;
quit;

/* DEPARTMENT_NAME	SalaireMoyen	nombre */

proc sql outobs=5;
	select
		D.DEPARTMENT_NAME, 
		avg(E.salary) as SalaireMoyen format=dollar15.2,
		count(E.COMMISSION_PCT) as nombre
	from DEPARTMENTS as D 
		left join EMPLOYEES as E
		on D.DEPARTMENT_ID =E.DEPARTMENT_ID
	group by DEPARTMENT_NAME
	order by nombre desc
	;
quit;

/* JOB_TITLE moyenn_job */

proc sql outobs=5;
	select J.JOB_TITLE, 
	avg(E.salary) as salaireMoyen format=dollar15.2
	
	from EMPLOYEES as E
		left join jobs as J
		on E.job_id=J.job_id
	group by JOB_TITLE
	;
quit;
























