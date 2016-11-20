								/*http://2sql.ru/*/
								#SELECT
CREATE TABLE IF NOT EXISTS Planets (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	PlanetName VARCHAR(30),
	Radius INT,
	SunSeason FLOAT,
	OpeningYear INT,
	HavingRings VARCHAR(10) NOT NULL,
	Opener VARCHAR(255)
);

INSERT INTO Planets(ID, PlanetName, Radius, SunSeason, OpeningYear, HavingRings, Opener) VALUES
(NULL, 'Mars', 3396, 687, 1959, 'No', 'Christiaan Huygens'),
(NULL, 'Saturn', 60268, 10759.22, 8547, 'Yes', ''),
(NULL, 'Neptune', 24764, 60190, 1846, 'Yes', 'John Couch Adams'),
(NULL, 'Mercury', 2439, 115.88, 1631, 'No', 'Nicolaus Copernicus'),
(NULL, 'Venus', 6051, 243, 1610, 'No', 'Galileo Galileo');

SELECT DISTINCT HavingRings FROM Planets;
DISTINCT - Вывдит уникальные значения поля

/*************************************************************************************************/

CREATE TABLE IF NOT EXISTS Artists (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Singer VARCHAR(50),
	Album VARCHAR(100),
	`Year` INT,
	Sale INT
);

INSERT INTO Artists (Singer, Album, `Year`, Sale) VALUES
('The Produgy', 'Invaders Must Die', 2008, 1200000),
('Drowning Pool', 'Sinner', 2001, 400000),
('Massive Attack', 'Messanine', 1998, 2300000),
('The Prodigy', 'Fat of the Land', 1997, 600000),
('The Prodigy', 'Music For The Jilted Generation', 1994, 1500000),
('Massive Attack', '100th Window', 2003, 1200000),
('Drowning Pool', 'Full Circle', 2007, 800000),
('Massive Attack', 'Danny The Dog', 2004, 1900000),
('Drowning Pool', 'Resilience', 2013, 500000);

SELECT DISTINCT Singer FROM Artists;
/**************************************************************************************/

/*INNER JOIN*/
CREATE TABLE IF NOT EXISTS Authors (
	AuthorID INT PRIMARY KEY AUTO_INCREMENT,
	AuthorName VARCHAR(50)
);
INSERT INTO Authors (AuthorName) VALUES
('Bruce Eckel'),
('Robert Lafore'),
('Andrew Tanenbaum');


CREATE TABLE IF NOT EXISTS Books (
	BookID INT,
	BookName VARCHAR(50)
);
INSERT INTO Books (BookID, BookName) VALUES
(3, 'Modern Operating System'),
(1, 'Thinking in Java'),
(3, 'Computer Architecture'),
(4, 'Programming in Scala');

Имзенение имя таблицы: RENAME TABLE имя_таблицы TO новое_имя_таблицы

SELECT * FROM Authors INNER JOIN Books
ON Authors.AuthorID = Books.BookID;
/**************************************************************************************/

/*LEFT JOIN*/
/*
	Оператор SQL LEFT JOIN

Оператор SQL LEFT JOIN осуществляет формирование таблицы из записей двух или нескольких таблиц. В операторе SQL LEFT JOIN, как и в операторе SQL RIGHT JOIN, важен порядок следования таблиц, так как от этого будет зависеть полученный результат. Алгоритм работы оператора следующий:

    Сначала происходит формирование таблицы внутренним соединением (оператор SQL INNER JOIN) левой и правой таблиц
    Затем, в результат добавляются записи левой таблицы не вошедшие в результат формирования таблицы внутренним соединением. Для них, соответствующие записи из правой таблицы заполняются значениями NULL.

*/
SELECT * FROM Authors LEFT JOIN Books
ON Authors.AuthorID = Books.BookID;

/*****************************************************************************/

