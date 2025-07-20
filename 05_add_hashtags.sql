-- Creates a table to store unique hashtags
CREATE TABLE Hashtags (
    hashtag_id SERIAL PRIMARY KEY,
    tag_text VARCHAR(100) UNIQUE NOT NULL
);

-- Creates a bridge table to link posts and hashtags
CREATE TABLE Post_Hashtags (
    post_id INT NOT NULL REFERENCES Posts(post_id),
    hashtag_id INT NOT NULL REFERENCES Hashtags(hashtag_id),
    PRIMARY KEY (post_id, hashtag_id) -- Ensures a hashtag is linked to a post only once
);

-- Insert the unique hashtags into the Hashtags table
INSERT INTO Hashtags (tag_text) VALUES ('#Analytics');

-- Link the post to the hashtag in the Post_Hashtags table
INSERT INTO Post_Hashtags (post_id, hashtag_id) VALUES (1, 1);

-- Query to find all posts that use a specific hashtag
SELECT
    p.post_id,
    p.content,
    u.username
FROM
    Posts p
JOIN
    Users u ON p.user_id = u.user_id
JOIN
    Post_Hashtags ph ON p.post_id = ph.post_id
JOIN
    Hashtags h ON ph.hashtag_id = h.hashtag_id
WHERE
    h.tag_text = '#Analytics';