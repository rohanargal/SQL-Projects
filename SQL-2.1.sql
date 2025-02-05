-- checking for duplicates. 
select * from layoffs_stagging;
select *, row_number() over(partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_numbr from layoffs_stagging; -- remove if row_number is 2

-- create duplicate _cte
with duplicate_cte as
(
select *, row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_numbr 
 from layoffs_stagging
)
select * from duplicate_cte where row_numbr >1; -- the retreive data from the qurey are duplicates

