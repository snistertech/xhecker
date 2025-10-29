-- Raven Bot database schema rebuild script.
-- Execute inside a MySQL or MariaDB session.

CREATE DATABASE IF NOT EXISTS `u819636537_raven_bot`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `u819636537_raven_bot`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` BIGINT UNSIGNED NOT NULL,
  `range` VARCHAR(16) NOT NULL DEFAULT 'USER',
  `credits` INT NOT NULL DEFAULT 0,
  `antispam` INT UNSIGNED NOT NULL DEFAULT 0,
  `status` VARCHAR(16) NOT NULL DEFAULT 'PENDING',
  `warns` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `plan` VARCHAR(16) NOT NULL DEFAULT 'Free',
  `expiry` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `keys` (
  `key` VARCHAR(64) NOT NULL,
  `status` VARCHAR(16) NOT NULL DEFAULT 'ACTIVE',
  `plan` VARCHAR(16) NOT NULL,
  `expiry` INT UNSIGNED NOT NULL DEFAULT 0,
  `credits` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`key`),
  KEY `idx_keys_status` (`status`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `gates` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu` VARCHAR(16) NOT NULL DEFAULT 'charge',
  `name` VARCHAR(120) NOT NULL,
  `type` VARCHAR(16) NOT NULL,
  `info` TEXT NOT NULL,
  `cmd` VARCHAR(64) NOT NULL,
  `file` VARCHAR(128) NOT NULL,
  `comm` TEXT NOT NULL,
  `format` TEXT DEFAULT NULL,
  `creation` VARCHAR(32) NOT NULL,
  `status` VARCHAR(16) NOT NULL DEFAULT 'ACTIVE',
  `extra` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_gates_cmd` (`cmd`),
  KEY `idx_gates_menu` (`menu`),
  KEY `idx_gates_type` (`type`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tools` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `type` VARCHAR(16) NOT NULL,
  `info` TEXT NOT NULL,
  `cmd` VARCHAR(64) NOT NULL,
  `format` TEXT DEFAULT NULL,
  `file` VARCHAR(128) DEFAULT NULL,
  `comm` TEXT NOT NULL,
  `creation` VARCHAR(32) NOT NULL,
  `status` VARCHAR(16) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_tools_cmd` (`cmd`),
  KEY `idx_tools_type` (`type`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- Optional owner seeding example (update values before executing):
-- INSERT INTO `users` (`id`, `range`, `credits`, `antispam`, `status`, `warns`, `plan`, `expiry`)
-- VALUES (5579729798, 'OWNER', 0, 0, 'ACTIVE', 0, 'VIP', 0)
-- ON DUPLICATE KEY UPDATE `range` = VALUES(`range`), `status` = VALUES(`status`);

