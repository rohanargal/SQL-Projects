create database world_layoffs;

-- Data Cleaning.
select * from layoffs;

-- Duplicates, Null vales, remove column, standardize values.

-- creating copy table.
create table layoffs_stagging
like layoffs;

insert layoffs_stagging
select * from layoffs;

select * from layoffs_stagging;