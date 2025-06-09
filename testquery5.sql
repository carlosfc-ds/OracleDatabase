(SELECT u1.User_ID as User_1_ID, u1.First_Name as User_1_First, u1.Last_Name as User_1_Last,
        u2.User_ID as User_2_ID, u2.First_Name as User_2_First, u2.Last_Name as User_2_Last
FROM usersAndTags u1, usersAndTags u2
WHERE (u1.gender = u2.gender AND
       ABS(u1.Year_of_Birth-u2.Year_of_Birth) < (2+1) AND
       u1.User_ID < u2.User_ID AND
       u1.Tag_Photo_ID = u2.Tag_Photo_ID)
MINUS
SELECT f.User1_ID, u3.First_Name, u3.Last_Name, 
       f.User2_ID, u4.First_Name, u4.Last_Name
FROM project2.Public_Friends f, project2.Public_Users u3, project2.Public_Users u4
WHERE (f.User1_ID = u3.User_ID AND
       f.User2_ID = u4.User_ID))
ORDER BY User_1_ID ASC, User_2_ID ASC
FETCH FIRST 2 ROWS ONLY; -- this is param 1, NUM=1

-- try using a nested not exists query for friends if running too long
SELECT u1.User_ID as User_1_ID, 
u1.First_Name as User_1_First, 
u1.Last_Name as User_1_Last,
u2.User_ID as User_2_ID, 
u2.First_Name as User_2_First, 
u2.Last_Name as User_2_Last
FROM usersAndTags u1, usersAndTags u2
WHERE (u1.gender = u2.gender AND
       ABS(u1.Year_of_Birth-u2.Year_of_Birth) < (2+1) AND
       u1.User_ID < u2.User_ID AND
       u1.Tag_Photo_ID = u2.Tag_Photo_ID
       AND NOT EXISTS(
              SELECT PF.User1_ID, PF.User2_ID
              FROM project2.Public_Friends PF
              WHERE PF.User1_ID = u1.User_ID
              AND PF.User2_ID = u2.User_ID
       )
);