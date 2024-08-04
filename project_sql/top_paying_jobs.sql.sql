/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/
select top 10 
    job_id,
	job_title,
	job_title_short,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date
from 
    job_postings_fact
left join
    company_dim on job_postings_fact.company_id =company_dim.company_id
where
    job_title_short = 'data analyst' and 
	salary_year_avg is not null      and
	job_location = 'anywhere'
order by salary_year_avg desc
