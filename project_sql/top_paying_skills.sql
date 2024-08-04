
/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

select top 25 skills, round(avg(salary_year_avg),0) salary 
from job_postings_fact
join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
job_title_short = 'Data Analyst' 
AND job_work_from_home = 'True'
and salary_year_avg IS NOT NULL
group by skills
order by salary desc