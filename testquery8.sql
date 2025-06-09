CREATE VIEW FriendsOfUser AS (
  SELECT f1.User2_ID AS User_ID, u1.First_Name, u1.Last_Name, u1.Year_of_Birth, u1.Month_of_Birth
  FROM project2.Public_Friends f1
  JOIN project2.Public_Users u1
  ON u1.User_ID = f1.User2_ID
  WHERE (
    (f1.User1_ID = 215)
  )
); -- our conditional

(SELECT u.User_ID, u.First_Name, u.Last_Name
FROM FriendsOfUser u
ORDER BY
  u.Year_of_Birth ASC,
  u.Month_of_Birth ASC,
  u.User_ID DESC
FETCH FIRST 1 ROW ONLY)
UNION
(SELECT u.User_ID, u.First_Name, u.Last_Name
FROM FriendsOfUser u
ORDER BY
  u.Year_of_Birth DESC,
  u.Month_of_Birth DESC,
  u.User_ID DESC
FETCH FIRST 1 ROW ONLY);