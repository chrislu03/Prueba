SELECT * FROM usuarios where fecha_registro >= DATE_SUB(NOW(), INTERVAL 30 DAY);

update usuarios set nombre = 'Edgar Ovelar' where id = 20;

DELETE FROM usuarios WHERE fecha_registro < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);