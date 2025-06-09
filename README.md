# <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="GitHub logo" width="32" height="32" /> Oracle Database
This project focuses on designing and implementing a relational database for a fictional social media platform.

---

## 📑 Table of Contents
- [Introduction](#introduction)
- [Project Files](#project-files)
  - [Creation and Population](#creation-and-population)
  - [Advanced Querying](#advanced-querying)

---

## 📘 Introduction

This project involves designing and implementing a relational database for a fictional social media platform. Based on a detailed specification, you will create an Entity-Relationship (ER) diagram and a series of SQL scripts to define, populate, and manage the database schema. The project emphasizes correct relational modeling of users, friendships, photos, albums, events, and more, while enforcing key constraints and relationships. You will also write SQL queries and views to facilitate data retrieval and reporting. This project provides hands-on experience with real-world database design, schema creation, and data manipulation using Oracle SQL, laying a foundation for advanced topics in database management systems.

---

## 🗂️ Project Files

The repository is organized as follows:

### Creation and Population

- [`ER_Diagram.pdf`](ER_diagram.pdf) — ER diagram for the plaform database.
- [`createTables.sql`](createTables.sql) — SQL script to create all tables, constraints, sequences, and triggers as required by the specification. Schema definition with:<br>- Core tables (Users, Friends, Cities)<br>- Education/Event structures<br>- Album/Photo circular dependency handling via `DEFERRABLE` constraints<br>- Triggers for ID sequencing and friend pair ordering
- [`dropTables.sql`](dropTables.sql) — SQL script to drop all database objects created by `createTables.sql`.
- [`loadData.sql`](loadData.sql) — SQL script handling data insertion from Public_User_Information, including:<br>- User/City relationships<br>- Education records<br>- Friend connections<br>- Event/Photo metadata<br>- Circular dependency resolution using transactions |
- [`createViews.sql`](createViews.sql) — SQL script defining database views for:<br>- User information aggregation<br>- Friend relationships<br>- Photo and album details<br>- Event metadata<br>- Tag data<br>Facilitates simplified querying and reporting across normalized tables.
- [`dropViews.sql`](dropViews.sql) — SQL script to drop all database objects created by `createTables.sql`.
- `README.md` — Project documentation (this file).

### Advanced Querying

Additional files (e.g., test scripts or documentation) may be included as needed.
- [`testquery0.sql`](testquery0.sql) — SQL queries to analyze user birth months including:
  - Counting users by month of birth
  - Listing users born in the most common birth month (November)
  - Listing users born in the least common birth month (February)
- [`testquery0.sql`](testquery0.sql) — SQL queries to analyze user birth months including:
  - Counting users by month of birth
  - Listing users born in the most common birth month (November)
  - Listing users born in the least common birth month (February)
- [`testquery0.sql`](testquery0.sql) — SQL queries to analyze user birth months including:
  - Counting users by month of birth
  - Listing users born in the most common birth month (November)
  - Listing users born in the least common birth month (February)
- [`testquery0.sql`](testquery0.sql) — SQL queries to analyze user birth months including:
  - Counting users by month of birth
  - Listing users born in the most common birth month (November)
  - Listing users born in the least common birth month (February)
- [`testquery1.sql`](testquery1.sql) — SQL queries for analyzing user first names, including:
  - Identifying names with the shortest and longest lengths
  - Counting occurrences of each first name and listing them by frequency
- [`testquery2.sql`](testquery2.sql) — SQL query identifying users with no friends using:<br>- `LEFT JOIN` with `UNION` subquery<br>- Null check for friend relationships<br>- Ordered by user ID
- [`testquery3.sql`](testquery3.sql) — SQL query listing users whose current city is different from their hometown city, using join operations and filtering for city ID inequality.
- [`testquery4.sql`](testquery4.sql) — SQL queries for tag analysis, including:
- Retrieving the two photos with the most user tags (with album info)
- Listing all users tagged in a specific photo (e.g. Photo_ID = 26)
- [`testquery5.sql`](testquery5.sql) — SQL queries identifying potential friend suggestions based on:<br>- Shared tagged photos<br>- Gender and age proximity (±2 years)<br>- Exclusion of existing friends via `MINUS` and `NOT EXISTS` operations
- [`testquery6.sql`](testquery6.sql) — SQL script implementing mutual friend analysis with:<br>- Bidirectional friendship modeling<br>- Mutual friend calculation via multi-view approach<br>- Top pair ranking based on mutual count<br>- Existing friend exclusion checks
- [`testquery7.sql`](testquery7.sql) — 	SQL script to identify the state with the highest number of events, including:
  - Creating and dropping an aggregate view
  - Counting events per state
  - Selecting the state(s) with the maximum event count
- [`testquery8.sql`](testquery8.sql) — SQL script analyzing friends of a specific user (ID=215) to identify:<br>- Oldest friend (minimum birth year/month)<br>- Youngest friend (maximum birth year/month)<br>- Uses view creation and `UNION` with inverse sorting criteria
- [`testquery9.sql`](testquery9.sql) — SQL query identifying user pairs potentially related as siblings based on:<br>- Shared last name<br>- Age difference <10 years<br>- Common hometown<br>- Existing friendship verification via `EXISTS` subquery<br>- Ordered by user IDs

---
