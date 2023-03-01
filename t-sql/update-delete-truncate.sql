/* Altere os campos do produto Arroz Integral conforme informações abaixo:
Valor: R$ 13.00          Marca: Panela de Ferro       Fabricação: 05-05-2014               Tipo: Pacote*/
 
select * from produtos;
update produtos set valor = 13.00 where id= 1;
update produtos set marca = 'Panela de Ferro' where id= 1;
update produtos set data_fabricacao = '2014-05-05' where id= 1;
update produtos set tipo = 'Pacote' where id=1;

/* Altere todos os produtos do tipo Cosméticos para:
valor: R$ 25.00 e fabricação para 30-03-2016 */
update produtos set valor = 25.00 , data_fabricacao = '2016-03-30' where tipo = 'Cosmeticos' and id > 1;

/*Exiba a média dos preços apenas dos Eletrodomesticos com o apelido Media_Eletro.*/
select avg(valor) as Media_Eletro from produtos where tipo = 'Eletrodomestico';

/* Apagar os produtos que tenham o valor acima de R$ 300,00 e id superior a 8.*/
delete from produtos where id >8 and valor > 300.00;

/* Listar o nome, estoque e valor de todos os produtos.*/
select produto, estoque, valor from produtos;

/*Listar as tabelas existentes no Banco de Dados e depois sua Estrutura.*/
show tables; 
desc produtos;

/* Listar o valor do produto mais caro com o apelido Maior_Valor.*/
select max(valor) as Maior_Valor from produtos;

/*Listar os produtos que custem menos de 18.00 e sejam do tipo Alimentos.*/
select * from produtos where valor <18.00 and tipo = 'Alimentos';

/*Listar o nome do produto e o valor do produto em ordem decrescente*/
select * from produtos order by valor;

/* Apagar todos os dados da tabela.*/
truncate produtos;