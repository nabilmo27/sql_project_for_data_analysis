SELECT 
    skills_dim.skill_id, 
    skills_dim.skills, 
    COUNT(skills_job_dim.job_id) AS co,
	ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary 
    
FROM 
    job_postings_fact
JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' 
    AND job_postings_fact.job_work_from_home = 'True'
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skill_id, 
	skills_dim.skills
HAVING 
    COUNT(*) > 10
ORDER BY 
  
    salary DESC,
	co desc;