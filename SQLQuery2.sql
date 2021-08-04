select * from [Portfolio Project].dbo.coviddeath$ where continent is not null order by 3, 4
--select * from [Portfolio Project].dbo.covidvaccination$ order by 3, 4
--select data that we are going to use
select location, date, total_cases, new_cases, total_deaths from [Portfolio Project].dbo.coviddeath$ order by 1,2
--looking at total cases vs total death
select location, date, total_cases, total_deaths, (total_deaths/ total_cases)*100 as death_percentage from [Portfolio Project].dbo.coviddeath$ Where location='India' order by 1,2
--looking at what percentage of population has got covid
select location, date, population, total_cases, total_deaths, (total_cases/ population)*100 as Case_percentage, (total_deaths/ population)*100 as death_percentage from [Portfolio Project].dbo.coviddeath$ Where location='India' order by 1,2

-- lookingb at countries with highets infection rate
select location, population, max(total_cases) as maInfection, max((total_cases/ population))*100 as Case_percentage 
from [Portfolio Project].dbo.coviddeath$ group by location, population order by 4 DESC

-- lookingb at countries with highets death rate by population
select location, population, max(cast(total_deaths as int)) as maxDeaths, max((total_deaths/ population))*100 as Death_percentage 
from [Portfolio Project].dbo.coviddeath$ where continent is not null group by location, population order by 1

select SUM(new_cases), SUM(cast(new_deaths as int)) --SUM(cast(new_deaths as int))/(SUM(new_cases))*100 as deathCaseRatio
from [Portfolio Project].dbo.coviddeath$ where continent is not null  order by 1

select date, SUM(new_cases) from [Portfolio Project].dbo.coviddeath$ --where continent is not null  order by 1
