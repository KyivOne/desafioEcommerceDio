-- Criação do banco de dados ecommerce
create database ecommerce;
-- drop database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
             idClient int auto_increment primary key,
             Fname varchar(10),
             Minit char(3),
             Lname varchar(20),
             CPF char(11) not null,
             Adress varchar(30),
             constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

-- criar tabela produto
create table product( 
             idProduct int auto_increment primary key,
             Pname varchar(50) not null,
             classification_kids bool default false,
             category enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
             avaliação float default 0,
             size varchar(10)
);

alter table product auto_increment=1;

-- cria tabela payment
-- Termine de implementar a tabela e crie as conexões com as tabelas necessarias
-- Reflita essa modificação no diagrama

create table payments(
             idClient int,
             idPayment int,
             typePayment enum('Boleto','Cartão','Dois cartões'),
             limitAvailabe float,
             primary key (idClient, idPayment)
);


-- criar tabela pedido
create table orders(
             idOrder int auto_increment primary key,
             idOrderClient int,
             orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
             orderDescription varchar(255),
             sendValue float default 10,
             paymentCash bool default false,
             constraint fk_orders_client foreign key (idOrderClient) references clients (idClient)
);

alter table orders auto_increment=1;

-- Cria tabela estoque 
create table productStorage(
             idProdStorage int auto_increment primary key,
             storageLocation varchar(255),
             quantity int default 0

);

alter table productStorage auto_increment=1;

-- criar tabela fornecedor
create table supplier(
             idSupplier int auto_increment primary key,
             SocialName varchar(255) not null,
             CNPJ char(15) not null,
             contact char(11) not null,
             constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;

-- cria tabela vendedor
create table seller(
             idSeller int auto_increment primary key,
             SocialName varchar(255) not null,
             AbstName varchar(255),
             CNPJ char(15),
             CPF char(9),
             location varchar(255),
             contact char(11) not null,
             constraint unique_cnpj_seller unique (CNPJ),
             constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;

create table productSeller(
             idPseller int,
             idPproduct int,
             prodQuantity int default 1,
             primary key (idPseller, idPproduct),
             constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
             constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

create table productOrder(
           idPOproduct int,
           idPOorder int,
           poQuantity int default 1,
           poStatus enum('Disponivel','Sem estoque') default 'Disponivel',
           primary key (idPOproduct, idPOorder),
           constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
           constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
            idLproduct int,
            idLstorage int,
            location varchar(255) not null,
            primary key(idLproduct, idLstorage),
            constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
            constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
             idPsSupplier int,
             idPsProduct int,
             quantity int not null,
             primary key (idPsSupplier, idPsProduct),
             constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
             constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

