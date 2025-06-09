# <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="GitHub logo" width="32" height="32" /> Oracle Database
This project focuses on designing and implementing a relational database for a fictional social media platform.

---

## 📑 Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)

---

## 📘 Introduction

The Oracle Database project tasks you with designing an Entity-Relationship (ER) diagram and implementing a relational schema using SQL scripts. The database models core social media features, including users, friendships, messages, photos, albums, events, and more. The schema and constraints must strictly follow the requirements and structure provided in the project specification.

---

## 🗂️ Project Structure

The repository is organized as follows:

- [`ER_Diagram.pdf`](ER_diagram.pdf) — ER diagram for the plaform database.
- [`createTables.sql`](createTables.sql) — SQL script to create all tables, constraints, sequences, and triggers as required by the specification. Schema definition with:<br>- Core tables (Users, Friends, Cities)<br>- Education/Event structures<br>- Album/Photo circular dependency handling via `DEFERRABLE` constraints<br>- Triggers for ID sequencing and friend pair ordering
- [`dropTables.sql`](dropTables.sql) — SQL script to drop all database objects created by `createTables.sql`.
- [`loadData.sql`](loadData.sql) — SQL script handling data insertion from Public_User_Information, including:<br>- User/City relationships<br>- Education records<br>- Friend connections<br>- Event/Photo metadata<br>- Circular dependency resolution using transactions |
- [`createViews.sql`](createViews.sql) — SQL script defining database views for:<br>- User information aggregation<br>- Friend relationships<br>- Photo and album details<br>- Event metadata<br>- Tag data<br>Facilitates simplified querying and reporting across normalized tables.
- [`dropViews.sql`](dropViews.sql) — SQL script to drop all database objects created by `createTables.sql`.
- `README.md` — Project documentation (this file).

Additional files (e.g., test scripts or documentation) may be included as needed.

---
