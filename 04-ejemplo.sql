SELECT now();

SELECT now(), curdate(), curtime(), year(now()), day(curdate());

SELECT month(curdate()), monthname(now());

SELECT day(now()), dayname(now()), dayofmonth(now()), dayofyear(now());

SELECT @@global.time_zone, @@session.time_zone;

SET time_zone = '-05:00';

SET global time_zone = '-05:00';