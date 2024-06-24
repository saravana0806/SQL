USE Students;
CREATE TABLE shop (
  article INT UNSIGNED DEFAULT '0000' NOT NULL,
  dealer CHAR(20) DEFAULT '' NOT NULL,
  price DECIMAL(16,2) DEFAULT '0.00' NOT NULL,
  PRIMARY KEY(article, dealer)
);

INSERT INTO shop VALUES
  (1, 'A', 3.45),
  (1, 'B', 3.99),
  (2, 'A', 10.99),
  (3, 'B', 1.45),
  (3, 'C', 1.69),
  (3, 'D', 1.25),
  (4, 'D', 19.95);


DELIMITER //
CREATE PROCEDURE dynamic(IN tbl CHAR(64), IN col CHAR(64))
BEGIN
  SET @s = CONCAT('SELECT ', col, ' FROM ', tbl);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL dynamic('shop', 'price');