SELECT u.id, u.name, d.name AS d_name FROM users u
INNER JOIN departments d ON u.d_id = d.id

/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
										/*SELECT, LIMIT*/
SELECT firstname
FROM supertable
LIMIT 5;	#всегда будет возвращатся первая запись из таблицы supertable

SELECT firstname
FROM supertable
LIMIT 5;	#всегда будет возвращатся пять записей из таблицы supertable
-----------------------------------------------------------
SELECT firstname
FROM supertable
ORDER BY 1 DESC
LIMIT 1;	#вытащим самую последнюю запись из таблицы supertable

SELECT firstname
FROM supertable
ORDER BY 1 DESC
LIMIT 3;	#вытащим три последних записи из таблицы supertable

SELECT firstname
FROM supertable
ORDER BY RAND()
LIMIT 3;	#вытащим случайных трех записи
-----------------------------------------------------------
SELECT firstname
FROM supertable
ORDER BY RAND()
LIMIT 3, 5;		#вытащим начиная с третей, пять записей

SELECT id, firstname
FROM supertable
ORDER BY RAND()
LIMIT 10, 5;
-----------------------------------------------------------
ДЛЯ ПАГИНАЦИИ ПО СТРАНИЦАМ ПРИМЕР:
SELECT id, firstname
FROM supertable
LIMIT 0, 5;		#будет на странице выводится только 5 номера пагинаций
-----------------------------------------------------------
Такое использование LIMIT 0, 5 с двумя числами обычно приводят к серьёзнейшим тормазам при большом кол-ве записей в  нашей БД. Что же тогда делать? а делат нужно вот что:
SELECT id, firstname
FROM supertable
LIMIT 5 OFFSET 10;	#это значить 5 записей показать и пропустить 10
Этот запрос работает гораздо быстрей чем с LIMIT

----------------------------------------------------------------------------

SELECT 3 + 5; #будет 8 ;-)
-------------------------------------------------------
SELECT * FROM supertable;
-------------------------------------------------------
SELECT id, firstname FROM supertable; #нам нужны только пол¤ id и firstname
-------------------------------------------------------
SELECT id as 'є', firstname as '»м¤' FROM supertable; #поле id изме нитс¤ на є, а поле firstname на '»м¤'
SELECT id as 'є', firstname as '»м¤' FROM supertable; #тоже самое получетс¤, только без as
-------------------------------------------------------
SELECT id, firstname, bd
FROM supertable
ORDER BY id;	#отсортеруетс¤ по id

SELECT id, firstname, bd
FROM supertable
ORDER BY id DESC;

SELECT id, firstname, bd
FROM supertable
ORDER BY bd DESC;
-------------------------------------------------------
SELECT id, firstname, bd
FROM supertable
ORDER BY bd DESC, firstname DESC;	#отсортируетс¤ по bd и firstname

SELECT id, firstname, bd
FROM supertable
ORDER BY RAND();
-------------------------------------------------------
SELECT id, firstname, bd
FROM supertable
ORDER BY 1;	#сортировка произведетс¤ по первому столбцу

/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
							/*ЛОГИРОВАНИЕ, ПОЛЕЗНЫЕ КОМАНДЫ, ОБЪЯСНЕНИЯ*/
После того как установили MySql нам нужно прописать в переменных средах вот такой путь:
C:\Program Files\MySQL\MySQL Server 5.7\bin

И вот по такому пути C:\Program Files\MySQL\MySQL Server 5.7 будет файл my-default.ini, в него нужно зайти и на 6-й строчки прописать вот так [mysql]. Сохранить. Выйти. И этот файл my-default.ini нужно переименовать в my.ini и все должно работать....

\r #перегрузка сессии

Вот первые команды:
mysql -uroot -ppassword

Чтобы выйти из mysql, вот несколько команд:
\q or quit or exit

Чтобы при вводе небыло видно пароля, нужно написать вот так:
mysql -uroot -p и Enter, а дальше появится поля с вводом пароля
---------------------------------------------------------------------------
								Логирование
