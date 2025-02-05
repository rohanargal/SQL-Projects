-- STANDARDISING 
select company, trim(company) from layoffs_stagging_2;

update layoffs_stagging_2
set company = trim(company);

select * from layoffs_stagging_2;

--  --  --  
select distinct industry from layoffs_stagging_2 ;
update layoffs_stagging_2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct industry from layoffs_stagging_2;

-- --- 

select distinct country from layoffs_stagging_2;
update layoffs_stagging_2
set country = 'United States'
where country like 'United States%';

select distinct country from layoffs_stagging_2;

-- changing date text to date type 
select `date`, str_to_date(`date`, '%m/%d/%Y')  as date_coln from layoffs_stagging_2;

update layoffs_stagging_2
set `date` = str_to_date(`date`, '%m/%d/%Y');

-- Changing data type
alter table layoffs_stagging_2
modify column `date` date;

select * from layoffs_stagging_2;


