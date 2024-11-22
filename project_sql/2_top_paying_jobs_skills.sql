
WITH top_paying_jobs AS (
    SELECT job_id, 
           job_title,
           salary_year_avg,
           name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst' AND 
          job_location = 'Anywhere' AND
          salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*,
        skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON  skills_job_dim.skill_id = skills_dim.skill_id
ORDER by salary_year_avg DESC

/* 🌟 Top Skills for Data Analyst Roles in 2023 🌟

I recently analyzed the top 10 highest-paying data analyst roles from 2023 job postings. Here's what I discovered about the most in-demand skills in this field:

1️⃣ SQL: The backbone of data manipulation and querying (8 mentions).
2️⃣ Python: Essential for analysis and automation (7 mentions).
3️⃣ Tableau: For crafting impactful visualizations (6 mentions).
4️⃣ R: A favorite for statistical modeling (4 mentions).
5️⃣ Honorable mentions: Snowflake, Pandas, Excel, Azure, Bitbucket, and Go.

🔍 It's clear that technical expertise combined with visualization tools makes for a winning combination in this field.

Check out the visualization below for a breakdown of these skills!  📊 */