\T C:/log/mysql.log	#на диске С в папке log создастся файл mysql.log и там будут вестись логи
----------------------------------------------------------------------
Разрабатывать можно не в консоле а в notepad++, т.е. мы пишем команды в блокноте, и чтобы из консоли добратся до этих команд мы можем написать команду:
\. C:/mysql/first.sql	#путь может быть любой и имена разные могут быть
--------------------------------------------------------------------------
							Еще полезные команды.
\s	#Статус сервера
SELECT user();	#можно посмотреть кто вы есть
SELECT database();	#с какой БД мы работаем сейчас
SHOW DATABASES;		#посмотреть все БД которые есть
\u mysql или use mysql;		#Выбрать БД для работы
SHOW TABLES;		#посмотреть все таблицы в выбранной БД
DESC имя_таблицы;		#просмотреть таблицу
SET NAMES cp866; 		#указывает кодировку с которой будем работать в консоли

/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
CRUD
CREATE READ UPDATE DELETE
INSERT SELECT UPDATE DELETE - основные операторы манипулирования данными

Создание баз данных
Удаление бады данных
Создание таблиц
Удаление таблиц
Модификация таблиц

			Создание баз данных
CREATE DATABASE IF NOT EXISTS courses; 	#создасть БД courses
DROP DATABASE courses;	#удалить БД courses

CREATE DATABASE `super base`;	#можно создать имя базы с пробелом (но лучше так не делать)

SHOW DATABASES; 	#показывает все существующие БД

Просмотр warningов:
SHOW WARNINGS;		#покажет варнинги
или
\W

				Создание таблиц
USE superbase;	#используем БД superbase
CREATE TABLE supertable (
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL DEFAULT '',
	bd DATETIME
);

CREATE TABLE superuser
SELECT user, password FROM mysql.user;

#копирование структуры таблицы
CREATE TABLE simpletable LIKE supertable; #создаем таблицу simpletable точно такую как supertable

DESC simpletable; 	#просмотрим структуру таблицы simpletable

#изменение столбца
ALTER TABLE supertable
CHANGE name firstname VARCHAR(40) DEFAULT 'Вася',
MODIFY bd DATE;
Мы здесь выбрали таблицу supertable изменили ей имя поля name на firstname и этому же полу присвоили значение по умолчанию 'Вася', а так же поле bd сделали тип DATE(до этого тип был datetime)
-------------------------------------------------------------------------------------------

#information_schema;

USE information_schema;

SHOW TABLES;

DESC tables;

SELECT TABLE_NAME,
COLUMN_NAME,
DATA_TYPE,
COLUMN_COMMENT
FROM COLUMNS
WHERE TABLE_SCHEMA = 'superbase'
AND TABLE_NAME = 'supertable';

#команда которая может пригодиться
SELECT engine FROM engines;
				
---------------------------------------------------------------------------------

								ИНДЕКСЫ			
Индексоми называются сортировка значений в полях, зарание до работы с нашей таблицей
 
 Создание index:
 USE superbase;
 
 DESC supertable;
 
 CREATE INDEX ixfirstname
 ON supertable(firstname);
 
--------------------------------------------------------------]
ВСТАВКА

INSERT INTO supertable
VALUES(1, 'Иван Иванов', '1980-01-01');

INSERT INTO supertable
VALUES(NULL, 'Ратов Клирилл', '1984-07-03');

INSERT INTO supertable (firstname, bd)
VALUES('Соловьевв Клирилл', '1974-03-09');

SELECT * FROM supertable;
				
INSERT INTO supertable
SELECT user, NOW() FROM mysql.user;


LOAD DATA INFILE 'C:/log/users.csv' REPLACE
INTO TABLE supertable
FIELDS
TERMINATED BY ';'
LINES
TERMINATED BY '\r\n';
-------------------------------------------------

