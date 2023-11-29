-- insider.board definition

CREATE TABLE `board` (
  `boardNo` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `hit` int(11) DEFAULT '0',
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `writerId` varchar(45) NOT NULL,
  `status` int(11) DEFAULT '1',
  `likes` int(11) DEFAULT '0',
  `folder` varchar(500) DEFAULT NULL,
  `originName` varchar(260) DEFAULT NULL,
  `saveName` varchar(270) DEFAULT NULL,
  PRIMARY KEY (`boardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;


-- insider.hibernate_sequence definition

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- insider.mealdto definition

CREATE TABLE `mealdto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kcal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photourl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- insider.`member` definition

CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kakao_id` bigint(20) DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `o_auth_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usernickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- insider.`path` definition

CREATE TABLE `path` (
  `path_id` bigint(20) NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `review_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- insider.report definition

CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_no` int(11) NOT NULL,
  `report` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reported_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- insider.store definition

CREATE TABLE `store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_hours` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- insider.tip definition

CREATE TABLE `tip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `good` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- insider.comment definition

CREATE TABLE `comment` (
  `commentNo` int(11) NOT NULL AUTO_INCREMENT,
  `boardNo` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `writerId` varchar(45) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`commentNo`),
  KEY `boardNo` (`boardNo`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`boardNo`) REFERENCES `board` (`boardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;


-- insider.likes definition

CREATE TABLE `likes` (
  `boardNo` int(11) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `Id` varchar(45) NOT NULL,
  PRIMARY KEY (`boardNo`,`Id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`boardNo`) REFERENCES `board` (`boardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- insider.reply definition

CREATE TABLE `reply` (
  `replyNo` int(11) NOT NULL AUTO_INCREMENT,
  `commentNo` int(11) NOT NULL,
  `boardNo` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `writerId` varchar(45) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`replyNo`),
  KEY `boardNo` (`boardNo`),
  KEY `commentNo` (`commentNo`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`boardNo`) REFERENCES `board` (`boardNo`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`commentNo`) REFERENCES `comment` (`commentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;


-- insider.review definition

CREATE TABLE `review` (
  `review_id` bigint(20) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `star` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `FK74d12ba8sxxu9vpnc59b43y30` (`store_id`),
  CONSTRAINT `FK74d12ba8sxxu9vpnc59b43y30` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;