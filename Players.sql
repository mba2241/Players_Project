--It’s time to work on our first data project. We all like Soccer so this project belongs to
--the same, there is a Fifa Dataset which is having many columns and rows, but here
--we have to work on specific columns for analyzing the Data.

--This project carries some requirements to fulfill.

-- create a new database called "Players_DB"
CREATE DATABASE Players_DB;
GO -- seperates out statements that should be in their own files

-- use switches you into the database you specify
-- can also use the drop down menu next to where it says "Change Connection"
USE Players_DB;
GO

-- show all records from table.
SELECT 
    * 
FROM 
    dbo.players_20; 
GO

--1 Load the csv file and show top 5 records from it.
--SELECT TOP --> used to specify the number of records to return
SELECT 
    TOP 5 *
FROM 
    dbo.players_20;
GO

--2 How you would be able to see each column's name.
-- sys.columns --> to get the column names in a table
-- Name --> Name of the Column
-- Object_id –-> ID of the object for the table in which column belongs
-- WHERE --> is used to filter records
SELECT 
    NAME
FROM
    SYS.COLUMNS 
WHERE
    object_id = OBJECT_ID('dbo.players_20');
GO

--3 show number of rows and columns of this dataset.
-- COUNT() function returns the number of rows that matches a specified criterion
-- WHERE --> is used to filter records

SELECT
    COUNT(*) As 'Number of columns' 
FROM
    SYS.COLUMNS 
WHERE
    object_id = OBJECT_ID('dbo.players_20')
(SELECT 
    COUNT( *) AS "Number of Rows"
FROM 
    dbo.players_20);
GO


--4 Show number of players and their countries.
-- COUNT() function returns the number of rows that matches a specified criterion
-- GROUP BY --> statement is often used to filter data by matching patterns
-- ORDER BY --> keyword is used to sort the result-set in descending order
SELECT 
    COUNT(*) AS Number_of_players, nationality 
FROM 
    dbo.players_20
GROUP BY
    nationality
ORDER BY 
    Number_of_players DESC; 
GO

--5 show only top10 countries and their number of players
-- COUNT() function returns the number of rows that matches a specified criterion
-- GROUP BY --> statement is often used to filter data by matching patterns
-- ORDER BY --> keyword is used to sort the result-set in descending order.
-- SELECT TOP --> used to specify the number of records to return
SELECT 
    TOP 10 COUNT(*) AS Number_of_players, nationality 
FROM 
    dbo.players_20
GROUP BY
    nationality
ORDER BY 
    Number_of_players DESC; 
GO

--6 create a bar plot of top 5 countries and their number of players, try to fill green color in bars.
SELECT 
    TOP 5 COUNT(*) Number_of_players  
FROM    
    dbo.players_20
GROUP BY
    nationality
ORDER BY 
    Number_of_players DESC; 
GO

--7 Show top 5 players short name and wages.
SELECT 
     TOP 5 wage_eur, short_name
FROM 
    dbo.players_20;  
GO

--8 Show top 5 players short name and wages that are getting highest salaries.SELECT 
SELECT 
     TOP 5 wage_eur, short_name
FROM 
    dbo.players_20
ORDER BY 
    wage_eur DESC; 
GO

--9 Create a bar plot of point number 8 
SELECT 
     TOP 5 wage_eur as Player
FROM 
    dbo.players_20
ORDER BY 
    wage_eur DESC; 
GO

--10 Show top 10 records of Germany.
SELECT 
    TOP 10 *
FROM 
    dbo.players_20
WHERE 
    nationality LIKE '%Germany%'
GO

--11 show top 5 records of Germany players who have maximum height, weight and wages

SELECT 
     TOP 5 height_cm, short_name, nationality
FROM 
    dbo.players_20
WHERE
    nationality LIKE  '%Germany%'
ORDER BY 
    height_cm DESC; 
GO

SELECT 
     TOP 5 weight_kg, short_name
FROM 
    dbo.players_20
WHERE
    nationality LIKE  '%Germany%'
ORDER BY 
    weight_kg DESC; 
GO

SELECT 
     TOP 5 wage_eur, short_name
FROM 
    dbo.players_20
WHERE
    nationality LIKE  '%Germany%'
ORDER BY 
    wage_eur DESC; 
GO

--12 Show short name and wages of top 5 Germany players.
SELECT 
     TOP 5 wage_eur, short_name
FROM 
    dbo.players_20
WHERE
    nationality LIKE  '%Germany%'
ORDER BY 
    wage_eur DESC; 
GO

--13 Show top 5 players who have great shooting skills among all with short name.
SELECT 
     TOP 5 shooting, short_name
FROM 
    dbo.players_20
ORDER BY 
    shooting DESC; 
GO

--14 Show top 5 players records (short name, defending, nationality, and club) that have awesome defending skills.
SELECT 
     TOP 5 defending, short_name, nationality, club
FROM 
    dbo.players_20
ORDER BY 
    defending DESC; 
GO

--15 Show wages records of top 5 players of 'Real Madrid' team.
SELECT 
     TOP 5 wage_eur, short_name
FROM 
    dbo.players_20
WHERE
    club LIKE  '%Real Madrid%'
ORDER BY 
    wage_eur DESC; 
GO

--16 Show shooting records of top 5 players of 'Real Madrid' team.
SELECT 
     TOP 5 shooting, short_name
FROM 
    dbo.players_20
WHERE
    club LIKE  '%Real Madrid%'
ORDER BY 
    shooting DESC; 
GO

--17 Show defending records of top 5 players of 'Real Madrid' team. 
SELECT 
     TOP 5 defending, short_name
FROM 
    dbo.players_20
WHERE
    club LIKE  '%Real Madrid%'
ORDER BY 
    defending DESC; 
GO

--18 Show nationality records of top 5 players of 'Real Madrid' team.
SELECT 
     TOP 5 shooting, short_name, nationality
FROM 
    dbo.players_20
WHERE
    club LIKE  '%Real Madrid%'
ORDER BY 
    shooting DESC; 
GO

--Extra show short_name, age, weight, Nationality, club of  player of 'Manchester United'

SELECT 
   TOP 1 wage_eur, short_name, age, nationality,club
FROM 
    dbo.players_20
WHERE
    club LIKE  '%Manchester United%' AND  nationality LIKE  '%France%'
ORDER BY 
    wage_eur DESC; 
GO
