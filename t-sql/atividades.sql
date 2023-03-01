/*- 1 - Liste o nome de todos os clientes do estado de SP que tenham a letra "o" no nome.*/
select * from cliente where nome like '%o%' and IdEstadoFK = 1;
select nome,email from cliente where nome like '%o%' and IdEstadoFK = 1;
select nome as Nome, email as Email from cliente where nome like '%o%' and idEstadoFK = 1;
/* as é como um apelido, não altera o nome verdadeiro na tabela, apenas apelida */

/* 2 - Listar o nome de todos os produtos que comecem com a letra "L".*/
select nome from produto where nome like 'l%';

/* 3 - Listar o nome de todos os vendedores que terminem com a letra "s" */
select nome,cpf from vendedor where nome like '%s';

/* limit */
select * from produto limit 0,5;
select * from produto limit 5,5;

/* buscar os produtos organizando eles por ordem decrescente e o limite até o 10 */
select * from produto order by idproduto desc limit 10;
select * from produto order by idCategoriaFK desc limit 3;

/* inner join */
select * from cliente inner join estado on cliente.idEstadoFK = estado.idEstado;

select cliente.nome as Cliente, estado.nome as Estado from cliente inner join estado on cliente.idEstadoFK = estado.idEstado;

select * from cliente inner join cidade on cliente.idCidadeFK = cidade.idCidade;

select c.nome as Cliente, e.nome as Estado, cd.nome as Cidade from cliente c inner join estado e on c.idEstadoFK = e.idEstado
inner join cidade cd on c.idcidadefk = cd.idcidade; 


/* Atividade */
/*1 - Listar o nome do cliente, email e nome da cidade.*/

select cliente.nome as Cliente, cliente.email as Email, cidade.nome as Cidade from cliente
inner join cidade on cliente.idcidadefk = cidade.idcidade;

/*2 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades do estado de SP.*/
select cliente.nome as Cliente, cliente.email as Email, cidade.nome as Cidade, estado.nome as Estado from cliente 
inner join cidade on cliente.idcidadefk = cidade.idcidade 
inner join estado on cliente.idestadofk = estado.idestado
where estado.nome = 'sp';

/*3 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades que tenham a letra "ó" no nome do cliente.*/
select cliente.nome as Cliente, cliente.email as Email, cidade.nome as Cidade, estado.nome as Estado from cliente 
inner join cidade on cliente.idcidadefk = cidade.idcidade 
inner join estado on cliente.idestadofk = estado.idestado
where cliente.nome like '%ó%';

/*4 - Listar o nome do produto e nome da marca dos produtos que custem entre 1000 e 3000 reais.*/
select produto.nome as Produto, marca.nome as Marca, produto.preco as Preço from produto 
inner join marca on produto.idmarcafk = marca.idmarca 
where preco >= 1000 and preco <= 3000;

/*5 - Listar o nome do produto, nome da marca e nome da categoria dos produtos que tenham a letra "e" no nome do produto.*/
select produto.nome as Produto, marca.nome as Marca, categoria.nome as Categoria from produto 
inner join marca on produto.idmarcafk = marca.idmarca 
inner join categoria on produto.idcategoriafk = categoria.idcategoria
where categoria.nome like '%e%';

/*6 - Listar o número do pedido, a data do pedido e nome do cliente dos pedidos com realizados no mês 08/2016.*/
select idpedido as ID, data_pedido as 'Data', cliente.nome as Nome from pedido 
inner join cliente on pedido.idclientefk = cliente.idcliente
 where pedido.data_pedido between '2016-08-01' and '2016-08-31';

/*7 - Listar o número do pedido, a data do pedido, nome do cliente e nome do vendedor dos pedidos com realizados no mês 07/2016.*/
select pedido.idpedido as ID, pedido.data_pedido as 'Data', cliente.nome as Nome, vendedor.nome as Vendedor from pedido 
inner join cliente on idclientefk = cliente.idcliente
inner join vendedor on idVendedorFK = vendedor.idvendedor
where pedido.data_pedido between '2016-07-01' and '2016-07-31';

/*8 - Listar os nome e preço dos produtos comprados pelo cliente de id= 1 */
select idcliente, cliente.nome as Nome, produto.nome as Produto, produto.preco as Preço from itens_pedido 
inner join produto on itens_pedido.idprodutofk = produto.idproduto 
inner join pedido on idpedidofk = pedido.idpedido
inner join cliente on pedido.idclientefk = cliente.idcliente 
where idcliente = '1';

/*9 - Listar o número do pedido e o nome clientes que possuem pedidos e também dos que não possuem pedidos.*/
create view clientepedido as
select idpedido as ID, cliente.nome as Cliente from cliente left join pedido
on idclientefk = idcliente; 
select * from clientepedido;

/*10 - Listar o nome, preço, nome da categoria e nome da marca do produto mais caro.*/
select produto.nome as Produto, produto.preco as Preço, categoria.nome as Categoria, marca.nome as Marca from produto 
inner join categoria on idcategoriafk = idcategoria 
inner join marca on idmarcafk = marca.idmarca order by produto.preco desc limit 1;

/*11 - Listar o número do pedido, valor total e nome do cliente do pedido mais caro.*/
select idpedido as Número, itens_pedido.valor_total as 'Preço Total', cliente.nome as 'Nome do Cliente' from pedido
inner join itens_pedido on idpedidofk = idpedido
inner join cliente on idclientefk = idcliente
order by itens_pedido.valor_total desc limit 1;

/*12 - Listar o número do pedido, valor total e nome do vendedor do pedido mais barato.*/
select idpedido as Número, itens_pedido.valor_total as 'Preço Total', vendedor.nome as 'Nome do Vendedor' from pedido
inner join itens_pedido on idpedidofk = idpedido
inner join vendedor on idvendedorfk = idvendedor
order by itens_pedido.valor_total asc limit 1;