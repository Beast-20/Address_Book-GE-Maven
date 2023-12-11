-- UC 1
CREATE DATABASE AddressBook_service;
USE AddressBook_service;

-- UC 2
CREATE TABLE IF NOT EXISTS AddressBook (
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(50)
);

-- UC 3
INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email)
VALUES 
    ('Himanshu', 'Agrawal', '123 GN', 'Amravati', 'Maharashtra', '444705', '7744940500', 'him@gmail.com'),
    ('John', 'DOE', '123 NewYork', 'NY', 'ABC', '123456', '7746545424', 'john@gmail.com'),
    ('Omkar','Bharitkar','Vavi Ves','Amravati','Maharshtra','444705','9896421780','om@gmail.com');

SELECT * FROM AddressBook;

-- UC 4
UPDATE AddressBook SET first_name = 'Him', email = 'himanshu@gmail.com'
WHERE first_name = 'Himanshu' AND last_name = 'Agrawal';

-- UC 5
DELETE FROM AddressBook WHERE first_name = 'John' AND last_name = 'DOE';

INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email)
VALUES ('Anil', 'Agarakar', '123 NewYork', 'NY', 'ABC', '123456', '7746545424', 'anil@gmail.com');

-- UC 6
SELECT * FROM AddressBook WHERE city='Amravati';

-- UC 7
SELECT City, State, COUNT(*) AS Size
FROM AddressBook
GROUP BY City, State;

-- UC 8
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
WHERE first_name='Himanshu' OR last_name='Bharitkar'; 

UPDATE AddressBook
SET name = first_name || ' ' || last_name,
    type = 'Friend' 
WHERE first_name='Anil'; 


SELECT * FROM AddressBook;

-- UC 10
SELECT type, COUNT(*) AS contact_count
FROM AddressBook
GROUP BY type;

-- UC11
INSERT INTO AddressBook (first_name, last_name, address, city, state, zip, phone_number, email, name, type)
VALUES ('Sunil', 'AB', '456 Street', 'DC', 'ABC', '123456', '1234567890', 'sunil@example.com', 'Sunil AB', 'Friend'),
       ('Sunil', 'AB', '456 Street', 'DC', 'ABC', '123456', '1234567890', 'sunil@example.com', 'Sunil AB', 'Family');

-- UC 12 (Doing Normalization)

CREATE TABLE persons(
    person_id INT NOT NULL auto_increment,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20),
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(200),
    PRIMARY KEY(person_id,email)
);

 
CREATE TABLE address(
   address_id INT NOT NULL auto_increment PRIMARY KEY,
   lane VARCHAR(50),
   city VARCHAR(50) NOT NULL,
   state VARCHAR(50) NOT NULL,
   zip_code INT NOT NULL
);


CREATE TABLE AddressBook_new(
  person_id INT NOT NULL,
  address_id INT NOT NULL,
  email VARCHAR(200),
  type VARCHAR(20),
  FOREIGN KEY(person_id) REFERENCES persons(person_id),
  FOREIGN KEY(address_id) REFERENCES address(address_id)
  -- DOUBT ABOUT HAVING person id as PRIMARY KEY
);

INSERT INTO persons (first_name, last_name, phone_number, email)
VALUES 
    ('Himanshu', 'Agrawal', '7744940500', 'him@gmail.com'),
    ('John', 'DOE', '7746545424', 'john@gmail.com'),
    ('Omkar', 'Bharitkar', '9896421780', 'om@gmail.com'),
    ('Anil', 'Agarakar', '7746545424', 'anil@gmail.com'),
    ('Sunil', 'AB', '1234567890', 'sunil@example.com');

INSERT INTO address (lane, city, state, zip_code)
VALUES 
    ('123 GN', 'Amravati', 'Maharashtra', 444705),
    ('123 NewYork', 'NY', 'ABC', 123456),
    ('Vavi Ves', 'Amravati', 'Maharashtra', 444705),
    ('123 NewYork', 'NY', 'ABC', 123456),
    ('456 Street', 'DC', 'ABC', 123456);
SELECT* FROM AddressBook_new;

INSERT INTO AddressBook_new (person_id, address_id, email, type)
VALUES 
    (1, 1, 'him@gmail.com', 'Family'),
    (2, 2, 'john@gmail.com', 'Family'),
    (3, 3, 'om@gmail.com', 'Friend'),
    (4, 4, 'anil@gmail.com', 'Friend'),
    (5, 5, 'sunil@example.com', 'Friend'),
    (5, 5, 'sunil@example.com', 'Family');

-- UC13 (Rechecking)

SELECT * FROM persons WHERE person_id in (SELECT person_id from AddressBook_new abn INNER JOIN address as ad on abn.address_id = ad.address_id WHERE city = 'Amravati');

SELECT * FROM persons WHERE person_id in (SELECT person_id from AddressBook_new abn INNER JOIN address as ad on abn.address_id = ad.address_id WHERE state = 'ABC');
    
SELECT * FROM persons WHERE person_id in (SELECT person_id from AddressBook_new abn INNER JOIN address as ad on abn.address_id = ad.address_id WHERE city = 'NY')
ORDER BY first_name asc;

SELECT TYPE,COUNT(TYPE) FROM Addressbook_new group by type;


 
 

       

