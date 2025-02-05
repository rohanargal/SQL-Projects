-- 4. remove any columns and rows we need to
UPDATE world_layoffs.layoffs_stagging_2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM world_layoffs.layoffs_stagging_2
WHERE total_laid_off IS NULL;


SELECT *
FROM world_layoffs.layoffs_stagging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Delete Useless data we can't really use
DELETE FROM world_layoffs.layoffs_stagging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM world_layoffs.layoffs_stagging_2;

ALTER TABLE layoffs_stagging_2
DROP COLUMN ro_num;


SELECT * 
FROM world_layoffs.layoffs_stagging_2;



SELECT * 
FROM world_layoffs.layoffs_stagging_2;

-- if we look at industry it looks like we have some null and empty rows, let's take a look at these
SELECT DISTINCT industry
FROM world_layoffs.layoffs_stagging_2
ORDER BY industry;

SELECT *
FROM world_layoffs.layoffs_stagging_2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

-- let's take a look at these
SELECT *
FROM world_layoffs.layoffs_stagging_2
WHERE company LIKE 'Bally%';
-- nothing wrong here
SELECT *
FROM world_layoffs.layoffs_stagging_2
WHERE company LIKE 'airbnb%';

-- it looks like airbnb is a travel, but this one just isn't populated.
-- I'm sure it's the same for the others. What we can do is
-- write a query that if there is another row with the same company name, it will update it to the non-null industry values
-- makes it easy so if there were thousands we wouldn't have to manually check them all

-- we should set the blanks to nulls since those are typically easier to work with
UPDATE world_layoffs.layoffs_stagging_2
SET industry = NULL
WHERE industry = '';

-- now if we check those are all null

SELECT *
FROM world_layoffs.layoffs_stagging_2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

-- now we need to populate those nulls if possible

UPDATE layoffs_stagging_2 t1
JOIN layoffs_stagging_2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- and if we check it looks like Bally's was the only one without a populated row to populate this null values
SELECT *
FROM world_layoffs.layoffs_stagging_2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;


