SELECT PU.User_ID, PU.First_Name, PU.Last_Name
FROM project2.Public_Users PU
LEFT JOIN (
    SELECT User1_ID AS User_ID FROM project2.Public_Friends
    UNION
    SELECT User2_ID FROM project2.Public_Friends
) PF ON PU.User_ID = PF.User_ID
WHERE PF.User_ID IS NULL
ORDER BY PU.User_ID ASC;
