SELECT Count(*) AS Birhed, Month_of_Birth
FROM project2.Public_Users
WHERE Month_of_Birth IS NOT NULL
GROUP BY Month_of_Birth
ORDER BY Birhed DESC, Month_of_Birth ASC;

SELECT User_ID, First_Name, Last_Name
FROM project2.Public_Users
-- Most Birthed Month = 11
WHERE Month_of_Birth = 11
ORDER BY User_ID;

SELECT User_ID, First_Name, Last_Name
FROM project2.Public_Users
-- Least Birthed Month = 2
WHERE Month_of_Birth = 2
ORDER BY User_ID;
