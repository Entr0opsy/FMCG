show databases;
create database project;
use project;
create table brand(brand_id int primary key, brand_name varchar(40) not null);
create table category(category_id int primary key,category_name varchar(40) not null );
create table stores(store_id int primary key, store_name varchar(40) not null,store_contact varchar(11) not null, store_email varchar(45) not null, store_city varchar(40) not null, store_street varchar(40) not null, store_zipcode varchar(40) not null);
create table customer(customer_id int primary key,customer_firstName varchar(40) not null,customer_lastName varchar(40) not null, customer_gender varchar(10) not null,customer_age int not null,customer_phone varchar(11) not null,customer_email varchar(45) not null, customer_address_id int not null);
create table customer_address(customer_address_id int primary key,customer_street varchar(40) not null,customer_city varchar(40) not null, customer_zipcode varchar(40) not null);
alter table customer add FOREIGN KEY (customer_address_id) REFERENCES customer_address(customer_address_id);
create table supplier(supplier_id int primary key,supplier_firstName varchar(40) not null,supplier_lastName varchar(40) not null,supplier_contact varchar(11) not null,supplier_email varchar(40) not null);
create table rating(rating_id int primary key,customer_id int ,supplier_id int,rate int);
alter table rating add foreign key (customer_id) references customer(customer_id);
alter table rating add foreign key (supplier_id) references supplier(supplier_id);
create table products(product_id int primary key,product_name varchar(40) not null,category_id int not null ,brand_id int not null,store_id int not null);
alter table products add foreign key (category_id) references category(category_id);
alter table products add foreign key (brand_id) references brand(brand_id);
alter table products add foreign key (store_id) references stores(store_id);
create table orders(order_id int primary key,customer_id int not null,order_date date ,store_id int not null,product_id int not null, price double not null,quantity int not null);
alter table orders add foreign key (customer_id) references customer(customer_id);
alter table orders add foreign key (store_id) references stores(store_id);
alter table orders add foreign key (product_id) references products(product_id);
create table delivery(delivery_id int primary key,customer_id int not null,shipped_date date not null,supplier_id int not null,deliver_status varchar(20) not null,order_id int not null);
alter table delivery add foreign key (customer_id) references customer(customer_id);
alter table delivery add foreign key (supplier_id) references supplier(supplier_id);
alter table delivery add foreign key(order_id) references orders(order_id);
Create table Billing (Bill_ID int NOT NULL,customer_id INT NOT NULL,order_id INT NOT NULL,Total_Amount INT NOT NULL,Payment_Mode VARCHAR(45),
       PRIMARY KEY (Bill_ID),FOREIGN KEY (customer_ID) REFERENCES customer(customer_id),FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
Create table Suppliers_feedback (Supplier_Feedback_ID INT NOT NULL,supplier_id INT ,customer_id INT not null,Customer_Rating INT NOT NULL,PRIMARY KEY (Supplier_Feedback_ID),
       FOREIGN KEY(supplier_id) references supplier(supplier_id)
);

insert into brand value(1,"cadberi");
insert into brand values(2,"johnson"), (3,"maybeline"), (4,"vita"),(5,"coca_cola"),(6,"thumbs up"),(7,"sprit"),(8,"tata"),(9,"ashirwad");
insert into category values(1,"beauty") , (2,"baby care"),(3,"household"),(4,"fruits and vegetable"),(5,"dairy products"),(6,"beverages"),(7,"food and grains");
insert into stores values(1231,"bk1","1200299","asnjdni@gmail.com","2nd layout","banglore","123444"),(123,"bk2","12002209","asfnnri@gmail.com","20 cross","delhi","123124"),(112,"bk3","12001234","dknfkji@gmail.com","4th lane","gurugram","123126");
insert into products values(1,"lipstick",1,3,1231),(2,"coldrink",6,5,123),(7,"lipstick",1,3,123),(8,"coldrink",6,5,123),(3,"wheat",7,9,1231),(4,"coldrink",6,7,1231),(5,"tea",7,8,1231),(6,"milk",5,4,1231),(9,"wheat",7,9,123),(10,"coldrink",6,7,123),(11,"tea",7,8,123),(12,"milk",5,4,123),(13,"wheat",7,9,112),(14,"coldrink",6,7,112),(15,"tea",7,8,112),(16,"milk",5,4,112);
insert into customer_address values(1,"3rd cross","banglore","123444"),(2,"gali no 30","gurugram","123124"),(3,"2nd main","delhi","123124"),(4,"vasant","gurugram","123126"),(5,"5th main","banglore","123444");

insert into customer values(1,"vijay","gupta","male",18,"1290838","anskjnkjd@gamil.com",1),(2,"renu","mourya","female",32,"1008098","renumourya@gmail.com",4),(14,"neetu","rajput","female",20,"9838972","rajputneetu@yahoo.com",5),(16,"mayank","aggarwal","male",40,"9098997","aggmayank@gmail.com",2);
insert into orders values(12,1,"2020-05-07",1231,2,20.00,10),(13,2,"2020-06-03",123,3,250.25,2),(16,14,"2020-06-03",1231,2,40.00,3),(18,16,"2020-05-02",123,3,325.05,5),(4,1,"2019-04-06",112,3,500.00,5);
insert into supplier values(11,"sanjay","dhar","95488658","dhar.sanjay@gmail.com"),(22,"apporav","mishra","92328478","misaprov@gmail.com"),(33,"ashu","singh","88892999","singh2ashu@gmail.com");
insert into rating values(1,1,22,3),(2,1,11,4),(3,2,22,4),(4,14,11,4),(5,16,33,5);
update orders set product_id =2 where order_id =4;
alter table brand modify brand_name varchar(40) null;
insert into brand values(10,null),(11,null),(12,null);
insert into products values(17,"fruits",4,10,112),(18,"dhai",5,11,112);
insert into stores values(134,"bk4","98907999","amkdhk@gmail.com","patel nagar","ahmdebad","276899"),(143,"bk5","927398389","sjkdoijd@gmail.com","mandi","surat","01829802");
insert into customer_address values(6,"sector-28","ahmedabad","238974"),(7,"model town","surat","973949");
insert into customer values(3,"jay","verma","male",32,"98929379","verma.jay@gmail.com",6),(10,"sneha","gulati","female",55,"29730300","gul.snha@gmail.com",7);
insert into orders values(5,3,'2020-03-04',112,17,25,2),(6,10,'2020-05-21',112,17,25,5),(7,10,'2020-05-21',112,18,60,5);
insert into orders values(21,14,'205-03-31',123,18,25,1),(22,2,'1029-03-19',123,18,60,1);
alter table customer_address add column zone varchar(20) not null;
update customer_address set zone = "red" where customer_address_id IN (1,4,5);
update customer_address set zone = "orange" where customer_address_id IN (2,6);
update customer_address set zone = "green" where customer_address_id IN (3,7);
use project;

create view q1 as select s.store_street,o.product_id, sum(o.quantity) as total from orders o join stores s on (o.store_id = s.store_id) group by o.store_id ,o.product_id;
create view brandname as select p.product_id, p.brand_id,p.product_name ,b.brand_name from products p join brand b on (p.brand_id = b.brand_id) where b.brand_name is not null;
create view regionWiseBrand as select q.store_street,r.brand_name from q1 q join brandname r on (q.product_id = r.product_id );
select * from regionWiseBrand;


create view maxproQuan as select c.customer_id,product_id,max(quantity) from orders o join customer c where  c.customer_id = o.customer_id group by c.customer_id;
create view cateproduct as select a.customer_id,a.product_id,b.category_id from maxproQuan a join products b where a.product_id = b.product_id;
create view categorylist as select a.category_name,b.customer_id from category a join cateproduct b on a.category_id = b.category_id;
create view ans2 as select distinct(a.category_name) from categorylist a join customer b on a.customer_id = b.customer_id where b.customer_age > 20 ;
select * from ans2;


create view mapping as select a.store_id,a.product_id,b.brand_id from orders a join products b on a.product_id = b.product_id;
create view countnullbrand1 as select distinct a1.store_id,count(*) as nullbrandorder from  mapping  a1 join brand b1 on a1.brand_id = b1.brand_id  where b1.brand_name is null group by a1.store_id;
create view storelocation as select s.store_street,s.store_city,u.nullbrandorder from stores s join countnullbrand1 u on s.store_id =u.store_id;
select * from  storelocation;


create table customerzone as select c.customer_id ,ca.zone from customer c join customer_address ca on (c.customer_address_id = ca.customer_address_id);
create table order_count as select cz.zone, count(*) as total_order from orders o join customerzone cz on (o.customer_id = cz.customer_id) group by cz.zone;
select * from order_count;


create view redzonearea as select customer_id from customerzone where zone = "red";
create view listOfproduct as select cr.category_id from orders pr join redzonearea ar on (ar.customer_id = pr.customer_id) join products cr on (pr.product_id = cr.product_id);
create view categoryListZonewise as select distinct(category_name) from category ca join listOfproduct l on (ca.category_id = l.category_id);
select * from categoryListZonewise;
use project;
select * from orders;
describe orders;