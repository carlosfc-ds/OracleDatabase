INSERT INTO Users 
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

INSERT INTO Cities(city_name, state_name, country_name)
SELECT DISTINCT current_city, current_state, current_country
FROM project1.Public_User_Information;

INSERT INTO User_Current_Cities
SELECT DISTINCT PUI.user_id, C.city_id 
FROM project1.Public_User_Information PUI, Cities C
WHERE PUI.current_city = C.city_name;

INSERT INTO User_Hometown_Cities
SELECT DISTINCT PUI.user_id, C.city_id 
FROM project1.Public_User_Information PUI, Cities C
WHERE PUI.hometown_city = C.city_name;

INSERT INTO Programs(institution, concentration, degree)
SELECT DISTINCT institution_name, program_concentration, program_degree
FROM project1.Public_User_Information
WHERE institution_name IS NOT NULL;

INSERT INTO Education
SELECT DISTINCT PUI.user_id, P.program_id, PUI.program_year
FROM project1.Public_User_Information PUI, Programs P
WHERE (PUI.institution_name = P.institution AND PUI.program_concentration = P.concentration AND PUI.program_degree = P.degree);

INSERT INTO Friends
SELECT user1_id, user2_id
FROM project1.Public_Are_Friends;

INSERT INTO User_Events
SELECT PEI.event_id, PEI.event_creator_id, PEI.event_name, PEI.event_tagline, PEI.event_description, 
PEI.event_host, PEI.event_type, PEI.event_subtype, PEI.event_address, C.city_id, PEI.event_start_time, 
PEI.event_end_time 
FROM project1.Public_Event_Information PEI, Cities C
WHERE PEI.event_city = C.city_name;

-- Circular Dependency
SET AUTOCOMMIT OFF;

INSERT INTO Photos
SELECT photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link
FROM project1.Public_Photo_Information;

INSERT INTO Albums
SELECT DISTINCT album_id, owner_id, album_name, album_created_time, album_modified_time, album_link,
album_visibility, cover_photo_id
FROM project1.Public_Photo_Information;

COMMIT;
SET AUTOCOMMIT ON;
-- End Circular Dependency

INSERT INTO Tags
SELECT photo_id, tag_subject_id, tag_created_time, tag_x_coordinate, tag_y_coordinate
FROM project1.Public_Tag_Information;
