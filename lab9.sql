CREATE FUNCTION total_cost() RETURNS FLOAT RETURN (SELECT sum(cost) FROM book);

CREATE PROCEDURE books_by_year(year int) BEGIN SELECT * FROM book WHERE YEAR(date) = year; END;

CREATE PROCEDURE cur()
BEGIN
  DECLARE pName VARCHAR(255);
  DECLARE done INT DEFAULT 0;
  DECLARE curs CURSOR FOR SELECT `publisher`.`name` FROM `publisher`;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
  OPEN curs;
  IF done = 0 THEN
    FETCH curs INTO pName;
  END IF;
  CLOSE curs;
END;

CREATE PROCEDURE cursYear(year int)
BEGIN
  DECLARE bTitle VARCHAR(255);
  DECLARE done INT DEFAULT 0;
  DECLARE curs CURSOR FOR SELECT `book`.`title` FROM `book` WHERE year(`book`.`date`) = year;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
  OPEN curs;
  WHILE done = 0 DO
    FETCH curs INTO bTitle;
    SELECT bTitle;
  END WHILE;
  CLOSE curs;
END;
