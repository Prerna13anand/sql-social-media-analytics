Social Media Analytics Backend - SQL Project

This repository contains the files for a backend database project for a social media analytics platform, completed as part of the Elevate Labs Internship. The goal of this project was to design and implement a relational database using PostgreSQL to manage users, posts, and engagement metrics like comments, likes, and hashtags.

A detailed project summary is available in FinalReport.pdf.

Features
Robust Relational Schema: A normalized schema with 6 tables (Users, Posts, Comments, Likes, Hashtags, Post_Hashtags) to ensure data integrity and model complex relationships.

Automation with Triggers: An advanced TRIGGER was implemented to automatically update a post's like_count in real-time whenever a new like is recorded, ensuring data consistency without manual intervention.

Many-to-Many Relationship: A hashtag tracking system was built using a bridge table (Post_Hashtags) to demonstrate a many-to-many relationship, allowing posts to have multiple hashtags and hashtags to be linked to multiple posts.

Simplified Analytical View: A VIEW (PostEngagement) was created to provide a simple, consolidated summary of each post's engagement, including total likes and comments.

Advanced Ranking Queries: The project uses window functions like RANK() to generate a ranked leaderboard of posts based on their engagement scores.

Database Schema
The database consists of six main tables:

Users: Stores user information.

user_id (Primary Key), username, email

Posts: Stores all posts made by users.

post_id (Primary Key), user_id (Foreign Key), content, like_count

Comments: Stores all comments on posts.

comment_id (Primary Key), post_id (Foreign Key), user_id (Foreign Key)

Likes: Tracks which user liked which post.

like_id (Primary Key), post_id (Foreign Key), user_id (Foreign Key)

Hashtags: Stores unique hashtag text.

hashtag_id (Primary Key), tag_text

Post_Hashtags: Links posts and hashtags.

post_id (Foreign Key), hashtag_id (Foreign Key)

Tools & Technologies
Language: SQL (PostgreSQL dialect)

Database: PostgreSQL

Management Tool: pgAdmin 4

How to Use
To recreate the database from scratch, execute the provided .sql scripts in a PostgreSQL environment (like pgAdmin) in the following order:

01_create_tables.sql

02_insert_data.sql

03_create_trigger.sql

04_create_view_and_rank.sql

05_add_hashtags.sql