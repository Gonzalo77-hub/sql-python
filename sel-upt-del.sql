USE Twitter;

INSERT INTO `twitter`.`users` (`id`, `first_name`, `last_name`, `handle`, `birthday`, `created_at`, `updated_at`) VALUES ('6', 'Gonzalo', 'Ibarra', 'gonza_77', '1989-10-25', '2021-10-25 11:28:00', '2021-10-25 11:28:00');
INSERT INTO `twitter`.`users` (`id`, `first_name`, `last_name`, `handle`, `birthday`, `created_at`, `updated_at`) VALUES ('7', 'Ricardo', 'Kaka', 'Kaka_22', '1982-04-22', '2021-10-25 11:28:00', '2021-10-25 11:28:00');
INSERT INTO `twitter`.`users` (`id`, `first_name`, `last_name`, `handle`, `birthday`, `created_at`, `updated_at`) VALUES ('8', 'Ronaldo', 'Nazario', 'Ronaldo_9', '1976-09-22', '2021-10-25 11:28:00', '2021-10-25 11:28:00');

UPDATE users set first_name = "Michael", last_name = "Jordan", handle='number_23', birthday='1963-02-17'  where id ='1';

DELETE from users where id = "4";

SELECT * from users 
where id in ('1','3','4');