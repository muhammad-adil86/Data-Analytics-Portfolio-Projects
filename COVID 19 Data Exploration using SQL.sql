/*
COVID 19 Data Exploration using SQL

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/

SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4


-- Select Data that we are going to be starting with

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL 
ORDER BY 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in different countries

SELECT location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%states%'
WHERE location = 'Canada'
AND continent IS NOT NULL 
ORDER BY 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

SELECT location, date, population, total_cases,  (total_cases/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location = 'Canada'
ORDER BY 1,2


-- Countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount,
MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location = 'Canada'
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC


-- Countries with Highest Death Count per Population

SELECT location, MAX(CAST(Total_deaths as int)) AS TotalDeathCount
From PortfolioProject..CovidDeaths
--WHERE location = 'Canada'
WHERE continent IS NOT NULL 
GROUP BY location
ORDER BY TotalDeathCount DESC



-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

SELECT continent, MAX(CAST(Total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
--Where location like '%states%'
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY TotalDeathCount DESC


-- View mortality rate per continent i.e. ratio of total recorded deaths to recorded cases

WITH MortalityTable AS 
(
    SELECT location, 
    MAX(CAST(total_deaths as int)) AS TotalDeathCount,
    MAX(total_cases) AS TotalCasesCount
    FROM PortfolioProject..CovidDeaths
    WHERE continent IS NULL
    GROUP BY location
)
SELECT *,
CAST(ROUND((TotalDeathCount/TotalCasesCount)*100, 2) as nvarchar(5)) + ' %' AS MortalityRate 
FROM MortalityTable
WHERE location NOT IN ('World','International')
ORDER BY 4 DESC


-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) AS total_deaths,
SUM(CAST(new_deaths as int))/SUM(New_Cases)*100 AS DeathPercentage
From PortfolioProject..CovidDeaths
--WHERE location = 'Canada'
WHERE continent IS NOT NULL 
--GROUP BY date --at each date/day
ORDER BY 1,2



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int,vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100 --can't call a column which haven't been created previously
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null 
ORDER BY 2,3

-- There's are two ways to work aroud it
-- 1. Using CTE to perform Calculation on Partition By in previous query

WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS
(
	SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
	SUM(CONVERT(int,vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
	--, (RollingPeopleVaccinated/population)*100
	FROM PortfolioProject..CovidDeaths dea
	JOIN PortfolioProject..CovidVaccinations vac
		ON dea.location = vac.location
		AND dea.date = vac.date
	WHERE dea.continent is not null
	--AND dea.date BETWEEN '2022-01-01' AND '2022-12-31' --can further filter based on specific period
	--order by 2,3 --Cannot use order by within CTE
)
SELECT *, (RollingPeopleVaccinated/population)*100 AS PercentPopulationVaccinated
FROM PopvsVac


-- 2. Use Temp Table

DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--AND dea.date >= '2022-01-01' -- Add a date range filter
--AND dea.location IN ('%states%', 'Canada', 'Mexico') -- Add a location filter

SELECT *, (RollingPeopleVaccinated/population)*100 AS PercentPopulationVaccinated
--, (RollingPeopleVaccinated/NULLIF(population,0))*100 -- use NULLIF to avoid diving by zero
FROM #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

CREATE VIEW RollingPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null 

-- Use the newly created view
SELECT *, (RollingPeopleVaccinated/population)*100 AS PercentPopulationVaccinated
FROM RollingPopulationVaccinated