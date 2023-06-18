-- Показать работников у которых нет почты или почта не в корпоративном домене (домен dualbootpartners.com)
SELECT
  name, last_name, email
FROM employees
WHERE
  email NOT LIKE '%@dualbootpartners.com'
  OR email IS NULL;

-- Получить список работников нанятых в последние 30 дней
SELECT
  name, last_name, email
FROM employees
WHERE
  hire_date >= CURRENT_DATE - 30;

-- Найти максимальную и минимальную зарплату по каждому департаменту
SELECT
  d.name,
  MIN(e.salary) AS min_salary,
  MAX(e.salary) AS max_salary
FROM departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.id
ORDER BY d.name;

-- Посчитать количество работников в каждом регионе
SELECT
  r.name,
  COUNT(*) AS employee_count
FROM regions r
JOIN locations l ON r.id = l.region_id
JOIN departments d ON l.id = d.location_id
JOIN employees e ON d.id = e.department_id
GROUP BY r.id
ORDER BY r.name;

-- Показать сотрудников у которых фамилия длиннее 10 символов
SELECT
  name, last_name, email
FROM employees
WHERE
  LENGTH(last_name) > 10;

-- Показать сотрудников с зарплатой выше средней по всей компании
SELECT
  name, last_name, email, salary
FROM employees
WHERE
  salary > (SELECT AVG(salary) FROM employees);
