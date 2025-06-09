SELECT U.User_ID, U.First_Name, U.Last_Name
FROM project2.Public_Users U
JOIN project2.Public_User_Current_Cities CC ON U.User_ID = CC.User_ID
JOIN project2.Public_User_Hometown_Cities HC ON U.User_ID = HC.User_ID
WHERE CC.Current_City_ID <> HC.Hometown_City_ID
ORDER BY U.User_ID ASC;
