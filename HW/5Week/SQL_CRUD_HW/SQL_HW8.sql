SELECT * FROM S_test.user_info;
DELETE FROM S_test.user_info
WHERE gender NOT IN ('Male', 'Female');
