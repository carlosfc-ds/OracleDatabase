-- does this work? yes. does it need to be optimized to use less views? probably so.

CREATE VIEW Bidirectional_Friends_View AS ( -- creating bidirectional table as described in the hint
    SELECT User1_ID AS User_A, User2_ID AS User_B
    FROM project2.Public_Friends
    UNION
    SELECT User2_ID, User1_ID
    FROM project2.Public_Friends
);

CREATE VIEW Mutuals AS ( -- this pulls all the mutuals of two users
    SELECT bfv1.User_A AS User1_ID, bfv2.User_B AS User2_ID, bfv1.User_B AS Mutual
    FROM Bidirectional_Friends_View bfv1
    JOIN Bidirectional_Friends_View bfv2
        ON bfv1.User_B = bfv2.User_A
    LEFT JOIN project2.Public_Friends f -- this join is pulling candidates together
        ON bfv1.User_A = f.User1_ID AND bfv2.User_B = f.User2_ID
    WHERE bfv1.User_A < bfv2.User_B AND f.User1_ID IS NULL -- this condition checks they are not friends, would not be null if they were friends
);

CREATE VIEW NumberOfMutualsForPair AS ( -- grabs the number of mutual friends between two users
    SELECT User1_ID, User2_ID, COUNT(Mutual) AS Mutual_Friends
    FROM Mutuals
    GROUP BY User1_ID, User2_ID
);

CREATE VIEW Ranked_Pairs AS ( -- orders our pairs and yoinks the data they need for the IDs
    SELECT nm.User1_ID, nm.User2_ID, nm.Mutual_Friends,
           u1.First_Name AS User1_First, u1.Last_Name AS User1_Last,
           u2.First_Name AS User2_First, u2.Last_Name AS User2_Last
    FROM NumberOfMutualsForPair nm
    JOIN project2.Public_Users u1 ON nm.User1_ID = u1.USER_ID
    JOIN project2.Public_Users u2 ON nm.User2_ID = u2.USER_ID)
    ORDER BY nm.Mutual_Friends DESC, nm.User1_ID ASC, nm.User2_ID ASC;

CREATE VIEW Top_Num_Pairs AS ( -- pulls the top NUM pairs
  SELECT User1_ID, User1_First, User1_Last,
         User2_ID, User2_First, User2_Last,
         Mutual_Friends
  FROM Ranked_Pairs
  FETCH FIRST 2 ROWS ONLY -- this is where we place our num argument
);

SELECT tp.User1_ID, -- this is for our final output
       tp.User1_First,
       tp.User1_Last,
       tp.User2_ID,
       tp.User2_First,
       tp.User2_Last,
       tp.Mutual_Friends,
       m.Mutual,
       u.First_Name AS Mutual_First,
       u.Last_Name AS Mutual_Last
FROM Top_Pairs tp
JOIN Mutuals m
  ON tp.User1_ID = m.User1_ID
 AND tp.User2_ID = m.User2_ID
JOIN project2.Public_Users u
  ON m.Mutual = u.User_ID
ORDER BY tp.Mutual_Friends DESC,
         tp.User1_ID,
         tp.User2_ID,
         m.Mutual;