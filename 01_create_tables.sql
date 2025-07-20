-- This script creates the foundational tables for our social media analytics project.

-- Creating the Users table to store user information
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating the Posts table to store posts made by users
CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES Users(user_id),
    content TEXT NOT NULL,
    like_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating the Comments table
CREATE TABLE Comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INT NOT NULL REFERENCES Posts(post_id),
    user_id INT NOT NULL REFERENCES Users(user_id),
    comment_text VARCHAR(280) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating the Likes table
CREATE TABLE Likes (
    like_id SERIAL PRIMARY KEY,
    post_id INT NOT NULL REFERENCES Posts(post_id),
    user_id INT NOT NULL REFERENCES Users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (post_id, user_id)
);