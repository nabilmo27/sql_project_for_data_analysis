/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/
select sub.* ,skills from
(select top 10
    job_postings_fact.job_id,
	job_title,
	job_title_short,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
	name as company_name
from 
   company_dim  
 left join
    job_postings_fact on company_dim.company_id = job_postings_fact.company_id 
  where
    job_title_short = 'data analyst' and 
	salary_year_avg is not null      and
	job_location = 'anywhere'
order by salary_year_avg desc
) sub
join  
     skills_job_dim  on sub.job_id =skills_job_dim.job_id
  join 
     skills_dim      on  skills_job_dim.skill_id =skills_dim.skill_id 
	 ORDER BY
    salary_year_avg DESC;

;
