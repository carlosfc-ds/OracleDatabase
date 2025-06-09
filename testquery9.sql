SELECT u1.User_ID, u1.First_Name, u1.Last_Name, u2.User_ID, u2.First_Name, u2.Last_Name
FROM project2.Public_Users u1
JOIN project2.Public_User_Hometown_Cities h1
ON u1.User_ID = h1.User_ID
JOIN project2.Public_Users u2
ON u2.User_ID > u1.User_ID
JOIN project2.Public_User_Hometown_Cities h2
ON u2.User_ID = h2.User_ID
WHERE (u1.Last_Name = u2.Last_Name AND
       ABS(u1.Year_of_Birth - u2.Year_of_Birth) < 10 AND
       h1.Hometown_City_ID = h2.Hometown_City_ID AND
       EXISTS (
          SELECT f.*
          FROM project2.Public_Friends f
          WHERE (u1.User_ID = f.User1_ID AND
                 u2.User_ID = f.User2_ID)
       )
)
ORDER BY u1.User_ID ASC,
         u2.User_ID ASC;
