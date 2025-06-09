
-- Create the view
CREATE VIEW State_Event AS
SELECT PC.State_Name, COUNT(*) AS Event_Count
FROM project2.Public_User_Events PUE
JOIN project2.Public_Cities PC 
ON PUE.Event_City_ID = PC.City_ID
GROUP BY PC.State_Name;

-- Query the view to find the state with the maximum event count
SELECT SE.State_Name, SE.Event_Count
FROM State_Event SE
WHERE SE.Event_Count = (SELECT MAX(SE2.Event_Count) FROM State_Event SE2)
ORDER BY SE.State_Name ASC;

-- Drop the view
DROP VIEW State_Event;