#Delete	
DELETE FROM supertable
WHERE id > 4 and id < 8;	#удалит

DELETE FROM supertable
WHERE id BETWEEN 5 and 7;
---------------------------------------------------------------
Оператор UPDATE - обновление данных

UPDATE supertable
SET firstname = "Супермен Кентович-Янкович"
WHERE firstname LIKE 'Соловьевв%';
--------------------------------------------------------------------
Создание таблицы. Пример.
CREATE TABLE books(
	id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR (200) NOT NULL,
	author VARCHAR (200) NOT NULL,
	isbn VARCHAR(22),
	publisher VARCHAR(40),
	pages SMALLINT,
	weight SMALLINT,
	cover ENUM("","мягкая","твёрдая"),
	pub YEAR,
	electronic VARCHAR(20)
) ENGINE InnoDB;

Загрузите данные в таблицу базы
a. Проверьте разделители запроса загрузки
LOAD DATA LOCAL
INFILE 'C:/log/books.txt'
INTO TABLE books
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';
b. Выполните загрузку данных
c. Проверьте загруженные данные
---------------------------------------------------------------------
СОЗДАНИЕ И УДАЛЕНИЕ СОБЫТИЙ
USE superbase;

CREATE EVENT superbattle
ON SCHEDULE EVERY 10 SECOND
DO INSERT INTO supertable(firstname, bd)
VALUES(RAND(), NOW());

#включение планировщика расписания
SHOW VARIABLES LIKE '%schedule%';
SET GLOBAL event_scheduler = 1;

#отключить события
ALTER EVENT superbattle DISABLE;
-------------------------------------------------------------------
SHOW CREATE TABLE supertable;	
---------------------------------------------------------------
USE superbase;
SELECT EVENT_SCHEMA, EVENT_NAME, DEFINER, STATUS
FROM information_schema.EVENTS
WHERE EVENT_NAME = 'superbattle';				
				
				
				
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////			
/***********************************************************************/			
				
				
				
				
				
				
CREATE TABLE classes (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL DEFAULT '',
	roomNumber smallint NULL
);		
				
INSERT INTO classes(name, roomNumber) VALUES('1-A', 114);				

INSERT INTO classes(name, roomNumber) VALUES 
('3-A', 314),
('10-A', 402),
('10-Б', 404),
('11-A', 408),
('11-Б', 412);
			
UPDATE classes SET roomNumber = 150 WHERE id = 7;

UPDATE classes SET roomNumber = 200 WHERE roomNumber = 117;
				
UPDATE classes SET roomNumber = 000 WHERE roomNumber LIKE '1%';

DELETE FROM classes WHERE id = 4;
				
				
INSERT INTO classes(name, roomNumber) VALUES 
('1-A', 101),
('1-Б', 102),
('1-В', 103),
('2-A', 201),
('2-Б', 202),
('2-B', 203),
('3-A', 301),
('3-Б', 302),
('3-B', 303),
('4-A', 401),
('4-Б', 402),
('4-B', 403),
('5-A', 501),
('5-Б', 502),
('5-B', 503),
('6-Б', 601),
('6-B', 602),
('7-A', 701),
('7-Б', 702),
('7-B', 703),
('8-A', 801),
('8-Б', 802),
('8-B', 803),
('9-A', 901),
('9-Б', 902),
('9-B', 903),
('10-A', 1001),
('10-Б', 1002),
('10-B', 1003);
				


SELECT name, roomNumber FROM classes WHERE name LIKE '1%';

SELECT name, roomNumber FROM classes ORDER BY name;

SELECT name, roomNumber FROM classes WHERE roomNumber > 100 ORDER BY name DESC;

SELECT name, roomNumber FROM classes WHERE roomNumber > 100 OR name LIKE '%Б';

SELECT name, roomNumber FROM classes WHERE roomNumber > 100 AND name LIKE '%Б';

