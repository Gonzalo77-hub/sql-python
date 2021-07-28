USE amigos;


SELECT amigos.first_name, amigos.last_name, a.first_name, a.last_name
FROM users a RIGHT JOIN friendships b ON a.id = b.user_id
LEFT JOIN users AS amigos ON b.friend_id = amigos.id
WHERE amigos.first_name='Kermit';

SELECT CONCAT(a.first_name," ",a.last_name) AS name_user, COUNT(*) AS cantidad_de_amigos
FROM users a LEFT JOIN friendships b ON a.id = b.user_id
LEFT JOIN users AS amigos ON b.friend_id = amigos.id
GROUP BY name_user;

SELECT CONCAT(a.first_name," ",a.last_name) AS name_user, COUNT(*) AS cantidad_de_amigos, GROUP_CONCAT( distinct amigos.first_name order by amigos.first_name separator ', ') AS nombre_amigos 
FROM users a LEFT JOIN friendships b ON a.id = b.user_id
LEFT JOIN users AS amigos ON b.friend_id = amigos.id
GROUP BY name_user
ORDER BY cantidad_de_amigos DESC
limit 1;

INSERT INTO `amigos`.`users` (`first_name`, `last_name`, `created_at`) VALUES ('gonzalo', 'Ibarra', '2021-07-26 18:50:00');
INSERT INTO `friendships` (`user_id`, `friend_id`, `created_at`) VALUES ('6', '2', '2021-07-26 18:50:00');
INSERT INTO `friendships` (`user_id`, `friend_id`, `created_at`) VALUES ('6', '4', '2021-07-26 18:50:00');
INSERT INTO `friendships` (`user_id`, `friend_id`, `created_at`) VALUES ('6', '5', '2021-07-26 18:50:00');

SELECT CONCAT(a.first_name," ",a.last_name) AS name_user, CONCAT(amigos.first_name," ",amigos.last_name) AS name_amigos
FROM users a LEFT JOIN friendships b ON a.id = b.user_id
LEFT JOIN users AS amigos ON b.friend_id = amigos.id
WHERE a.first_name LIKE 'Eli%'
GROUP BY name_amigos
order by name_amigos;

DELETE 
from friendships
WHERE friendships.user_id = '2' and friendships.friend_id='5';


SELECT CONCAT(a.first_name," ",a.last_name) AS name_user, GROUP_CONCAT( distinct CONCAT(amigos.first_name," ",amigos.last_name) order by CONCAT(amigos.first_name," ",amigos.last_name) separator ', ') AS nombre_amigos 
FROM users a LEFT JOIN friendships b ON a.id = b.user_id
JOIN users AS amigos ON b.friend_id = amigos.id
GROUP BY name_user;




