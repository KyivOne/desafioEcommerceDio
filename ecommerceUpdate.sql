use ecommerce;
show tables;

insert into clients (Fname, Minit, Lname, CPF, Adress) 
              values ('Francisco', 'B', 'Salvadore', 13245678912, 'Rua silva jardim 98'),
                     ('Alexandro', 'A', 'Jorge', 13122283778, 'Rua ipadu 25'),
                     ('Nathalia', 'B', 'Arantes', 15372530779, 'Rua ariapo 23'),
                     ('Isaque', 'N', 'Blanto', 12345678912, 'Rua paris 11'),
                     ('Alecsander', 'F', 'Fodencio', 12354678902, 'Rua rick 24'),
                     ('Flavia', 'B', 'Pirauna', 12343567891, 'Rua pedro 34'),
                     ('Napoleão', 'A', 'Bonaparte', 98765432112, 'Rua inglaterra 66');
                     
 insert into product (Pname, classification_kids, category, avaliação, size) values
                   ('Fone ouvido', false, 'Eletronico', '4', null),
                   ('Barbie Elsa', true, 'Brinquedos', '3', null),
                   ('Body carters', true, 'vestimenta', '5', null),
                   ('Microfone Vedo - Youtuber', false, 'Eletronico', '4', null),
                   ('Sofá retratil', false, 'Moveis', '3', '3x57x80'),
                   ('Farinha de arroz', false, 'Alimentos', '2', null),
                   ('Fire stick - amazon', false, 'Eletronico', '3', null);
                   
 -- delete from orders where idOrderClient in (1,2,3,4);
 insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
                    (1, default, 'compra via aplicativo', null, 1),
                    (2, default, 'compra via aplicativo', 50, 0),
                    (3, 'confirmado', null, null, 1),
                    (4, default, 'compra via web site', 150, 0);
                    
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
                   (1,5,2,null),
                   (2,5,1,null),
                   (3,6,1,null);
                   
                   
insert into productStorage (storageLocation, quantity) values
                   ('Rio de janeiro', 1000),
                   ('Rio de janeiro', 500),
                   ('São paulo', 10),
                   ('São paulo', 100),
                   ('São paulo',11),
                   ('Brasilia', 60);
                   
insert into storageLocation (idLproduct, idLstorage, location) values
                          (1, 2, 'RJ'),
                          (2, 6 , 'GO');
                          
 insert into supplier (SocialName, CNPJ, contact) values 
				  ('Almeida e filhos', 123456789012345, '21345678909'),
                  ('Eletronicos silva', 987654321890765, '22345676545'),
                  ('Eletronicos Velma', 234567654323456, '21123223245');
                  
 insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
                  (1, 1, 500),
                  (1, 2, 400),
                  (2, 4, 633),
                  (3, 3, 5),
                  (2, 5, 10);
                  
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
                  ('Tech eletronics', null, 123456578989789, null, 'Rio de janeiro', '21343223454'),
                  ('Botique Durgas', null, null, 123434356, 'Rio de janeiro', '21465432345'),
                  ('Kids World',null, 987645657890345, null, 'São paulo', '11939456789');
                  
insert into productSeller (idPseller, idPproduct, prodQuantity) values
                  (1, 6, 80),
                  (2, 7, 10);
                  
select count(*) from clients;                  
select * from clients c, orders o where c.idClient = idOrderClient;                  
                  
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;          
select concat (Fname,' ' ,Lname) as Client , idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;  


 insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
                    (2, default, 'compra via aplicativo', null, 1);
        
          
  select * from clients c, orders o 
           where c.idClient = idOrderClient
           group by idOrder;
                  
                  
  select * from clients left outer join orders on idClient = idOrderClient;
  
  select * from clients c inner join orders o on c.idClient = o.idOrderClient
                          inner join productOrder p on p.idPOorder = o.idOrder;
 
 -- Recuperar quantos pedidos foram realizados pelos clientes 
 select c.idClient, Fname, count(*) as Number_of_orders from clients c inner join orders o on c.idClient = o.idOrderClient
                          inner join productOrder p on p.idPOorder = o.idOrder
                          group by idClient;
                          
                          
                                                   
                          
                   
 