SELECT name, roomNumber FROM classes WHERE NOT roomNumber > 200 AND name LIKE '%Б';

SELECT name, roomNumber FROM classes WHERE name IN ('1-A', '1-Б', '1-В');

SELECT name, roomNumber FROM classes WHERE name IN ('1-A', '1-Б', '1-В') ORDER BY name;


SELECT * FROM classes WHERE roomNumber BETWEEN 200 and 400;

SELECT DISTINCT roomNumber FROM classes;
DISTINCT - Отбрасывает повторяющиеся записи;

SELECT MAX(id) FROM classes; (минимальный id)
SELECT MIN(id) FROM classes; (максимальный id)
SELECT SUM(id) FROM classes; (суммируем все айдишники и получаем числовой результат)
SELECT COUNT(*) FROM classes; (считаем кол-во всех записей)
SELECT AVG(id) FROM classes; (среднее значение по полю id)
				


				БД из нескольких таблиц
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Для того чтобы переименовать таблицу из t1 в t2:
//mysql> ALTER TABLE t1 RENAME t2;				
//				
//Для того чтобы изменить тип столбца с INTEGER на TINYINT NOT NULL (оставляя имя прежним) и изменить тип столбца //b с CHAR(10) на CHAR(20) с переименованием его с b на c:
//mysql> ALTER TABLE t2 MODIFY a TINYINT NOT NULL, CHANGE b c CHAR(20);				
//				
//Для того чтобы добавить новый столбец TIMESTAMP с именем d:
//mysql> ALTER TABLE t2 ADD d TIMESTAMP;
//
//Для того чтобы добавить индекс к столбцу d и сделать столбец a первичным ключом:
//mysql> ALTER TABLE t2 ADD INDEX (d), ADD PRIMARY KEY (a);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
				
CREATE TABLE head (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	birthDay datetime NOT NULL
);					

ALTER TABLE classes ADD headId INT NULL; //Добавил столбец			

INSERT INTO head(name, birthDay) VALUES			
('Полторацкий Е.А.', '1958-07-17 17:18:55'),
('Миронова Л.А.', '1987-03-10 13:07:30'),
('Мартынюк С.Б.', '1964-11-24 10:40:33'),
('Кулимчук А.У.', '1978-10-01 23:18:17');
				
UPDATE classes SET headId = 1;

UPDATE classes SET headId = 3 WHERE id = 26;
				


SELECT classes.name, head.name FROM classes, head; //Получится не правлиьное соответствие
SELECT classes.name, head.name FROM classes, head WHERE classes.headId = head.id;

					//теперь тоже самое, только с JOIN
SELECT classes.name, head.name FROM classes JOIN head ON classes.headId = head.id;
classes JOIN head - таблицу classes объединяем с таблицей head

SELECT classes.name, head.name FROM classes JOIN head ON classes.headId = head.id WHERE classes.roomNumber < 300;

//Фильтруем запросы по второй таблице
SELECT classes.name, head.name FROM classes JOIN head ON classes.headId = head.id WHERE head.name LIKE '%ирон%';


//Конструкция JOIN - означает соединение по равенству


SELECT classes.name FROM classes WHERE classes.headId = (SELECT head.id FROM head WHERE head.name LIKE '%ирон%');



//ПРАВЫЙ И ЛЕВЫЙ JOIN
SELECT classes.name, head.name FROM classes LEFT JOIN head ON classes.headId = head.id;
LEFT JOIN - Выбирает все записи из левой таблицы;
RIGHT JOIN - Выбирает все записи из правой таблицы;

SELECT classes.name, head.name FROM classes LEFT JOIN head ON classes.headId = head.id WHERE classes.headId IS NOT NULL;
//IS NOT NULL - Проверка на NULL
SELECT classes.name, head.name FROM classes LEFT JOIN head ON classes.headId = head.id WHERE classes.headId IS NULL;

				//UNION

