-- removing duplicates
CREATE TABLE `layoffs_stagging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `ro_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_stagging_2;

insert layoffs_stagging_2
select *, row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_numbr 
 from layoffs_stagging;
 
 select * from layoffs_stagging_2;
 select* from layoffs_stagging_2 where ro_num >1;
 
 delete from layoffs_stagging_2 where ro_num >1;
 select * from layoffs_stagging_2;