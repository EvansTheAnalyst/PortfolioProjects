SELECT *
FROM PortfolioProject..CovidDeaths
order by 3, 4

SELECT *
FROM PortfolioProject..CovidVaccinations

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
ORDER BY 1, 2

-- Looking at Total Cases vs Total Deaths Percentage for United States
-- Shows the death rate percentage from contracting Covid

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%states%'
ORDER BY 1, 2

-- Looking at Total Cases vs Population Percentage for Asia
-- Shows what percentage of the population got Covid

SELECT continent, location, date, population, total_cases, (total_cases/population)*100 AS CovidCasePercentage
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Asia'
ORDER BY 2, 3

-- What countries have the highest infection rate compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentOfPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY 4 desc


-- Looking at Total Population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3