SELECT classes.name FROM classes UNION SELECT head.name FROM head;


SELECT COUNT(*) AS totalClassesOnFirstSecond FROM classes WHERE roomNumber < 300;




CREATE DATABASE IF NOT EXISTS dbtest;

CREATE TABLE IF NOT EXISTS dbtable (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL DEFAULT '',
	roomNumber smallint NULL
);



CREATE TABLE A (X INT);
CREATE TABLE B (X INT);

INSERT A VALUES (1), (2), (2), (3), (3);
INSERT B VALUES (2), (3), (4), (5), (NULL);

SELECT * FROM A;
SELECT * FROM B;

SELECT A.X AS X FROM A, B.X AS X FROM B FROM A INNER JOIN B ON A.X = B.X;
///////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE publishers (
	publisher_id INT AUTO_INCREMENT PRIMARY KEY,
	publisher_name VARCHAR(30) NOT NULL
);

INSERT INTO publishers VALUES
(NULL, 'Все книги'),
(NULL, 'Прокачай мозги'),
(NULL, 'Мир фантазий');

CREATE TABLE books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
	book_name VARCHAR(30) NOT NULL,
	publisher_id INT,
	FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

INSERT INTO books VALUES
(NULL, 'Магия и кровь', 3),
(NULL, 'Уникальная вселенная', NULL),
(NULL, 'Физика просто', 2),
(NULL, 'Рассказ о цветах', 1);

//CROSS JOIN
SELECT b.book_name, p.publisher_name FROM books b CROSS JOIN publishers p;

//Естественное соединение
SELECT b.book_name, p.publisher_name FROM books b NATURAL JOIN publishers p;

//INNER JOIN
SELECT b.book_name, p.publisher_name FROM books b INNER JOIN publishers p ON b. publisher_id = p.publisher_id;
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/
										/*WHERE*/
SELECT * FROM supertable
WHERE id = 23;	#выведит инфу из таблицы supertable, где id=23;

SELECT * FROM supertable
WHERE firstname LIKE 'Ратов%';	#выведит из таблицы supertable, где поле firstname начинается с 'Ратов'

SELECT * FROM supertable
WHERE id IN(12, 17, 20, 9, 7);	#выведит из таблицы supertable, где id с номером (12, 17, 20, 9, 7)

/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
										/*ВЫБОРКИ*/
Оператор SELECT используется для выборки данных из таблиц базы данных. Синтаксис оператора
описан на http://dev.mysql.com/doc/refman/5.6/en/select.html
1. Выполните простые выражения с оператором SELECT
	a. Выборка всех названий книг магазина
		SELECT title FROM books;
	b. Выборка всех названий книг с сортировкой по названию ORDER BY
		SELECT title FROM books ORDER BY title;
	c. Выборка всех названий книг и авторов, с сортировкой по автору ORDER BY 2
		SELECT title,author FROM books ORDER BY 2;
	d. Выбрать названия книг и издательств в случайном порядке
		SELECT title,publisher FROM books ORDER BY RAND();
	e. Выбрать название трех книг с сортировкой обратном алфавитном порядке
		SELECT title FROM books ORDER BY title DESC LIMIT 3;
	f. Выбрать три названия книги с годом издания, начиная с 2й позиции
		SELECT title FROM books ORDER BY title DESC LIMIT 2,3;
	g. Выберите последнюю книгу в списке
		SELECT title FROM books ORDER BY id DESC LIMIT 1;
