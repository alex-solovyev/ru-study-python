DROP TABLE IF EXISTS regions CASCADE;
CREATE TABLE regions (
  id serial PRIMARY KEY,
  name varchar
);

INSERT INTO regions VALUES (1, 'Region 1');
INSERT INTO regions VALUES (2, 'Region 2');

DROP TABLE IF EXISTS locations CASCADE;
CREATE TABLE locations (
  id serial PRIMARY KEY,
  address varchar,
  region_id integer
);

INSERT INTO locations VALUES (1, 'Location 1 (Region 1)', 1);
INSERT INTO locations VALUES (2, 'Location 2 (Region 1)', 1);
INSERT INTO locations VALUES (3, 'Location 3 (Region 2)', 2);

DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
  id serial PRIMARY KEY,
  name varchar,
  location_id integer,
  manager_id integer
);

INSERT INTO departments VALUES (1, 'Department 1 (Location 1)', 1, 1);
INSERT INTO departments VALUES (2, 'Department 2 (Location 1)', 1, 2);
INSERT INTO departments VALUES (3, 'Department 3 (Location 2)', 2, 3);
INSERT INTO departments VALUES (4, 'Department 4 (Location 3)', 3, 4);


DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
  id serial PRIMARY KEY,
  name varchar,
  last_name varchar,
  hire_date date,
  salary integer,
  email varchar,
  manager_id integer,
  department_id integer
);

INSERT INTO employees VALUES (1, 'Francesco', 'Rios', '2020-01-01', 5000, 'francesco.rios@dualbootpartners.com', NULL, 1);
INSERT INTO employees VALUES (2, 'Maisha', 'Pratt', '2020-06-01', 4500, 'maisha.pratt@dualbootpartners.com', NULL, 1);
INSERT INTO employees VALUES (3, 'Chad', 'Maldonado', '2021-01-01', 5000, 'chad.maldonado@dualbootpartners.com', NULL, 2);
INSERT INTO employees VALUES (4, 'Wilson', 'Johns', '2021-01-01', 5000, 'wilson.johns@dualbootpartners.com', NULL, 3);
INSERT INTO employees VALUES (5, 'Khalil', 'Christianson', '2022-01-01', 5000, 'khalil.christianson.@dualbootpartners.com', NULL, 4);
INSERT INTO employees VALUES (6, 'Zaki', 'French', '2020-03-11', 4000, 'zaki.french@dualbootpartners.com', 1, 1);
INSERT INTO employees VALUES (7, 'Sean', 'Terrell', '2021-05-21', 2000, 'sean.terrell@gmail.com', 1, 1);
INSERT INTO employees VALUES (8, 'Karl', 'Higgins', CURRENT_DATE - 25, 1000, NULL, 2, 1);
INSERT INTO employees VALUES (9, 'Ana', 'Velasquez', '2022-07-06', 2000, 'ana.velasquez@gmail.com', 3, 2);
INSERT INTO employees VALUES (10, 'Daisie', 'Oconnor', '2022-06-13', 3000, 'daisie.oconnor@dualbootpartners.com', 3, 2);
INSERT INTO employees VALUES (11, 'Keiran', 'Berg', '2022-05-08', 4000, 'keiran.berg@dualbootpartners.com', 4, 3);
INSERT INTO employees VALUES (12, 'Jasmine', 'Walters', '2022-04-22', 5000, 'jasmine.walters@dualbootpartners.com', 4, 3);
INSERT INTO employees VALUES (13, 'Callum', 'Gonzalez', '2022-03-24', 2000, 'callum.gonzalez@dualbootpartners.com', 5, 4);
INSERT INTO employees VALUES (14, 'Travis', 'Ochoa', '2022-02-07', 3000, 'travis.ochoa@dualbootpartners.com', 5, 4);

ALTER TABLE locations ADD FOREIGN KEY (region_id) REFERENCES regions(id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations(id);
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees(id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(id);
