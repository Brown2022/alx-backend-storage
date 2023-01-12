-- Create a stored procedure ComputeAverageScoreForUser
-- that compute and store the average score foe a student.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMETER $$
CREATE PROCEDURE ComputeAverageScoreForUser (user_id INT)
BEGIN
	DECLARE total_score INT DEFAULT 0;
	DECLARE project_count INT DEFAULT 0;

	SELECT SUM(score)

		INTO total_score
		FROM corrections
		WHERE correction.user_id = user_id;
	SELECT COUNT(*)
		INTO projects_count
		FROM corrections
		WHERE correction.user_id = user_id;

	UPDATE users
		SET users.average_score = IF(projects_count = 0, 0, total_score
	/ projects_count)
	WHERE users.id = user_id;
END $$
DLIMETER ;
