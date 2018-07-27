create table `test_table` ( `req_id` bigint(20) NOT NULL, `status` varchar(55) default null, `delivery_status` varchar(55) default null, primary key (`req_id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DELIMITER $$
CREATE PROCEDURE insert_test_data()
BEGIN
  DECLARE i INT DEFAULT 1;

  WHILE i < 10 DO
    INSERT INTO `test_table` (`req_id`, `status`, `delivery_status`)
    SELECT `req_id`, `status`, `delivery_status`
    FROM `test_table`
    WHERE req_id = 1;
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
CALL insert_test_data();
DROP PROCEDURE insert_test_data;