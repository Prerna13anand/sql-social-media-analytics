-- This function contains the logic to update the like count.
CREATE OR REPLACE FUNCTION update_like_count_on_post()
RETURNS TRIGGER AS $$
BEGIN
    -- Update the like_count in the Posts table for the post that was just liked.
    UPDATE Posts
    SET like_count = (SELECT COUNT(*) FROM Likes WHERE post_id = NEW.post_id)
    WHERE post_id = NEW.post_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- This trigger attaches the function to the Likes table.
-- It will fire AFTER any INSERT operation on the table.
CREATE TRIGGER on_new_like_trigger
AFTER INSERT ON Likes
FOR EACH ROW
EXECUTE FUNCTION update_like_count_on_post();