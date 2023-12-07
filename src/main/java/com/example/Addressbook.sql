--UC 1
CREATE DATABASE AddressBook_service;
USE AddressBook_service;

--UC 2
CREATE TABLE IF NOT EXISTS AddressBook (
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(20),
    state VARCHAR(20),
    zip INT,
    phone_number VARCHAR(15),
    email VARCHAR(50)
);

--UC 3
INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email)
VALUES 
    ('Himanshu', 'Agrawal', '123 GN', 'Amravati', 'Maharashtra', '444705', '7744940500', 'him@gmail.com'),
    ('John', 'DOE', '123 NewYork', 'NY', 'ABC', '123456', '7746545424', 'john@gmail.com');

SELECT * FROM AddressBook;

--UC 4
UPDATE AddressBook SET first_name = 'Him', email = 'himanshu@gmail.com'
WHERE first_name = 'Himanshu' AND last_name = 'Agrawal';

--UC 5
DELETE FROM AddressBook WHERE first_name = 'John' AND last_name = 'DOE';

--UC 6
SELECT * FROM AddressBook WHERE city='Amravati' OR state='ABC';

--UC 7
SELECT City, State, COUNT(*) AS Size
FROM AddressBook
GROUP BY City, State;

--UC 8
SELECT *
FROM AddressBook
WHERE city = 'Amravati'
ORDER BY first_name, last_name;

-- UC 9
ALTER TABLE AddressBook
ADD COLUMN name VARCHAR(100);

ALTER TABLE AddressBook
ADD COLUMN type VARCHAR(20);


UPDATE AddressBook
SET name = first_name || ' ' || last_name,
    type = 'Family' 
WHERE first_name='Himanshu'; 

UPDATE AddressBook
SET name = first_name || ' ' || last_name,
    type = 'Friend' 
WHERE first_name='John'; 


SELECT * FROM AddressBook;

-- UC 10
SELECT type, COUNT(*) AS contact_count
FROM AddressBook
GROUP BY type;

--UC11
INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email, name, type)
VALUES ('Sunil', 'AB', '456 Street', 'DC', 'ABC', '123456', '1234567890', 'sunil@example.com', 'Sunil AB', 'Friend'),
       ('Sunil', 'AB', '456 Street', 'DC', 'ABC', '123456', '1234567890', 'sunil@example.com', 'Sunil AB', 'Family');
