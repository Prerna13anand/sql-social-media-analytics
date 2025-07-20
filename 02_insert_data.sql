-- This script populates our tables with new sample data to simulate user activity.

-- Insert sample users with new names
INSERT INTO Users (username, email) VALUES
('omi', 'omi@example.com'),
('prerna', 'prerna@example.com'),
('khushi', 'khushi@example.com');

-- Insert sample posts from our new users
-- Note: user_id 1 is Omi, 2 is Prerna, 3 is Khushi
INSERT INTO Posts (user_id, content) VALUES
(1, 'Just starting my SQL journey! #Analytics so excited!'), -- Post by Omi
(2, 'Building a new project is always exciting... and a little scary haha.'), -- Post by Prerna
(1, 'Okay, I am loving the power of PostgreSQL! This is cool.'),           -- Another post by Omi
(3, 'Does anyone have a good dataset for chocolate consumption? Asking for a friend... the friend is me.'); -- Post by Khushi

-- Insert new, more human-like sample comments
INSERT INTO Comments (post_id, user_id, comment_text) VALUES
-- Prerna and Khushi comment on Omi's first post (post_id 1)
(1, 2, 'Awesome! It''s super useful, you''ll see.'),
(1, 3, 'Welcome to the data side! :D'),

-- Omi comments on Prerna's post (post_id 2)
(2, 1, 'Haha I feel that! What are you building?'),

-- Prerna comments on Omi's second post (post_id 3)
(3, 2, 'See, told you it was cool!'),

-- Omi comments on Khushi's post (post_id 4)
(4, 1, 'Haha, now that''s a dataset I can get behind. For science, of course.'),

-- Khushi replies to Omi on her own post
(4, 3, 'Exactly! It''s a very serious inquiry.');


-- Insert sample likes (linking to the same posts)
-- Everyone likes Omi's first post
INSERT INTO Likes (post_id, user_id) VALUES
(1, 1),
(1, 2),
(1, 3);

-- Omi and Khushi like Prerna's post
INSERT INTO Likes (post_id, user_id) VALUES
(2, 1),
(2, 3);

-- Prerna likes Omi's second post
INSERT INTO Likes (post_id, user_id) VALUES
(3, 2);

-- Omi and Prerna like Khushi's funny post
INSERT INTO Likes (post_id, user_id) VALUES
(4, 1),
(4, 2);