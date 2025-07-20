SELECT *
FROM "ML AI Job Salary"."salaries.csv";


-- Dataset summary
SELECT
	COUNT(*) as total_records,
    COUNT(DISTINCT work_year) as years_covered,
    COUNT(DISTINCT job_title) as unique_job_titles,
    COUNT(DISTINCT company_location) as countries,
    MIN(salary_in_usd) as min_salary_usd,
    MAX(salary_in_usd) as max_salary_usd,
    ROUND(AVG(salary_in_usd), 0)as avg_salary_usd
FROM "ML AI Job Salary"."salaries.csv";


-- 1. Salary Progression & Career Path Analysis

-- Analyse typical career progression paths and salary growth
WITH career_transitions AS (
	SELECT
		job_title,
        experience_level,
        AVG(salary_in_usd) as avg_salary,
        COUNT(*) as count,
        -- Calculate potential next level salary
        LEAD(AVG(salary_in_usd)) OVER (
			PARTITION BY job_title
            ORDER BY
				CASE experience_level
					WHEN 'EN' THEN 1
                    WHEN 'MI' THEN 2
                    WHEN 'SE' THEN 3
                    WHEN 'EX' THEN 4
				END
		) as next_level_salary
	FROM "ML AI Job Salary"."salaries.csv"
    WHERE employment_type = 'FT'
    GROUP BY job_title, experience_level
    HAVING COUNT(*) >= 100
),
salary_growth AS (
	SELECT
		job_title,
        experience_level,
        avg_salary,
        next_level_salary,
        ROUND((next_level_salary - avg_salary) / avg_salary * 100, 2) as salary_growth_pct,
        count
	FROM career_transitions
    WHERE next_level_salary IS NOT NULL
)
SELECT
	job_title,
    experience_level,
    ROUND(avg_salary, 0) as current_avg_salary,
    ROUND(next_level_salary, 0) as next_level_avg_salary,
    salary_growth_pct,
    count as sample_size,
    CASE
		WHEN salary_growth_pct > 40 THEN 'High Growth Potential'
        WHEN salary_growth_pct > 20 THEN 'Moderate Growth'
        ELSE 'Limited Growth'
	END as growth_category
FROM salary_growth
WHERE salary_growth_pct >0
ORDER BY salary_growth_pct DESC;




-- 2. Remote Work Premium/Discount Analysis
-- Analyse if remote work commands premium or discount by location and role
WITH remote_comparison AS (
	SELECT
		job_title,
        company_location,
        remote_ratio,
        AVG(salary_in_usd) as avg_salary,
        COUNT(*) as sample_size,
        -- Calculate location's on-site baseline salary
        AVG(AVG(salary_in_usd)) OVER (
			PARTITION BY job_title, company_location
        ) as location_avg,
        -- Calculate global average for this job
        AVG(AVG(salary_in_usd)) OVER (
			PARTITION BY job_title
		) as global_job_avg
  FROM "ML AI Job Salary"."salaries.csv"
    WHERE work_year = 2025
    GROUP BY job_title, company_location, remote_ratio
    HAVING COUNT(*) >= 3
),
remote_impact AS (
	SELECT
		job_title,
        company_location,
        MAX(CASE WHEN remote_ratio = '0' THEN avg_salary END) as onsite_salary,
        MAX(CASE WHEN remote_ratio = '50' THEN avg_salary END) as hybrid_salary,
        MAX(CASE WHEN remote_ratio = '100' THEN avg_salary END) as remote_salary,
        global_job_avg
	FROM remote_comparison
    GROUP BY job_title, company_location, global_job_avg
    HAVING MAX(CASE WHEN remote_ratio = '0' THEN avg_salary END) IS NOT NULL
		AND MAX(CASE WHEN remote_ratio = '100' THEN avg_salary END) IS NOT NULL
)
SELECT
	job_title,
    company_location,
    ROUND(onsite_salary, 0) as onsite_avg,
    ROUND(remote_salary, 0) as remote_avg,
   -- ROUND(hybrid_salary, 0) as hybrid_avg,
    ROUND((remote_salary - onsite_salary) / onsite_salary * 100, 2) as remote_premium_pct,
    CASE
		WHEN (remote_salary - onsite_salary) / onsite_salary > 0.1 THEN 'Remote Premium'
        WHEN (remote_salary - onsite_salary) / onsite_salary < -0.1 THEN 'Remote Discount'
        ELSE 'No Significant Difference'
	END as remote_impact_category
FROM remote_impact
WHERE 
	job_title LIKE 'Data Ana%'
	AND job_title NOT LIKE '%Manager%'
    AND job_title NOT LIKE'%Lead%'
ORDER BY remote_premium_pct DESC;



/* 3. Hypothetical Context: "HR needs to plan recruitment budgets for 2026. They want to know the average salary expectations 
for different experience levels in the top 5 most hired job titles."

Query the following:

a. Top 5 job titles by hiring volume in 2025
b. Average salary by experience level for each of these titles and the salary range (min-max) to set realistic budget expectations
*/

-- a. Top 5 job titles
SELECT job_title, count(job_title)
FROM "ML AI Job Salary"."salaries.csv"
GROUP BY job_title
ORDER BY count(job_title) DESC
LIMIT 5;

-- b. Average salary by experience level for each of these titles based in 'country', with salary range included
With top_5_job AS (
	SELECT job_title, count(job_title)
	FROM "ML AI Job Salary"."salaries.csv"
	GROUP BY job_title
	ORDER BY count(job_title) DESC
	LIMIT 5
)

