-- This creates a view that combines post, user, and comment data into a single, easy-to-query "virtual table."
CREATE OR REPLACE VIEW PostEngagement AS
SELECT
    p.post_id,
    p.content,
    u.username,
    p.like_count,
    (SELECT COUNT(c.comment_id) FROM Comments c WHERE c.post_id = p.post_id) AS comment_count
FROM
    Posts p
JOIN
    Users u ON p.user_id = u.user_id
ORDER BY
    p.post_id;

-- This query uses our new view and a window function to rank posts by engagement.
SELECT
    RANK() OVER (ORDER BY like_count DESC, comment_count DESC) AS post_rank,
    username,
    content,
    like_count,
    comment_count
FROM
    PostEngagement;