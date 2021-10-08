--Deliverable 1: The Number of Retiring Employees by Title (50 points)

-- Find all retiring employees
Select e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees AS e
FULL JOIN titles AS ti 
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order By ti.emp_no ASC;


--Clean data of duplicate titles
Select DISTINCT ON (emp_no) emp_no,
		first_name,
		last_name,
		title
INTO unique_titles
FROM retirement_titles
Order By emp_no ASC, to_date DESC;


SELECT count(emp_no),
			title
from unique_titles
Group by title
Order by count DESC;

--Deliverable 2: The Employees Eligible for the Mentorship Program(30 points)

Select DISTINCT ON(e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de 
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti 
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
		AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;


SELECT count(emp_no),
			title
from mentorship_eligibility
Group by title
Order by count DESC;