USE pandemic;

CREATE TABLE countries(
id INT PRIMARY KEY AUTO_INCREMENT,
code VARCHAR(8) UNIQUE,
country VARCHAR(32) NOT NULL UNIQUE
);

INSERT INTO countries (code, country)
SELECT DISTINCT code, entity FROM infectious_cases;

CREATE TABLE cases_normalized
AS SELECT * FROM infectious_cases;

ALTER TABLE cases_normalized
ADD id INT PRIMARY KEY AUTO_INCREMENT FIRST,
ADD country_id INT AFTER id,
ADD CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES countries(id);

UPDATE cases_normalized i
JOIN countries c ON i.code = c.code AND i.entity = c.country
SET i.country_id = c.id
WHERE i.id > 0;

ALTER TABLE cases_normalized
DROP COLUMN entity,
DROP COLUMN code;

SELECT * FROM cases_normalized;
