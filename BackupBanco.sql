CREATE TABLE `mdtPolicia_tablet_fixa` (
	`user_id` INT(11) NOT NULL,
	`penalidade` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`descricao` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`oficial` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`valordapenalidade` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`data` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdtPolicia_tablet_img` (
	`user_id` INT(11) NOT NULL,
	`img` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`user_id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `mdt_historico` (
	`user_id` INT(11) NULL DEFAULT NULL,
	`motivo` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`time` INT(11) NULL DEFAULT NULL
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