SELECT 
	s.job_title, 
    s.experience_level,
    count(s.job_title) as job_count,
    AVG(s.salary_in_usd) as avg_salary,
    MAX(s.salary_in_usd) as max_salary,
    MIN(s.salary_in_USD) as min_salary,
    MAX(s.salary_in_usd) - MIN(s.salary_in_USD) as salary_range
FROM "ML AI Job Salary"."salaries.csv" as s
INNER JOIN top_5_job as t
ON s.job_title = t.job_title
WHERE employee_residence = 'GB'
GROUP BY s.job_title, experience_level
ORDER BY job_title ASC, job_count DESC;





/* 4. : "Your company is considering expanding to new countries. 
The CFO wants to know which countries have the best talent availability-to-cost ratio."

Create a report showing:

a. Countries with at least 100 employees in the dataset
b. Average salary by country
c. Number of senior-level (SE, EX) professionals available
d. Rank countries by value score: (senior talent count / average salary * 1000) 
*/

-- a. Countries with at least 100 employees in the dataset
SELECT employee_residence, count(employee_residence)
FROM "ML AI Job Salary"."salaries.csv"
GROUP BY employee_residence
HAVING count(employee_residence) >= 100
ORDER BY employee_residence DESC;

-- b. Average salary by country
SELECT 
	employee_residence, 
    count(employee_residence) as employee_count, 
    ROUND(avg(salary_in_usd), 2) as avg_salary
FROM "ML AI Job Salary"."salaries.csv"
GROUP BY employee_residence
HAVING count(employee_residence) >= 100
ORDER BY employee_count DESC;


-- c. Number of senior-level (SE, EX) professionals available and its % of total employees
WITH senior_count AS (
	SELECT 
		employee_residence, 
		count(employee_residence) as employee_count, 
		ROUND(avg(salary_in_usd), 2) as avg_salary,
		SUM(
			CASE
				WHEN experience_level IN ('SE', 'EX') THEN 1
				ELSE 0
			END) AS senior_positions_count
	FROM "ML AI Job Salary"."salaries.csv"
	GROUP BY employee_residence
	HAVING count(employee_residence) >= 100
	ORDER BY employee_count DESC
)
SELECT 
	*,
  ROUND(CAST(senior_positions_count as numeric) / employee_count * 100, 2) as senior_pct
FROM senior_count
ORDER BY senior_pct DESC;


-- d. Rank countries by value score: (senior talent count / average salary * 1000) 
WITH senior_count AS (
	SELECT 
		employee_residence, 
		count(employee_residence) as employee_count, 
		ROUND(avg(salary_in_usd), 2) as avg_salary,
		SUM(
			CASE
				WHEN experience_level IN ('SE', 'EX') THEN 1
				ELSE 0
			END) AS senior_positions_count
	FROM "ML AI Job Salary"."salaries.csv"
	GROUP BY employee_residence
	HAVING count(employee_residence) >= 100
	ORDER BY employee_count DESC
)
SELECT 
	*,
	ROUND(senior_positions_count::numeric / employee_count * 100, 2) as senior_pct,
    ROUND(LOG(senior_positions_count)::numeric, 2) as normalized_count, -- to reduce specific countries with sheer volume in the dataset that generates biased output
    ROUND((LOG(senior_positions_count) / avg_salary * 100000)::numeric, 2) as value_score
FROM senior_count
ORDER BY value_score DESC;




/* 5. Cost Center Analysis
Context: "Finance wants to understand salary distribution across company sizes to optimize hiring strategies."

Provide:

a. Median salaries by company size (S, M, L) and employment type
b. The 25th and 75th percentile salaries for each group
c. Count of employees in each category
d. Focus on 2024-2025 data only
*/

WITH row_calc AS (
	SELECT *,
		ROW_NUMBER() OVER (PARTITION BY company_size, employment_type ORDER BY salary_in_usd ASC) as row_num,
        COUNT(*) OVER (PARTITION BY company_size, employment_type) as total_count
	FROM "ML AI Job Salary"."salaries.csv"
    WHERE work_year IN ('2024', '2025')
)	
SELECT company_size,
	employment_type,
	total_count,
	ROUND(((FLOOR((total_count + 1) / 4) + CEIL((total_count + 1) / 4)) / 2)::numeric, 0) as p25_count,
  ROUND(AVG(CASE WHEN row_num IN (FLOOR((total_count + 1) / 4), CEIL((total_count + 1) / 4)) THEN salary_in_usd END)::numeric, 2) as p25_salary,
  ROUND(((FLOOR((total_count + 1) / 2) + CEIL((total_count + 1) / 2)) / 2)::numeric, 0) as median_count,
  ROUND(AVG(CASE WHEN row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2)) THEN salary_in_usd END)::numeric, 2) as median_salary,
  ROUND(((FLOOR((total_count + 1) / 4 * 3) + CEIL((total_count + 1) / 4 * 3)) / 2)::numeric, 0) as p75_count,
  ROUND(AVG(CASE WHEN row_num IN (FLOOR((total_count + 1) / 4 * 3), CEIL((total_count + 1) / 4 * 3)) THEN salary_in_usd END)::numeric, 2) as p75_salary
FROM row_calc
WHERE 
row_num	IN (
	FLOOR((total_count + 1) / 4), CEIL((total_count + 1) / 4),
	FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2),
	FLOOR((total_count + 1) / 4 * 3), CEIL((total_count + 1) / 4 * 3)
)
GROUP BY company_size, employment_type, total_count
ORDER BY company_size ASC, median_salary DESC;
