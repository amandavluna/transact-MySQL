/* 1 -consulta todos os campos */
select * from funcionarios;

/*2 consulta com campos especificos */
select nome,email,salario from funcionarios;

/*3 lista nome e salário dos funcionários que ganham menos de 4000 */
select nome,salario from funcionarios where salario < 4000;

/* 4 - Listar nome e salário dos Funcionários que ganham igual a 10000.*/
select nome,salario from funcionarios where salario = 10000;

/* 5 - Listar nome, salário e estado dos Funcionários do estado de SP */
select nome,salario,estado from funcionarios where estado = 'SP';

/*6 - Listar nome, salario, cidade e estado dos funcionários do estado de SP que ganhem mais de 5000 e tenham nascido antes de 1980.*/
select nome,salario,cidade,estado from funcionarios where estado = 'SP'and salario >5000 and data_nascimento <'1980/12/31';

/* 7 - Listar nome, cidade e estado dos funcionários do estado de SP e MG*/
select nome,cidade,estado from funcionarios where estado = 'SP' or estado = 'MG';

/* 8 - Listar os funcionários de id entre 4 e 7 */
select id from funcionarios where id <=7 and id >=4;
/* select * from funcionarios where id between 4 and 7;*/

/*9 - Listar os funcionários que nasceram entre 1980 e 1990.*/
select  * from funcionarios where data_nascimento between "1980/01/01" and "1990/12/30";

/*10 - Organizar os registros por ordem crescente e decrescente.*/
select * from funcionarios order by data_nascimento; 

/*11 - Funções de Agregação: SUM, MAX, MIN, AVG e COUNT.*/

select sum(salario) as soma from funcionarios;

select max(salario) as maximo from funcionarios;
select min(salario) as minimo from funcionarios;

select avg(salario) as media from funcionarios;

select count(salario) as totalSalario from funcionarios;

/* todos juntos*/
select sum(salario) as soma, max(salario) as maximo, min(salario) as minimo, avg(salario) as media, count(salario) as totalSalario from funcionarios;