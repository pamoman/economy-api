DROP USER IF EXISTS 'pamoman'@'%';

CREATE USER 'pamoman'@'%'
IDENTIFIED
WITH mysql_native_password -- Only MySQL > 8.0.4
BY 'pamomanpass'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'pamoman'@'%'
WITH GRANT OPTION
;
