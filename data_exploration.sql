select *
from portfolio_project..deaths
where continent is not null
order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from portfolio_project..deaths
order by 1,2;

--looking at total cases versus total deaths
--shows percent chances of dying from covid in united states
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathpercentage
from portfolio_project..deaths
where location like '%states%'
order by 1,2

--looking at toal cases versus the population
--shows the percent of population who contracted covid
select location, date, total_cases, population, (total_cases/population)*100 as infection_percentage
from portfolio_project..deaths
where location like '%states%'
order by 1,2

--countries  highest infection rate versus population
select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentofPopulationInfected
from portfolio_project..deaths
--where location like '%states%'
group by location,population
order by PercentofPopulationInfected desc

--Countries with the highest death count per population

select location, max(cast(total_deaths as int))as TotalDeathCount
from portfolio_project..deaths
where continent is null
group by location
order by TotalDeathCount desc


--contient breakdown with highest death count 
select continent, max(cast(total_deaths as int))as TotalDeathCount
from portfolio_project..deaths
where continent is not null
group by continent
order by TotalDeathCount desc

--

--Global numbers
--total cases
select sum(new_cases) as total_cases, sum(cast(total_deaths as int)) as total_deaths, sum(cast(total_deaths as int))/sum(new_cases)*100 as DeathPercentage
From portfolio_project..deaths
where continent is not null
order by 1,2
--grouped by date
select sum(new_cases) as total_cases, sum(cast(total_deaths as int)) as total_deaths, sum(cast(total_deaths as int))/sum(new_cases)*100 as DeathPercentage
From portfolio_project..deaths
where continent is not null
group by date
order by 2,3









