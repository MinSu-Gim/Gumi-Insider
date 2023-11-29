-- insider.`user` definition

CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `kakao_id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `kakao_name` varchar(255) NOT NULL,
  `thumbnail_image_url` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- insider.board definition

CREATE TABLE `board` (
  `board_id` bigint NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `view_count` int NOT NULL DEFAULT '0',
  `like_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`board_id`),
  KEY `board_author_fk` (`author_id`),
  CONSTRAINT `board_author_fk` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- insider.board_image definition

CREATE TABLE `board_image` (
  `board_image_id` bigint NOT NULL AUTO_INCREMENT,
  `board_id` bigint NOT NULL,
  `image_path` varchar(255) NOT NULL,
  PRIMARY KEY (`board_image_id`),
  KEY `board_image_fk` (`board_id`),
  CONSTRAINT `board_image_fk` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- insider.comment definition

CREATE TABLE `comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `board_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`comment_id`),
  KEY `comment_board_fk` (`board_id`),
  KEY `comment_author_fk` (`author_id`),
  CONSTRAINT `comment_author_fk` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comment_board_fk` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- insider.`like` definition

CREATE TABLE `like` (
  `user_id` bigint NOT NULL,
  `board_id` bigint NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`board_id`),
  KEY `like_board_id` (`board_id`),
  CONSTRAINT `like_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON UPDATE CASCADE,
  CONSTRAINT `like_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- insider.logged_in definition

CREATE TABLE `logged_in` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `access_date` varchar(255) NOT NULL,
  `remote_addr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logged_in_fk` (`user_id`),
  CONSTRAINT `logged_in_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- insider.reply definition

CREATE TABLE `reply` (
  `reply_id` bigint NOT NULL AUTO_INCREMENT,
  `comment_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `boardNo` bigint DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `reply_comment_fk` (`comment_id`),
  KEY `reply_author_fk` (`author_id`),
  CONSTRAINT `reply_author_fk` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `reply_comment_fk` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;