

-- 1. Remove Duplicates
-- 2. Standardize The Data
-- 3. Null Values or blank values
-- 4. Remove Any Columns11

create table uni
like university;


insert uni
select * from university;


		-- Remove duplicate
select * from uni;
with university_CTE as (
select *,
Row_number() over(partition by `Name`, country, `year` order by `year`) as row_num
from university
)
select * from university_cte
where row_num >1; -- first way of remove duplicate

SELECT Name, Country, Year, COUNT(*) AS count
FROM uni
GROUP BY Name, Country, Year
HAVING COUNT(*) > 1; -- second way, but there isn't any duplicate row

select * from uni
WHERE id NOT IN (
  SELECT MIN(id)
  FROM uni
  GROUP BY Name, Country, Year
);
					-- NULL and Blank
                    
select * from uni;
SELECT
  SUM(CASE WHEN `Rank` = '' OR `Rank` IS NULL THEN 1 ELSE 0 END) AS Blank_Rank,
  SUM(CASE WHEN Name = '' OR Name IS NULL THEN 1 ELSE 0 END) AS Blank_Name,
  SUM(CASE WHEN Country = '' OR Country IS NULL THEN 1 ELSE 0 END) AS Blank_Country,
  SUM(CASE WHEN `Student Population` = '' OR `Student Population` IS NULL THEN 1 ELSE 0 END) AS Blank_Student_Population,
  SUM(CASE WHEN `Students to Staff Ratio` = '' OR `Students to Staff Ratio` IS NULL THEN 1 ELSE 0 END) AS Blank_Staff_Ratio,
  SUM(CASE WHEN `International Students` = '' OR `International Students` IS NULL THEN 1 ELSE 0 END) AS Blank_Intl_Students,
  SUM(CASE WHEN `Female to Male Ratio` = '' OR `Female to Male Ratio` IS NULL THEN 1 ELSE 0 END) AS Blank_Gender_Ratio,
  SUM(CASE WHEN `Overall Score` = '' OR `Overall Score` IS NULL THEN 1 ELSE 0 END) AS Blank_Overall_Score,
  SUM(CASE WHEN Teaching = '' OR Teaching IS NULL THEN 1 ELSE 0 END) AS Blank_Teaching,
  SUM(CASE WHEN `Research Environment` = '' OR `Research Environment` IS NULL THEN 1 ELSE 0 END) AS Blank_Research
FROM uni;



SELECT `Female to Male Ratio`
FROM uni
WHERE `Female to Male Ratio` LIKE '%:%:%';

alter table uni
add column female_ratio decimal(3,2);




					 -- Standardize The Data


Update university1
set country=lower(Trim(country));

SELECT name, LOWER(TRIM(Name)) AS normalized_name, COUNT(*) AS count
FROM university1
GROUP BY normalized_name,name
HAVING COUNT(*) > 1
ORDER BY normalized_name ;

    
select distinct(country) from university1
order by 1; -- There aren't any same country like U.S.A , united state america


alter table uni
modify column female_ratio decimal(3,2);


ALTER TABLE uni 
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;


UPDATE uni
SET `female to male ratio`= SUBSTRING_INDEX(`female to male ratio`, ':', 2); -- 12:20:00 format convert to 12:20 



SELECT `Female to Male Ratio`
FROM uni
WHERE `Female to Male Ratio` LIKE '%:%:%'; -- result = 0



select * from uni;


WITH cte AS (
  SELECT 
    id,
    CAST(SUBSTRING_INDEX(`Female to Male Ratio`, ':', 1) AS DECIMAL(10,2)) AS female,
    CAST(SUBSTRING_INDEX(`Female to Male Ratio`, ':', -1) AS DECIMAL(10,2)) AS male
  FROM uni
  WHERE `Female to Male Ratio` LIKE '%:%'
    AND `Female to Male Ratio` NOT LIKE '%:%:%'
)

UPDATE uni u
JOIN cte ON u.id = cte.id
SET u.female_ratio = cte.female / (cte.female + cte.male);

update uni
set female_ratio='N/A'
where female_ratio IS nULL
or female_ratio ='';



alter table uni
add column international_students_perc double;


update uni
set international_students_perc=
	cast(replace(`international students`,'%','')as double);
    
    
alter table uni
drop column `international students`;

	


alter table uni
drop column `female to male ratio`;


update uni
set `overall score`=ROund(`overall score`,2);


update uni
set `industry impact`=round(`industry impact`,2);

select count(*)
FROM uni
WHERE `Overall Score` IS NOT NULL;
