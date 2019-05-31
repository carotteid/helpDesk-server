DROP DATABASE IF EXISTS helpDesk;
CREATE DATABASE helpDesk;
USE helpDesk;

CREATE TABLE company
(
 	company_id INT NOT NULL AUTO_INCREMENT PRIMARY_KEY,
 	name NVARCHAR(15) NOT NULL,
 	address NVARCHAR(50) NOT NULL,
	postal_code NVARCHAR(10) NOT NULL,
	city NVARCHAR(20) NOT NULL,
	state NVARCHAR(20) NOT NULL,
	country NVARCHAR(30) NOT NULL,
 	phone NVARCHAR(14) NOT NULL,
 	email NVARCHAR(50) NOT NULL,
 	web NVARCHAR (50) NOT NULL
);
INSERT INTO company VALUES('Lab', 'Napoleón 180, Vallarta Norte', '44690', 'Guadalajara', 'Jalisco', 'México', '(553)-244-8950', 'karo@gmail.com', 'www.lab.com.mx');
INSERT INTO company VALUES('Morel', 'Quinta Mayor 93, La Villa', '66509', 'Hermosillo', 'Sonora', 'México', '(553)-244-8950', 'morel@gmail.com', 'www.morel.mx');
INSERT INTO company VALUES('HelpDesk', 'Bahia Azul 42, Arboleadas', '55410', 'Salamanca', 'Guanajuato', 'México', '(464)-125-7845', 'hola@helpdesk.com', 'www.helpdesk.mx');
INSERT INTO company VALUES('Games++', 'Plaza Santa María, Villa', '12405', 'Valle Mat-Su', 'Alaska', 'Estados Unidos', '(464)-125-7845', 'inf@gamesplusplus.us', 'www.gamesplusplus.us');

CREATE TABLE department
(
	department_id INT NOT NULL AUTO_INCREMENT PRIMARY_KEY,
	name NVARCHAR(20) NOT NULL,
	priority INT NOT NULL
);
INSERT INTO department VALUES('IT', 1);
INSERT INTO department VALUES('Redes', 2);
INSERT INTO department VALUES('Hardware', 2);
INSERT INTO department VALUES('Software', 1);
INSERT INTO department VALUES('Compras', 3);
INSERT INTO department VALUES('RH', 3);
INSERT INTO department VALUES('Ingeniería', 4);
INSERT INTO department VALUES('Comunicaciones', 5);
INSERT INTO department VALUES('Contabilidad', 6);
INSERT INTO department VALUES('Administración', 6);
INSERT INTO department VALUES('Marketing', 7);

CREATE TABLE users
(
 	user_id INT  NOT NULL AUTO_INCREMENT PRIMARY_KEY,
 	name NVARCHAR(15) NOT NULL,
 	last_name NVARCHAR(15) NOT NULL,
 	company_id INT NOT NULL REFERENCES company(company_id),
 	department_id INT NOT NULL REFERENCES department(department_id),
 	email NVARCHAR (50) NOT NULL,
 	phone NVARCHAR(14) NOT NULL,
 	user_name NVARCHAR(15) NOT NULL,
 	password NVARCHAR(15) NOT NULL,
 	admin INT NOT NULL
);
INSERT INTO users VALUES('Idalid', 'Avila', 3, 1, 'id@helpdesk.com', '(462)-103-8018', 'idavila', 'HoliCrayoli01', 1);
INSERT INTO users VALUES('Carolina', 'Aguirre', 3, 3, 'caro@helpdesk.com', '(464)-646-2560', 'caroaguirre', 'expensive05', 1);
INSERT INTO users VALUES('Emmanuel', 'Gallardo', 3, 2, 'ma@helpdesk.com', '(464)-100-4109', 'gallardo', 'maguito', 1);
INSERT INTO users VALUES('Karolina', 'Zepeda', 1, 11, 'kazco96@gmail.com', '(553)-244-8950', 'kzepeda', '260596', 0);
INSERT INTO users VALUES('Cynthia', 'Cota', 2, 11, 'cynthia@gmail.com', '(662)-133-6873', 'ccota', '260596', 0);
INSERT INTO users VALUES('Ricardo', 'Barroso', 4, 5, 'ricardo@gmail.com', '(462)-178-0232', 'barroso', 'barroso02', 0);

CREATE TABLE ticket 
(
	ticket_id INT NOT NULL AUTO_INCREMENT PRIMARY_KEY,
	title NVARCHAR(15) NOT NULL,
	descr NVARCHAR(100) NOT NULL,
	priority INT NOT NULL,
	evidence NVARCHAR(200) NOT NULL,
	category NVARCHAR(50) NOT NULL,
	user_id INT NOT NULL REFERENCES users(user_id),
	status INT NOT NULL,
	date_time DATETIME NOT NULL,
	department NVARCHAR(15) NOT NULL,
	manager INT NOT NULL
);

CREATE TABLE monitor
(
	monitor_id INT NOT NULL PRIMARY_KEY AUTO_INCREMENT,
	ticket_id INT NOT NULL REFERENCES ticket(ticket_id),
	descr NVARCHAR(100) NOT NULL,
	date_time DATETIME NOT NULL
);

CREATE TABLE advise
(
	advise_id  INT NOT NULL PRIMARY_KEY AUTO_INCREMENT,
	name NVARCHAR(15) NOT NULL,
	descr NVARCHAR(100)NOT NULL,
	date_start DATETIME NOT NULL ,
	date_finish DATETIME NOT NULL	
);