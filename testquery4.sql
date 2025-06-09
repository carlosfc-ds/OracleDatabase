SELECT PP.Photo_ID, PP.Album_ID, PP.Photo_Link, PA.Album_Name
FROM project2.Public_Photos PP
JOIN (SELECT Tag_Photo_ID
FROM project2.Public_Tags
GROUP BY Tag_Photo_ID
ORDER BY COUNT(*) DESC, Tag_Photo_ID ASC
FETCH FIRST 2 ROWS ONLY) PT ON PP.Photo_ID = PT.Tag_Photo_ID
JOIN project2.Public_Albums PA ON PP.Album_ID = PA.Album_ID;

SELECT U.User_ID, U.First_Name, U.Last_Name
FROM project2.Public_Tags T 
JOIN project2.Public_Users U ON T.Tag_Subject_ID = U.User_ID
WHERE T.Tag_Photo_ID = 26
ORDER BY U.User_ID;
