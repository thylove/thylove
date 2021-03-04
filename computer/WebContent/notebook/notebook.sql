CREATE DATABASE notebook;

USE notebook;
DROP TABLE users;
DROP TABLE product;
DROP TABLE salesRecord;
DROP TABLE staff;
DROP TABLE store;
DROP TABLE transferRecord;


-- 用户表 实现用户登录
CREATE TABLE users(
	userID INT PRIMARY KEY auto_increment, 
	userName VARCHAR(20) UNIQUE NOT NULL, 
	userPwd VARCHAR(32) NOT NULL,  
	userType int NOT NULL,
	userImg VARCHAR(50) DEFAULT "",
	storeID INT
);
-- 修改表使得 用户类型只能选择 店长、收银、和库管
ALTER TABLE users ADD CONSTRAINT userType_check CHECK(userType in(1, 2, 3));

INSERT INTO users(userName, userPwd, userType, userImg)VALUES('thylove', '123456', 1, 'default1.jpg');

SELECT * FROM users;


CREATE TABLE product(
	proID INT PRIMARY KEY NOT NULL UNIQUE auto_increment,
	proName VARCHAR(20)  NOT NULL,
	proModel VARCHAR(20) NOT NULL,
	storageTime Datetime,
	proStatus TINYINT DEFAULT 1,
	proNum int NOT NULL,
	proImg VARCHAR(50) DEFAULT '1.jpg',
	proPrice int NOT NULL,
	storeID INT
);
SELECT * FROM product;

CREATE TABLE salesRecord(
	salesID INT PRIMARY KEY auto_increment NOT NULL,
	userID INT,
	userName VARCHAR(20)  NOT NULL,
	salesTime Datetime,
	proID INT NOT NULL,
	proName VARCHAR(20) NOT NULL,
	proModel VARCHAR(20) NOT NULL,
	proPrice int NOT NULL,
	storeID INT
);
SELECT * FROM salesRecord;


CREATE TABLE staff(
	staffID INT PRIMARY KEY auto_increment NOT NULL,
	staffName VARCHAR(20) NOT NULL,
	storeID INT	
);
SELECT * FROM staff;


CREATE TABLE store(
	storeID INT PRIMARY KEY auto_increment NOT NULL,
	shopowner VARCHAR(20) NOT NULL
);
SELECT * FROM store;


/*
	proName=HUAWEI&
	proModel=HUAWEI+MateBook+XPro&
	transferInID=&
	userName=thylove&
	transferOutID=1&
	proImg=b4e516c2ed7d25491614652929557.png
	日期
	单价
	*/

CREATE TABLE transferRecord(
	transferRecordID INT PRIMARY KEY auto_increment NOT NULL,
	transferInID INT NOT NULL,
	proID INT,
	proName VARCHAR(20)  NOT NULL,
	proModel VARCHAR(20) NOT NULL,
	proPrice int NOT NULL,
	proImg VARCHAR(50),
	storageTime Datetime,
	transferOutID INT NOT NULL,
	userName VARCHAR(20) NOT NULL
);

SELECT * FROM product;
SELECT * FROM transferRecord;









