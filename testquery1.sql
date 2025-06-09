SELECT DISTINCT First_Name, LENGTH(First_Name) AS Name_Length
FROM project2.Public_Users
WHERE LENGTH(First_Name) IN (SELECT MAX(LENGTH(First_Name)) FROM project2.Public_Users)
OR LENGTH(First_Name) IN (SELECT MIN(LENGTH(First_Name)) FROM project2.Public_Users)
ORDER BY Name_Length DESC, First_Name ASC;

SELECT First_Name, COUNT(*) AS Name_Count
FROM project2.Public_Users
GROUP BY First_Name
ORDER BY Name_Count DESC, First_Name ASC;
