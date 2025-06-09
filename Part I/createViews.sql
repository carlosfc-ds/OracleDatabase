CREATE VIEW View_User_Information AS
SELECT u.user_id, u.first_name, u.last_name, u.year_of_birth, u.month_of_birth, u.day_of_birth, u.gender,
       c.city_name as current_city, c.state_name as current_state, c.country_name as current_country,
       h.city_name as hometown_city, h.state_name as hometown_state, h.country_name as hometown_country, 
       p.institution, e.program_year, p.concentration, p.degree 
FROM Users u
    INNER JOIN User_Current_Cities
        ON User_Current_Cities.user_id = u.user_id
    INNER JOIN Cities c
        ON User_Current_Cities.current_city_id = c.city_id
    INNER JOIN User_Hometown_Cities
        ON User_Hometown_Cities.user_id = u.user_id
    INNER JOIN Cities h
        ON User_Hometown_Cities.hometown_city_id = h.city_id
    LEFT JOIN Education e
        ON e.user_id = u.user_id 
    LEFT JOIN Programs p
        ON p.program_id = e.program_id;


CREATE VIEW View_Are_Friends AS 
SELECT user1_id, user2_id 
FROM Friends;

CREATE VIEW View_Photo_Information AS 
SELECT a.album_id, a.album_owner_id as owner_id, a.cover_photo_id, a.album_name, a.album_created_time, a.album_modified_time, a.album_link, a.album_visibility, p.photo_id, p.photo_caption, p.photo_created_time, p.photo_modified_time, p.photo_link 
FROM Albums a 
    INNER JOIN Photos p 
        ON p.album_id = a.album_id;

CREATE VIEW View_Event_Information AS 
SELECT e.event_id, e.event_creator_id, e.event_name, e.event_tagline, e.event_description, e.event_host, e.event_type, e.event_subtype, e.event_address, c.city_name as event_city, c.state_name as event_state, c.country_name as event_country, e.event_start_time, e.event_end_time 
FROM User_Events e 
    INNER JOIN Cities c 
        ON c.city_id = e.event_city_id;

CREATE VIEW View_Tag_Information AS 
SELECT tag_photo_id as photo_id, tag_subject_id, tag_created_time, tag_x as tag_x_coordinate, tag_y as tag_y_coordinate 
FROM Tags;