2. Выполните выражения SELECT с предикатом WHERE
	a. Выберите книгу по названию автора
		SELECT title FROM books WHERE author = 'Поль Дюбуа'
	b. Выберите книги определенного издательства
		SELECT title FROM books WHERE publisher = 'Питер'
	c. Выберите все книги выпущенные в 2014 году с сортировкой по названию книги
		SELECT title,pub FROM books WHERE pub=2014 ORDER BY 1;
	d. Выберите всех авторов книг
		SELECT DISTINCT author FROM books;
	e. Найдите все продажи с ‘2013-05-02’ до ‘2013-06-09’
	f. Найдите все книги c количеством страниц в диапазоне от 1000 до 2000 BETWEEN
		SELECT LEFT(title,10) FROM books WHERE pages BETWEEN 1000 AND 2000;
	g. Найдите все книги, посвященные JavaScript LIKE
		SELECT title FROM books WHERE title LIKE '%JavaScript%';
	h. Выбрать все книги, авторы которых Поль Дюбуа или Мэт Зандстра IN
		SELECT title FROM books WHERE author IN ('Поль Дюбуа', 'Мэт Зандстра');
	i. Выбрать все записи о продажах книг, сделанные за последние 10 дней до текущего
3. Выполните выражения SELECT с агрегирующими функциями
	a. Найти количество наименований книг в магазине
		SELECT count(title) FROM books;
	b. Найти количество книг, написанных Дэвидом Макфарландом
		SELECT count(title) FROM books WHERE author LIKE '%Дэвид Макфарланд%'
	c. Найти количество страниц во всех книгах магазина
		SELECT SUM(pages) FROM books;
		
====================================================================================================================
====================================================================================================================
Продолжение изучения оператора SELECT
1. Выполните выражения SELECT сгруппировав их по отдельному полю/столбцу
	a. Найдите количество продаж по каждой книге
	SELECT id,title,sum(quantity) as rating
	FROM books INNER JOIN store
	ON books.id = store.books_id
	GROUP BY title
	ORDER BY rating DESC;
	SELECT id,title,sum(quantity) as rating
	FROM books,store,`order`
	WHERE status = 'выполнен'
	and order_idorder = idorder
	and books.id = store.books_id
	GROUP BY title
	ORDER BY rating DESC;
	b. Сгруппируйте продажи по году, месяцу и посмотрите суммы
	SELECT YEAR(time) as year, MONTH(time) as month, SUM(price)
	FROM `order`
	WHERE status IN ('выполнен','доставка')
	GROUP BY year, month WITH ROLLUP;
	c. Найдите всех покупателей, который оформили заказ более чем на 2100руб
	SELECT idconsumer,fio,price
	FROM consumer,`order`
	WHERE consumer_idconsumer = idconsumer
	HAVING price >= 2100;

/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
								/*ГРУППИРОВКА ДАННЫХ*/
USE superbase;
SELECT firstname, bd
fROM supertable
GROUP BY YEAR(bd);	//сгрупируются по году
------------------------------------------------------------
SELECT count(firstname), bd
FROM supertable
GROUP BY YEAR(bd);

SELECT count(firstname), YEAR(bd), MONTH(bd)
FROM supertable
GROUP BY YEAR(bd), MONTH(bd);
------------------------------------------------------------
USE world;
SELECT continent, region, count(name)
FROM country
GROUP BY continent, region;
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
							/*ПОДГОТОВЛЕННЫЕ ЗАПРОСЫ*/
Запрос:
PREPARE test FROM 'SELECT * FROM supertable WHERE id = ?';
Выполнение:
SET @user = 4;
EXECUTE test USING @user;
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
								/*ФУНКЦИИ-АГРЕГАЦИИ*/
USE world;
DESC country\G
DESC city;

SELECT avg(population) FROM city;
SELECT avg(lifeexpectancy) FROM country; //узнать среднюю продолжительность жизни

SELECT lifeexpectancy
FROM country
WHERE code = 'RUS';	//узнать среднюю продолжительность жизни в России
----------------------------------------------------------------------
SELECT count(name)
FROM city
WHERE countrycode = 'RUS'; //кол-во городов

SELECT count(name)
FROM city
WHERE countrycode = 'USA';

/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
/*************************************************************************************/
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/