# MLAIJobAnalysis
## ML & AI Job Salary Analysis 2025 | PostgreSQL & Tableau

## Executive Summary

This project analyzes **140,000+ job records across 96 countries** to uncover actionable salary insights for ML/AI roles from 2020-2025. Key findings reveal that **remote work commands a 70% salary premium** in the US, **career progression offers 40%+ growth potential** for technical roles, and **Eastern European markets provide the most cost-effective access** to senior talent.

**Business Impact**: Enables strategic talent acquisition, optimized compensation planning, and data-driven recruitment decisions.

## Table of Contents

- [Executive Summary](#executive-summary)
- [Project Overview](#project-overview)
- [Dataset Overview](#dataset-overview)
- [Key Business Insights](#key-business-insights)
- [Skills Demonstrated](#skills-demonstrated)
- [Part A: SQL Business Intelligence Analysis](#part-a-sql-business-intelligence-analysis)
- [Part B: Tableau Dashboard & Visualizations](#part-b-tableau-dashboard--visualizations)
- [Interactive Dashboard](#interactive-dashboard)

---

## Project Overview

### Business Context
The evolving ML/AI job market creates challenges in competitive talent acquisition and strategic compensation planning. This analysis transforms raw salary data into actionable business intelligence for HR professionals, finance teams, and business leaders.

### Project Goal
Provide data-driven insights for:
- **Competitive salary benchmarking** across experience levels and markets
- **Remote work compensation strategy** optimization  
- **Geographic talent acquisition** cost analysis
- **2026 recruitment budget planning** based on market trends

---

## Dataset Overview

**Source**: [Kaggle - Salaries for Data Science Jobs](https://www.kaggle.com/datasets/adilshamim8/salaries-for-data-science-jobs/data)

<img width="1856" height="162" alt="image" src="https://github.com/user-attachments/assets/43681ba9-0463-4add-b323-74d74cc6231c" />

**Key Statistics**: 6-year timespan (2020-2025) | 410 unique job titles | Salary range: $15,000 - $800,000 | Average: $157,500 USD

**Data Quality**: Clean dataset requiring no additional processing, ensuring analysis accuracy for business decisions.

---

## Key Business Insights

### Strategic Findings
- **Remote Premium**: US remote roles pay **70% more** than on-site positions
- **Career Growth**: Technical roles offer **40%+ salary increases** through progression
- **Geographic Arbitrage**: Slovakia, Lithuania, and India provide **highest talent value**
- **Company Size Impact**: Large companies pay **15-25% more** across work arrangements

### Business Recommendations  
- Leverage geographic differentials for cost-effective hiring
- Implement region-specific remote compensation adjustments
- Structure clear progression paths to retain talent
- Use experience-level benchmarks for budget planning

---

## Skills Demonstrated

### Business Analysis
- **Strategic Problem Solving**: Custom business metrics development
- **Data Storytelling**: Complex data transformed into executive insights
- **Stakeholder Communication**: Cross-departmental analysis framework
- **Market Research**: Comprehensive competitive analysis

### Technical Competencies
- **Advanced SQL**: Window functions (e.g. `LEAD()`, `PARTITION BY`), CTEs, complex joins
- **Data Visualization**: Interactive Tableau dashboards with geographic mapping
- **Statistical Analysis**: Percentile calculations and distribution analysis
- **Database Management**: PostgreSQL analytics and business intelligence

---

# Part A - SQL Business Intelligence Analysis

## 1. Career Progression and Salary Growth

This analysis explores how salaries change as people advance through different experience levels and job titles, providing insights into career development potential across the ML/AI field.

### SQL Skills Demonstrated:
- **Window Functions**: `LEAD()` and `PARTITION BY` to compare salaries across experience levels within the same job title
- **Conditional Logic**: `CASE` statements for custom ordering of experience levels  
- **Common Table Expressions (CTEs)**: Structure analysis in clear, reusable steps

<img width="2240" height="638" alt="image" src="https://github.com/user-attachments/assets/40375cd0-cbbe-41d2-b556-5793cfbe5134" />

### Key Insights:
- **Strong Growth Potential**: Roles like Data Specialist, Engineer, and Research Engineer offer **40% or more** salary jumps when moving up a level
- **Technical Roles Reward Experience**: Engineering and research positions show especially large salary increases with career progression  
- **Career Advancement Impact**: Moving up from entry or intermediate levels can make a major difference in long-term earning potential

## 2. Remote Work Premium Analysis

This analysis compares salary differences between remote and on-site positions for Data Analyst roles across different countries, helping understand geographic variations in remote work compensation.

### SQL Skills Demonstrated:
- **Conditional Aggregation**: Pattern filtering and `WHERE` clause logic to focus on specific job titles across different countries
- **Statistical Calculations**: Percentage calculations and salary comparisons to identify remote work premiums
- **Geographic Data Analysis**: Cross-country salary analysis with location-based filtering

<img width="1570" height="566" alt="image" src="https://github.com/user-attachments/assets/5d2ce5bb-1d0d-4e17-8f0b-dfe0cc13ed72" />

### Key Insights:
- **Significant US Premium**: Remote Data Analyst roles in the United States pay **over 70% higher** than on-site positions
- **Regional Variations**: UK, Spain, and Canada show smaller but notable remote premiums between **20-32% more** than on-site roles
- **Market-Dependent Value**: Germany and Austria show minimal difference between remote and on-site compensation

## 3. Salary Planning for Top Roles (2026 Recruitment Budget)

**Business Context**: HR needs to plan recruitment budgets for 2026 and wants to understand average salary expectations for different experience levels in the most commonly hired job titles.

### SQL Skills Demonstrated:
- **Ranking Operations**: `GROUP BY` and `ORDER BY` to identify top 5 most-hired roles by volume
- **Multi-dimensional Aggregation**: Complex joins calculating averages, min-max ranges across job titles and experience levels
- **Statistical Distribution Analysis**: Salary range calculations for realistic budget planning

<img width="472" height="418" alt="image" src="https://github.com/user-attachments/assets/ab9dceaf-0db8-44b4-9d22-7971aef32445" />

<img width="1664" height="640" alt="image" src="https://github.com/user-attachments/assets/d96b5b60-6f41-4854-be04-2c86391ae4c7" />

### Key Insights:
- **Top Hiring Priorities**: Data Scientist, Software Engineer, Data Engineer, Data Analyst, and Engineer represent the highest volume roles
- **Experience Level Impact**: Executive/Director level positions command **well above $140,000**, while entry-level roles start **under $60,000**
- **Wide Salary Ranges**: Data Scientist salaries in the UK range from **under $30,000 up to nearly $720,000** depending on experience

## 4. Talent Availability-to-Cost Ratio Analysis  

**Business Context**: Companies need to identify markets that offer the best value when hiring senior ML/AI talent, balancing talent availability with cost considerations.

### SQL Skills Demonstrated:
- **Data Type Casting**: `::numeric` and `::float` conversions for precise mathematical calculations
- **Advanced Mathematical Operations**: Logarithmic normalization and custom ratio calculations for business metrics
- **Custom Metric Development**: Created value_score combining senior talent percentage, availability, and cost factors

<img width="1796" height="884" alt="image" src="https://github.com/user-attachments/assets/db7626cc-9a07-471b-9fb3-83d8f6bbbce5" />

### Key Insights:
- **Best Value Markets**: Slovakia, Lithuania, and India provide the most cost-effective access to senior ML/AI talent
- **High-Cost vs High-Value**: US and UK offer abundant senior talent but at significantly higher cost-per-hire ratios
- **Eastern European Advantage**: Central/Eastern European countries show high senior professional concentration relative to salary levels

## 5. Cost Center Analysis

**Business Context**: Finance wants to understand salary distribution patterns across company sizes to optimize hiring strategies and budget allocation.

### SQL Skills Demonstrated:
- **Window Ranking Functions**: `ROW_NUMBER()` and `COUNT() OVER` for advanced row-based calculations
- **Percentile Distribution Analysis**: Calculated 25th, median, and 75th percentiles using row-based statistical logic
- **Temporal Data Filtering**: Focused analysis on recent data (2024-2025) using date-based `WHERE` conditions

<img width="1872" height="836" alt="image" src="https://github.com/user-attachments/assets/5c173590-2a37-447f-8c11-633dd81199d0" />

### Key Insights:
- **Company Size Premium**: Median full-time salaries consistently increase with company size - large companies offer the highest compensation
- **Employment Type Variability**: Contract and part-time roles show wider salary ranges with higher variability than full-time positions
- **Strategic Focus Areas**: Medium and large full-time positions represent the majority of hiring activity and budget impact

**Part A Source code**: [View complete SQL analysis on GitHub](https://github.com/an0015ng/MLAIJobAnalysis/blob/main/ML%20AI%20Job%20Salary%20PostgreSQL.sql)

---

# Part B - Tableau Visualizations

## 1. Salary Evolution by Experience Level

A visual overview of salary trends by experience level from 2020 to 2025, showing how the market has evolved across different career stages.

<img width="2250" height="1256" alt="Salary Evolution by Experience Level" src="https://github.com/user-attachments/assets/1b598628-e62a-4942-88b4-4f84c8040507" />

### Key Insights:
- **Experience premium persists**: Executives/Directors consistently maintain the highest salaries with a significant gap from other levels—reinforcing the SQL findings that showed 40%+ salary jumps when advancing experience levels
- **Market recovery post-2021**: All experience levels demonstrated steady salary growth with a notable recovery after a brief dip in 2021, indicating overall market resilience
- **Entry-level growth plateau**: While entry-level positions saw gains over the period, growth momentum slowed in 2025, suggesting potential market saturation at junior levels

## 2. Global Salary Landscape

Geographic breakdown of average salaries for full-time ML/AI roles, highlighting significant regional variations in compensation.

<img width="2266" height="1292" alt="Global Salary Landscape" src="https://github.com/user-attachments/assets/3cd29267-6ea2-409c-b932-c6f000d853db" />

### Key Insights:
- **Western premium markets**: United States, Canada, Australia, and Western European countries lead with salaries ranging from $120,000 to $164,000, aligning with the SQL analysis that identified geographic arbitrage opportunities
- **Significant regional gaps**: Emerging markets like India and Brazil show average salaries of $35,000-$45,000, creating substantial cost differentials for global hiring strategies
- **Quality-filtered data**: Analysis includes only countries with 50+ records to ensure statistical reliability, maintaining data integrity standards throughout the visualization

## 3. Salary Distribution by Top Job Titles

Box-and-whisker analysis of salary ranges across the most common job titles, sorted by median compensation levels.

<img width="1926" height="1056" alt="Salary Distribution by Top Job Titles" src="https://github.com/user-attachments/assets/e3227fb2-6df8-4d10-aa8d-7f2e95d285fb" />

### Key Insights:
- **Engineering roles dominate**: Machine Learning Engineer, Research Engineer, and Software Engineer command the highest median salaries above $170,000, with salary ranges spanning from $120,000 (25th percentile) to $400,000+ (upper whisker)
- **Analyst-specialist gap**: Data Analyst and Data Specialist roles cluster around $95,000 median salary, confirming the compensation hierarchy identified in the SQL top roles analysis
- **Technical premium validated**: Clear evidence that technical engineering and research positions significantly outpace analyst and specialist roles in compensation, supporting strategic career progression insights

## 4. Salary Based on Remote Work and Company Size

Comprehensive view of how work arrangement and company size interact to influence compensation across the ML/AI field.

<img width="1322" height="318" alt="Salary Based on Remote Work and Company Size" src="https://github.com/user-attachments/assets/91bb6bd1-09aa-4a3a-867f-9fa36379f261" />

### Key Insights:
- **Large company advantage**: On-site roles at large companies offer the highest average salaries, consistent with the SQL cost center analysis showing salary increases with company size
- **Hybrid work penalty**: Hybrid arrangements consistently pay the least across all company sizes, representing an unexpected finding in the current remote work landscape
- **Remote work nuances**: Fully remote roles typically outpay hybrid but trail on-site positions, except at mid-sized companies where remote compensation approaches on-site levels—echoing the geographic premium variations found in the SQL remote work analysis

---

**Part B Full interactive dashboard available at:** [Tableau Public](https://public.tableau.com/app/profile/daniel.ang8549/viz/MlAIJobTableau/Dashboard1)

<img width="2960" height="1400" alt="Complete Dashboard Overview" src="https://github.com/user-attachments/assets/44a3064e-30a2-4619-ad27-b9d4f22ac3f5" />







# MLAIJobAnalysis
ML AI Related Job Salary Analysis 2025 Using PostgreSQL &amp; Tableau

Motivation / Background:

Project Overview / Goal:

This project takes in real data about Data Science, Machine Learning and AI related job salaries from 2020 - 2025 across different countries.

Dataset source was taken from Kaggle:
https://www.kaggle.com/datasets/adilshamim8/salaries-for-data-science-jobs/data

Dataset Overview

<img width="1856" height="162" alt="image" src="https://github.com/user-attachments/assets/43681ba9-0463-4add-b323-74d74cc6231c" />

The analysis is based on over 140,000 job records collected from 96 different countries.
Data spans 6 years and covers 410 unique job titles in the ML, AI, and data science field.
Salaries in the dataset range from 15,000 up to 800,000 per year.
The average salary across all roles and countries is about $157,500 USD.
This large and diverse dataset gives a broad view of global job trends and pay for AI and data-related positions.
The dataset downloaded is already clean, so no data cleaning was conducted.

Key Skill Demonstrated:
Tableau and PostgreSQL were used to conduct analysis about this project.
- Data extraction and transformation in PostgreSQL
- Building interactive Tableau dashboards
- Data-driven storytelling
- Business recommendations

Part A - SQL Business Intelligence Analysis

1. Career Progression and Salary Growth
This analysis explores how salaries change as people advance through different experience levels and job titles. To do this, I used a combination of advanced SQL skills, including:

a. Window functions (LEAD() and PARTITION BY) to compare salaries across experience levels within the same job title
b. Conditional logic (CASE) for custom ordering of experience levels
c. Aggregations (AVG, COUNT, ROUND) to calculate typical salaries and growth percentages
d. Common Table Expressions (CTEs) to structure the analysis in clear, reusable steps
e. Filtering and grouping to ensure enough data is used for each job and level


<img width="2240" height="638" alt="image" src="https://github.com/user-attachments/assets/40375cd0-cbbe-41d2-b556-5793cfbe5134" />

Key Insights:
a. Roles like Data Specialist, Engineer, and Research Engineer offer some of the strongest salary growth potential as you gain experience, with average pay jumps of 40% or more when moving up a level.
b. Technical roles in engineering and research reward career progression with especially large salary increases.
c. Even popular roles like Software Engineer and Data Engineer show moderate salary growth for those advancing in their careers.
d. In general, moving up from entry or intermediate levels in this field can make a major difference in long-term earning potential.


2. Remote Work Premium Analysis
SQL Skills Demonstrated:

a. Used window functions to compare salary averages for the same role by location and work setting (on-site vs remote)
b. Employed conditional aggregation and pattern filtering to focus on Data Analyst positions in different countries
c. Grouped and calculated percentage differences to identify where remote work delivers a salary premium or discount

<img width="1570" height="566" alt="image" src="https://github.com/user-attachments/assets/5d2ce5bb-1d0d-4e17-8f0b-dfe0cc13ed72" />

Key Insights:

a. In the United States, remote Data Analyst roles pay significantly more than on-site roles, with remote salaries averaging over 70% higher in some cases.
b. Similar but smaller remote premiums are seen in countries like the UK, Spain, and Canada, where remote positions can pay between 20% and 32% more than on-site roles.
c. For other regions such as Germany, Austria, and some on-site roles within the US, the difference in pay between remote and on-site is small or negligible.
d. Overall, the value of remote work for salary strongly depends on country and company, and in some markets, going remote may offer a notable increase in earning potential.

3. Salary Planning for Top Roles (2026 Recruitment Budget)
Hypothetical Context: "HR needs to plan recruitment budgets for 2026. They want to know the average salary expectations 
for different experience levels in the top 5 most hired job titles."

Query the following:
- Top 5 job titles by hiring volume in 2025
- Average salary by experience level for each of these titles and the salary range (min-max) to set realistic budget expectations

SQL Techniques Used:

a. Identified top 5 most-hired roles using grouping and sorting
b. Applied joins and aggregations to provide detailed averages, min-max salary, and salary range by experience level and job title for the selected country
c. Used CTEs for stepwise analysis and clearer, maintainable queries

<img width="472" height="418" alt="image" src="https://github.com/user-attachments/assets/ab9dceaf-0db8-44b4-9d22-7971aef32445" />

<img width="1664" height="640" alt="image" src="https://github.com/user-attachments/assets/d96b5b60-6f41-4854-be04-2c86391ae4c7" />

Key Insights:

a. The five most common hiring needs in 2025 were: Data Scientist, Software Engineer, Data Engineer, Data Analyst, and Engineer.
b. Average salary expectations vary widely by both job title and experience level. For example, Executive / Director level (EX) Data Engineers and Data Scientists can command salaries well above 140,000 in the UK, while entry−level roles can be under 60,000.
c. Salary ranges are broad within each title, reflecting both entry-level and highly specialized roles. For example, Data Scientist salaries in the UK ranged from under 30,000 up to nearly 720,000 depending on experience and other factors.
d. Having this breakdown helps set realistic budget benchmarks not just for base salary, but for the likely spread HR can expect when hiring across different seniority levels.

4. Talent Availability-to-Cost Ratio Analysis
Hypothetical Context: "HR needs to plan recruitment budgets for 2026. They want to know the average salary expectations 
for different experience levels in the top 5 most hired job titles."

Create a report showing:

a. Countries with at least 100 employees in the dataset
b. Average salary by country
c. Number of senior-level (SE, EX) professionals available
d. Rank countries by value score: (senior talent count / average salary * 1000) 

SQL Skills Demonstrated:
a. Careful use of type casting (::numeric, ::float) to ensure accurate calculations involving division and rounding.
b. Applied advanced calculations (e.g., type casting, logarithms, custom ratios) for nuanced business metrics.
d. Construction of custom business metrics, such as the senior_pct (percentage of senior roles), normalized_count (logarithmic normalization), and a calculated value_score to compare talent value across geographies.

<img width="1796" height="884" alt="image" src="https://github.com/user-attachments/assets/db7626cc-9a07-471b-9fb3-83d8f6bbbce5" />

Key Insights:
a. Slovakia, Lithuania, and India provide the most cost-effective access to senior ML/AI talent based on the value score.
b. High-salary countries like the US and UK have abundant senior talent, but lower cost-effectiveness.
c. Central/Eastern European countries have a high proportion of senior professionals relative to their workforce and salary levels.


5. Cost Center Analysis
Hypothetical Context: "Finance wants to understand salary distribution across company sizes to optimize hiring strategies."

Provide:

a. Median salaries by company size (S, M, L) and employment type
b. The 25th and 75th percentile salaries for each group
c. Count of employees in each category
d. Focus on 2024-2025 data only

SQL Skills Demonstrated:
a. Used window functions (ROW_NUMBER, COUNT OVER) for ranking and grouping by company size and employment type.
b. Calculated salary percentiles (25th, median, 75th) using row-based logic for robust distribution insights.
c. Applied conditional aggregation and careful data filtering for recent years (2024–2025).

<img width="1872" height="836" alt="image" src="https://github.com/user-attachments/assets/5c173590-2a37-447f-8c11-633dd81199d0" />

Key Insights

a. Median full-time salaries increase with company size: large companies offer the highest median and upper-range salaries.
b. Contract and part-time roles show wide variability; smaller sample sizes in these groups require cautious interpretation.
c. Most employee data is concentrated in medium and large full-time positions, informing where salary strategy may have the biggest impact.

Source code for SQL can be found in this folder: 

(A quick summary of SQL section and bring to the next part: Tableau)


Part B - Tableau visualization:
1. Salary Evolution by Experience Level
   Quick look at average salary trends by experience level from 2020–2025:

   <img width="2250" height="1256" alt="image" src="https://github.com/user-attachments/assets/1b598628-e62a-4942-88b4-4f84c8040507" />

a. More experience = more money, no surprises here. Executives/Directors are way ahead, and the gap stays pretty big.
b. All experience levels saw steady growth in salaries over time, with a bit of a dip around 2021, then a strong recovery.
c. Entry level salaries are still much lower than others, but also saw some gains—though growth slowed down a bit in 2025.
d. In general, the market seems to be paying more across the board compared to 2020.

2. Global Salary Landscape
Quick breakdown of how pay looks for full-time roles in different countries:

<img width="2266" height="1292" alt="image" src="https://github.com/user-attachments/assets/3cd29267-6ea2-409c-b932-c6f000d853db" />

a. Top-paying countries (darker blue) like the United States, Canada, Australia, and some Western European countries show average salaries ranging from about $120,000 up to $164,000.
b. Countries on the lower end of the scale (more orange) such as India and Brazil have average salaries closer to 35,000 to 45,000.
c. Big gap between regions, with countries like Germany, the UK, and the Netherlands also showing strong averages above $100,000.
d. Only countries with at least 50 records are shown, to keep the data quality reasonable.

3. Salary Distribution by Top Job Titles
This box and whisker plot is sorted by job titles, with the highest-paying roles at the top.

<img width="1926" height="1056" alt="image" src="https://github.com/user-attachments/assets/e3227fb2-6df8-4d10-aa8d-7f2e95d285fb" />

a. Machine Learning Engineer, Research Engineer, and Software Engineer have the highest median salaries, all above $170,000.
 For these top roles:
  -The 25th percentile salary is about $120,000.
  -The 75th percentile is around $240,000.
  -The upper whisker (99th percentile) extends up to $400,000.
b. Data Analyst and Data Specialist are toward the lower end of the scale, with a median salary of about $95,000.
c. The plot makes it clear that technical engineering and research positions command significantly higher compensation compared to analyst and specialist roles.

4. Salary Based on Remote Work and Company Size
   Quick table shows color-coded salary distribution

   <img width="1322" height="318" alt="image" src="https://github.com/user-attachments/assets/91bb6bd1-09aa-4a3a-867f-9fa36379f261" />

a. On-site roles at large companies offer the highest average salaries overall.
b. Hybrid work arrangements pay the least across all company sizes.
c. Fully remote roles tend to offer pay that is higher than hybrid but usually not as high as on-site roles, unless the company is mid-sized, where remote pay gets very close to on-site.
d. The size of the company matters: larger companies consistently pay more, whether the role is on-site, hybrid, or remote.


Full Dashboard is available at Tableau Public: https://public.tableau.com/app/profile/daniel.ang8549/viz/MlAIJobTableau/Dashboard1

<img width="2960" height="1400" alt="image" src="https://github.com/user-attachments/assets/44a3064e-30a2-4619-ad27-b9d4f22ac3f5" />





