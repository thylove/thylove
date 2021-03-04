DROP TABLE usertable

create database bookstroe;

create table usertable(
	userId int primary key not null unique auto_increment,
	username varchar(20) unique not null, 
	pwd varchar(32) not null, 
	sex char(2) not null, 
	aliasname varchar(20), 
	email varchar(20),
	picture varchar(50)
);
-- 修改表的编码集
ALTER TABLE usertable CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci; 
insert into usertable (username, pwd, sex, aliasname, email, picture) values('thylove','123456','男','thylove','93787944@qq.com','img/p21.png');
select * from usertable

select * FROM usertable

CREATE USER 'test'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON bookstore.user TO 'test'@'localhost';
flush privileges;
