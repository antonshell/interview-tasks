SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', 'Nora', 'Hintz');
INSERT INTO `author` VALUES ('2', 'Jazmin', 'Koelpin');
INSERT INTO `author` VALUES ('3', 'Nedra', 'Gibson');
INSERT INTO `author` VALUES ('4', 'Dandre', 'Muller');
INSERT INTO `author` VALUES ('5', 'Keely', 'Eichmann');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'Quo cupiditate vel neque.', 'Odit facilis ut sit at.');
INSERT INTO `book` VALUES ('2', 'Totam minima occaecati.', 'Et a molestiae dolorem at odit.');
INSERT INTO `book` VALUES ('3', 'Ipsa dolorem est eaque.', 'Qui impedit officiis recusandae eum eius eum ');
INSERT INTO `book` VALUES ('4', 'Quia consequatur in dignissimos pariatur.', 'Mollitia alias repudiandae voluptate facere d');
INSERT INTO `book` VALUES ('5', 'Aliquam modi ratione ut.', 'Labore voluptatum ut et iste.');
INSERT INTO `book` VALUES ('6', 'Nihil laborum quasi repellat in.', 'Praesentium sapiente repellendus dolores atqu');
INSERT INTO `book` VALUES ('7', 'Velit iste placeat sed.', 'Odit eaque quibusdam ipsa cumque.');
INSERT INTO `book` VALUES ('8', 'Dolorum alias omnis eos.', 'Quia veritatis quia omnis minus.');
INSERT INTO `book` VALUES ('9', 'Eaque harum id libero.', 'Sint consequatur eius sapiente rerum sit cupi');
INSERT INTO `book` VALUES ('10', 'Impedit enim porro.', 'Nihil sed deleniti adipisci facere consequatu');
INSERT INTO `book` VALUES ('11', 'Nobis magnam commodi totam.', 'Qui ut veritatis esse et minus sequi.');
INSERT INTO `book` VALUES ('12', 'Ut id.', 'Exercitationem error aliquam rerum nam volupt');
INSERT INTO `book` VALUES ('13', 'Dicta et repellendus corrupti.', 'Omnis praesentium soluta enim amet ratione ex');
INSERT INTO `book` VALUES ('14', 'Ut dolor.', 'Beatae architecto voluptatem ipsa est nesciun');
INSERT INTO `book` VALUES ('15', 'Quasi sed aliquam non.', 'Excepturi officia itaque provident quas qui e');

-- ----------------------------
-- Table structure for `book_author`
-- ----------------------------
DROP TABLE IF EXISTS `book_author`;
CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `fk_ba_author_id_idx` (`author_id`),
  CONSTRAINT `fk_ba_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ba_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_author
-- ----------------------------
INSERT INTO `book_author` VALUES ('1', '2');
INSERT INTO `book_author` VALUES ('1', '5');
INSERT INTO `book_author` VALUES ('2', '4');
INSERT INTO `book_author` VALUES ('3', '2');
INSERT INTO `book_author` VALUES ('4', '2');
INSERT INTO `book_author` VALUES ('4', '3');
INSERT INTO `book_author` VALUES ('4', '4');
INSERT INTO `book_author` VALUES ('5', '1');
INSERT INTO `book_author` VALUES ('5', '5');
INSERT INTO `book_author` VALUES ('6', '1');
INSERT INTO `book_author` VALUES ('6', '2');
INSERT INTO `book_author` VALUES ('6', '4');
INSERT INTO `book_author` VALUES ('6', '5');
INSERT INTO `book_author` VALUES ('7', '1');
INSERT INTO `book_author` VALUES ('7', '2');
INSERT INTO `book_author` VALUES ('7', '4');
INSERT INTO `book_author` VALUES ('8', '2');
INSERT INTO `book_author` VALUES ('9', '5');
INSERT INTO `book_author` VALUES ('10', '3');
INSERT INTO `book_author` VALUES ('10', '4');
INSERT INTO `book_author` VALUES ('11', '2');
INSERT INTO `book_author` VALUES ('11', '3');
INSERT INTO `book_author` VALUES ('12', '1');
INSERT INTO `book_author` VALUES ('12', '2');
INSERT INTO `book_author` VALUES ('12', '3');
INSERT INTO `book_author` VALUES ('12', '4');
INSERT INTO `book_author` VALUES ('13', '2');
INSERT INTO `book_author` VALUES ('13', '4');
INSERT INTO `book_author` VALUES ('13', '5');
INSERT INTO `book_author` VALUES ('14', '2');
INSERT INTO `book_author` VALUES ('14', '3');
INSERT INTO `book_author` VALUES ('14', '4');
INSERT INTO `book_author` VALUES ('14', '5');
INSERT INTO `book_author` VALUES ('15', '1');
INSERT INTO `book_author` VALUES ('15', '2');
INSERT INTO `book_author` VALUES ('15', '5');
