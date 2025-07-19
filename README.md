# MLAIJobAnalysis
ML AI Related Job Salary Analysis 2025 Using SQL &amp; Tableau

Motivation / Background:

Project Overview / Goal:

This project takes in real data about Data Science, Machine Learning and AI related job salaries from 2020 - 2025 across different countries.

Dataset source was taken from Kaggle:
https://www.kaggle.com/datasets/adilshamim8/salaries-for-data-science-jobs/data

It has about 142,000 records, with work_year, experience_level, employment_type, job_title, salary details, remote_ratio and company size as major columns.

The dataset downloaded is already clean, so no data cleaning was conducted.

Key Skill Demonstrated:
Tableau and SQL were used to conduct analysis about this project.
- Data extraction and transformation in SQL
- Building interactive Tableau dashboards
- Data-driven storytelling
- Business recommendations

Key Results:

Part A - SQL Business Intelligence Analysis
1. Dataset Overview
The analysis is based on over 140,000 job records collected from 96 different countries.
Data spans 6 years and covers 410 unique job titles in the ML, AI, and data science field.
Salaries in the dataset range from 15,000 up to 800,000 per year.
The average salary across all roles and countries is about $157,500 USD.
This large and diverse dataset gives a broad view of global job trends and pay for AI and data-related positions.

2. Career Progression and Salary Growth
This analysis explores how salaries change as people advance through different experience levels and job titles. To do this, I used a combination of advanced SQL skills, including:

a. Window functions (LEAD() and PARTITION BY) to compare salaries across experience levels within the same job title
b. Conditional logic (CASE) for custom ordering of experience levels
c. Aggregations (AVG, COUNT, ROUND) to calculate typical salaries and growth percentages
d. Common Table Expressions (CTEs) to structure the analysis in clear, reusable steps
e. Filtering and grouping to ensure enough data is used for each job and level


<img width="1880" height="552" alt="image" src="https://github.com/user-attachments/assets/8780a575-a5aa-4fea-8637-127922e029bb" />

Key Insights:
a. Roles like Data Specialist, Engineer, and Research Engineer offer some of the strongest salary growth potential as you gain experience, with average pay jumps of 40% or more when moving up a level.
b. Technical roles in engineering and research reward career progression with especially large salary increases.
c. Even popular roles like Software Engineer and Data Engineer show moderate salary growth for those advancing in their careers.
d. In general, moving up from entry or intermediate levels in this field can make a major difference in long-term earning potential.



Part B - Tableau visualization:
1. Salary Evolution by Experience Level
   Quick look at average salary trends by experience level from 2020–2025:

a. More experience = more money, no surprises here. Executives/Directors are way ahead, and the gap stays pretty big.
b. All experience levels saw steady growth in salaries over time, with a bit of a dip around 2021, then a strong recovery.
c. Entry level salaries are still much lower than others, but also saw some gains—though growth slowed down a bit in 2025.
d. In general, the market seems to be paying more across the board compared to 2020.

2. Global Salary Landscape
Quick breakdown of how pay looks for full-time roles in different countries:

a. Top-paying countries (darker blue) like the United States, Canada, Australia, and some Western European countries show average salaries ranging from about $120,000 up to $164,000.
b. Countries on the lower end of the scale (more orange) such as India and Brazil have average salaries closer to 35,000 to 45,000.
c. Big gap between regions, with countries like Germany, the UK, and the Netherlands also showing strong averages above $100,000.
d. Only countries with at least 50 records are shown, to keep the data quality reasonable.


3. Salary Distribution by Top Job Titles
This box and whisker plot is sorted by job titles, with the highest-paying roles at the top.

a. Machine Learning Engineer, Research Engineer, and Software Engineer have the highest median salaries, all above $170,000.
 For these top roles:
  -The 25th percentile salary is about $120,000.
  -The 75th percentile is around $240,000.
  -The upper whisker (99th percentile) extends up to $400,000.
b. Data Analyst and Data Specialist are toward the lower end of the scale, with a median salary of about $95,000.
c. The plot makes it clear that technical engineering and research positions command significantly higher compensation compared to analyst and specialist roles.

4. Salary Based on Remote Work and Company Size
   Quick table shows color-coded salary distribution
   
a. On-site roles at large companies offer the highest average salaries overall.
b. Hybrid work arrangements pay the least across all company sizes.
c. Fully remote roles tend to offer pay that is higher than hybrid but usually not as high as on-site roles, unless the company is mid-sized, where remote pay gets very close to on-site.
d. The size of the company matters: larger companies consistently pay more, whether the role is on-site, hybrid, or remote.




