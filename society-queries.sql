-- serie 1
-- 1
select * from department;

-- 2
select last_name, hiring_date, superior_id, department_id, salary from employee;

-- 3
select title from employee;

-- 4
select distinct title from employee;

-- 5
select * from employee where salary > 25000;

-- 6
select last_name, id, department_id from employee where title = 'secrétaire';

-- 7
select name, id from department where id > 40;

-- 8
select last_name, first_name from employee where last_name < first_name;

-- 9
select last_name, salary, department_id from employee where title = 'représentant' and department_id = '35' and salary > 20000;

-- 10
select last_name, title, salary from employee where title = 'représentant' or title = 'président';

-- 11
select last_name, title, department_id , salary from employee where department_id = '34' and (title = 'représentant' or title = 'secrétaire');

-- 12
select last_name, title, department_id , salary from employee where title = 'représentant' or (department_id = '34' and title = 'secrétaire');

-- 13
select last_name, salary from employee where salary >= 20000 and salary <=30000;

-- 14
select last_name from employee where last_name like 'h%';

-- 15
select last_name from employee where last_name like '%n';

-- 16
select last_name from employee where last_name like '__u%';

-- 17
select last_name, salary from employee where department_id = '41' order by salary;

-- 18
select last_name, salary from employee where department_id = '41' order by salary DESC;

-- 19
select last_name, salary, title from employee order by title ASC, salary DESC;

-- 20
select last_name, salary, commission_rate from employee order by commission_rate;

-- 21
select last_name, salary, commission_rate, title from employee where commission_rate is null;

-- 22
select last_name, salary, commission_rate, title from employee where commission_rate is not null;

-- 23
select last_name, salary, commission_rate, title from employee where commission_rate < 15;

-- 24
select last_name, salary, commission_rate, title from employee where commission_rate > 15;

-- 25
select last_name, salary, commission_rate, (salary*(commission_rate/100)) as commission from employee where commission_rate is not null;

-- 26
select last_name, salary, commission_rate, (salary*(commission_rate/100)) as commission from employee where commission_rate is not null order by commission;

-- 27
select concat(last_name, ' ', first_name) as name from employee ;

-- 28
select substring(last_name, 0, 6) from employee;

-- 29
select last_name, position('r' in last_name) from employee;

-- 30
select last_name, upper(last_name), lower(last_name) from employee where last_name = 'vrante';

-- 31
select last_name, length(last_name) from employee;

-- serie 2

-- 1
select * from employee e join department d on e.department_id = d.id;

-- 2
select d.id, d.name AS department_name, e.last_name from employee e join department d ON e.department_id = d.id order by d.id;

-- 3
select d.id, d.name AS department_name, e.last_name from employee e join department d ON e.department_id = d.id where department_name = 'distribution';

-- 4
select e1.last_name AS employee_name, e1.salary AS employee_salary, e2.last_name AS superior_name, e2.salary AS superior_salary from employee e1 join employee e2 ON e1.superior_id = e2.id where e1.salary > e2.salary;

-- 5
select * from employee where department_id in (select id from department where name like 'finance');

-- 6
select e.last_name, e.title from employee e where e.title = (select e2.title from employee e2 where e2.last_name = 'amartakaldire');

-- 7
select e.last_name, e.salary, e.department_id from employee e where e.salary > any (select e2.salary from employee e2 where e2.department_id = '31') order by department_id, salary;

-- 8
select e.last_name, e.salary, e.department_id from employee e where e.salary > all (select e2.salary from employee e2 where e2.department_id = '31') order by department_id, salary;

-- 9
select e.last_name, e.title from employee e where e.department_id = '31' and e.title in (select e2.title from employee e2 where e2.department_id = '32');

-- 10
select e.last_name, e.title from employee e where e.department_id = '31' and e.title not in (select e2.title from employee e2 where e2.department_id = '32');

-- 11
select e.last_name, e.title, e.salary from employee e where (e.title, e.salary) = (select e2.title, e2.salary from employee e2 where e2.last_name = 'fairent');

-- 12
select d.id, d.name, e.last_name from department d left join employee e on d.id = e.department_id order by d.id;

-- 13
select avg(salary) from employee e where title like 'secrétaire'; 

-- 14
select title, count(*) from employee group by title;

-- 15
select d.region_id, avg(e.salary), sum(e.salary) from employee e join department d on e.department_id = d.id group by d.region_id;

-- 16
select department_id, count(*) from employee group by department_id having count(*) >= 3;

-- 17
select left(last_name, 1), count(*) from employee group by left(last_name, 1) having count(*) >= 3;

-- 18
select max(salary), min(salary), max(salary)-min(salary) as écart from employee;

-- 19
select count(distinct title) from employee;

-- 20
select distinct title, count(*) from employee e group by title;

-- 21
select d.name, count(*) from department d group by d.name;

-- 22
select e.title, avg(e.salary) from employee e group by e.title having avg(e.salary) > (select avg(e2.salary) from employee e2 where e2.title like 'représentant') ;

-- 23
select count(salary), count(commission_rate) from employee e;