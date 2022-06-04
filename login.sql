/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : login

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2022-06-04 15:48:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `key` char(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` char(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES ('wxApp', '关于我想学摄影小程序', '<p>    作为一名互联网时代的前端工程师，怎么能没有自己的小应用？？？</p><p><br></p><p><span class=\"ql-size-small\" style=\"color: rgb(68, 68, 68);\">    正好对摄影挺感兴趣的，几经周折学习，终于磕磕巴巴做出了这个小程序，哈哈哈。。。</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">主要使用到的技术，小程序不用多说。后端服务用的是基于nodejs的thinkjs，上一版用的是koa2，自从看了thinkjs发现这不是thinkphp的js版吗？哈哈哈，然后就咔咔咔用了一周时间写了这个小程序的后端服务。数据库用的mysql，当然作为一个前端，写的都很简单，没考虑那么多性能，校验什么的。也是一个边学边用的过程。</span></p><p><br></p><p><span class=\"ql-size-small\" style=\"color: rgb(68, 68, 68);\">    做为一个业余中的业余的前端摄影师，偶尔会拍点自认为还可以的照片发上去，喜欢的同学就点个赞。</span></p>');
INSERT INTO `about` VALUES ('wxDeveloper', '关于开发者', '<p class=\"ql-align-center\"><span class=\"ql-size-small\">14年毕业后，在前端领域磕磕绊绊也混了4年多，最底层前端开发一名。</span></p>');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '1234qwer');

-- ----------------------------
-- Table structure for article_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `comment_user_id` int DEFAULT NULL,
  `comment_text` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `create_date` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avater` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `article_commont` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of article_comment
-- ----------------------------
INSERT INTO `article_comment` VALUES ('22', '28', '30', '我只是想测试下评论功能，仅此而已，虽然照片也很美???', '2018-11-01 23:12:38', null, null, '0');
INSERT INTO `article_comment` VALUES ('23', '30', '30', '?????', '2018-11-10 14:11:48', null, null, '1');
INSERT INTO `article_comment` VALUES ('24', '28', null, '测是发顺丰', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '1');
INSERT INTO `article_comment` VALUES ('25', '28', null, '飞洒发', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '1');
INSERT INTO `article_comment` VALUES ('26', '28', null, '发 ', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');
INSERT INTO `article_comment` VALUES ('27', '28', null, '飞洒发', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');
INSERT INTO `article_comment` VALUES ('28', '34', null, 'hjhjkh', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '6');
INSERT INTO `article_comment` VALUES ('29', '35', null, 'ddd', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');
INSERT INTO `article_comment` VALUES ('30', '29', null, 'ddd', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');
INSERT INTO `article_comment` VALUES ('31', '35', null, 'dd', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');
INSERT INTO `article_comment` VALUES ('32', '35', null, 'dd', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');
INSERT INTO `article_comment` VALUES ('33', '29', null, '4545', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');
INSERT INTO `article_comment` VALUES ('34', '29', null, '7878', null, 'Sunshine', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132', '5');

-- ----------------------------
-- Table structure for article_kind_list
-- ----------------------------
DROP TABLE IF EXISTS `article_kind_list`;
CREATE TABLE `article_kind_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of article_kind_list
-- ----------------------------
INSERT INTO `article_kind_list` VALUES ('1', '新闻');
INSERT INTO `article_kind_list` VALUES ('2', '视频');
INSERT INTO `article_kind_list` VALUES ('3', '音乐');

-- ----------------------------
-- Table structure for article_list
-- ----------------------------
DROP TABLE IF EXISTS `article_list`;
CREATE TABLE `article_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kind_id` int DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `home_show` int DEFAULT '0',
  `views` int DEFAULT '0',
  `praises` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `shares` int DEFAULT '0',
  `comments` int DEFAULT '0',
  `create_date` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `update_date` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of article_list
-- ----------------------------
INSERT INTO `article_list` VALUES ('28', '日落', '//cdn6-banquan.ituchong.com/weili/l/918167611690188817.jpeg', '1', '2017年最后一天的日落。', 0x3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F796F3764733878346430732E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F626F7066786B33677569652E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F62797964356268763536662E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F676361666973756B7876622E6A7067223E3C2F703E, '1', '157', null, '5', '1', '2018-11-01 22:46:38', '2018-11-01 22:48:34');
INSERT INTO `article_list` VALUES ('29', '温榆河畔', '//cdn3-banquan.ituchong.com/weili/l/908911751015170156.jpeg', '1', '去年夏天在温榆河边拍的，今年不知什么时候，河边的树全被砍完了，光秃秃的。', 0x3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F6A627136313771373363662E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F63636276767A72663434652E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F676A75623861736F33382E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F3331693371793862776B752E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F356F796F34636E7978342E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F636373317662663765696F2E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F32746D317577316B3536702E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F616C6E32386239766E78642E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, '1', '37', '31', '1', '0', '2018-11-03 11:03:27', '2018-11-10 11:06:37');
INSERT INTO `article_list` VALUES ('30', '登鹳雀楼', 'https://s1.tuchong.com/content-image/202101/b66f4a0a68faa3e76dd41a98e1eaff91.jpg', '3', '“白日依山尽，黄河入海流。欲穷千里目，更上一层楼。”在来的途中，听小朋友们背了一路的《登鹳雀楼》，终于见到鹳雀楼真面目了。', 0x3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F34357473636379736475622E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F6C6D6661703639366837682E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F6938716532337466306A6C2E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F6F36686F75346F6D6B79642E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F66747771716D7A316E752E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F38677A3471383376746E2E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F68347273777732356B63772E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F6C766772317975647370632E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F6D6663723572326578672E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F6A6B76616A77356A72712E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F763332357A6C627A366B392E6A7067223E3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F7365727665722E726179646F6D2E77616E672F7374617469632F75706C6F6164496D672F787776393032386470672E6A7067223E3C2F703E, '1', '24', '30', '0', '1', '2018-11-10 13:50:11', '2018-11-10 14:01:49');
INSERT INTO `article_list` VALUES ('32', '动物好风景', 'https://s1.tuchong.com/content-image/202104/13d331f488b52e93681e7411a92d9659.jpg', null, 'ces ', 0x3C703E66646173667366736673613C2F703E, '1', '0', '', '0', '0', null, null);
INSERT INTO `article_list` VALUES ('33', '多陪伴老人', 'https://s1.tuchong.com/content-image/202104/a5432a1b63eb8555c622a0f5894a45c4.jpg', null, 's阿飞萨芬', 0x3C703EE68C89E697B6E58F91E694BE3C2F703E, '0', '0', '', '0', '0', null, null);
INSERT INTO `article_list` VALUES ('34', '端午节，多陪家人', 'https://cdn6-banquan.ituchong.com/weili/sm/658672714240884744.png', null, '飞洒发', 0xE5958AE58F91E69292, '0', '0', '0', '0', '0', null, null);
INSERT INTO `article_list` VALUES ('35', '父亲节，感谢付出', 'https://cdn3-banquan.ituchong.com/weili/sm/839643008096796733.webp', null, 'fdsadf', 0x667361666473, '0', '0', '113', '0', '0', null, null);

-- ----------------------------
-- Table structure for daily
-- ----------------------------
DROP TABLE IF EXISTS `daily`;
CREATE TABLE `daily` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imgUrl` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `content` char(128) NOT NULL DEFAULT '',
  `from` char(64) NOT NULL DEFAULT '',
  `day` char(2) DEFAULT '00',
  `month` char(2) DEFAULT '00',
  `year` char(4) DEFAULT '',
  `create_date` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `praises` int DEFAULT '0',
  `download` int DEFAULT '0',
  `update_date` char(32) DEFAULT '',
  `sort` int DEFAULT '0',
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of daily
-- ----------------------------
INSERT INTO `daily` VALUES ('14', 'https://videocdn.taobao.com/oss/ali-video/d6bc4ae3eb3c866bee9903d47d1210c6/video.mp4', '公益视频就地过年', 'Raydom', '13', '11', '2018', '2018-11-14 22:34:35', '13', '1', '2018-11-14 22:34:35', '154212480', '1');
INSERT INTO `daily` VALUES ('15', 'https://kvideo01.youju.sohu.com/7f40ba50-c8a8-487a-b1d0-8017d2081f7c2_0_0.mp4', '重磅会晤', '不抱怨的世界', '12', '11', '2018', '2022-06-21T16:00:00.000Z', '4', '1', '2018-11-15 17:05:14', '154203840', '1');
INSERT INTO `daily` VALUES ('17', 'http://vjs.zencdn.net/v/oceans.mp4', '高质量动画', '', '00', '00', '', '2022-06-20T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('18', 'http://vjs.zencdn.net/v/oceans.mp4', '广阔海洋等你探索', '', '00', '00', '', '2022-06-20T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('19', '', '郭德纲', '', '00', '00', '', '2022-06-20T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('20', 'localhost:3002/images/goods/movie1.mp4', '测试彩色', '', '00', '00', '', '2022-06-03T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('21', 'http://localhost:3002/images/goods/movie1.mp4', 'd的', '', '00', '00', '', '2022-06-22T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('23', 'http://localhost:3002/routes/admin/images/movie1.mp4', '测试', '', '00', '00', '', '2022-06-03T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('27', 'http://localhost:3002/images/goods/movie.mp4', 'last', '', '00', '00', '', '2022-06-03T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('28', 'https://vfine.oss-cn-beijing.aliyuncs.com/songs%2FsRAGBhwit2IlTZXdkYt0gGT3rCSI4IcFZ3F6FPgURJpooM0JTG.mp3', '闹元宵', '', '00', '00', '', '2022-06-21T16:00:00.000Z', '0', '0', '', '0', '2');
INSERT INTO `daily` VALUES ('29', 'http://localhost:3002/images/goods/movie.mp4', 'afs', '', '00', '00', '', '2022-06-03T16:00:00.000Z', '0', '0', '', '0', '1');
INSERT INTO `daily` VALUES ('30', 'https://vfine.oss-cn-beijing.aliyuncs.com/songs%2FsRAGBhwit2IlTZXdkYt0gGT3rCSI4IcFZ3F6FPgURJpooM0JTG.mp3', 'Just teLL Me', '', '00', '00', '', '2022-06-02T16:00:00.000Z', '0', '0', '', '0', '2');
INSERT INTO `daily` VALUES ('31', 'https://vfine.oss-cn-beijing.aliyuncs.com/songs%2F419e8b0b-84c1-4f49-8d23-3304a82a13d2.mp3', '莫扎特小调', '', '00', '00', '', '', '0', '0', '', '0', '2');
INSERT INTO `daily` VALUES ('32', 'https://img.tukuppt.com/newpreview_music/10/00/03/7/5c8a34395bf5621626.mp3', '再别康桥', '', '00', '00', '', '', '0', '0', '', '0', '2');
INSERT INTO `daily` VALUES ('33', 'https://cp-sycdn.kuwo.cn/867924abfa705401b559e8674b0468d2/629b0d16/resource/n3/35/5/1615658295.mp3', '孤勇者', '', '00', '00', '', '', '0', '0', '', '0', '2');
INSERT INTO `daily` VALUES ('34', 'https://lb-sycdn.kuwo.cn/5b67f53171525c38f32cb1719433ae83/629b0d49/resource/n2/97/80/3392961787.mp3', '身骑白马', '', '00', '00', '', '', '0', '0', '', '0', '2');
INSERT INTO `daily` VALUES ('35', 'https://lb-sycdn.kuwo.cn/ed79504f655b1a0193bff6889c655711/629b0d12/resource/n3/21/92/569482084.mp3', '眼泪落下之前', '', '00', '00', '', '', '0', '0', '', '0', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` int DEFAULT '0',
  `avatar` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `province` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `city` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_date` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `openid` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `country` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `praise_article` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `comment_article` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('30', 'Raydooom', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqE7UMLOYODjHTIpdpibgYNGCQnF7FsAicatibNR3kz5dWuGNicVaagg6c5nBaxrLtZkr5MSGmOFcMQnw/132', '', '', '2018-11-01 19:01:56', 'otvsK0cR45_mL-BKResOj9p2JtGc', '中国', '29,30,28', '30,28');
INSERT INTO `user` VALUES ('31', 'Magenta', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKbyQhBrQjwKtkK20TBKLLeHdCC3fHLJn4p52ydMH2l1EbTqqFkKCttZTpXrT9JibLxRmcicIad8veg/132', '河南', '郑州', '2018-11-01 19:04:26', 'otvsK0ZqDYwJIxbHiSBBYFf8RWO0', '中国', '', '');
INSERT INTO `user` VALUES ('32', '花荣', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIcpwzXOIMNqc3bzJTyqInEV6oKib3zHsOQFEf2R6NbLpMuNLTDomWOHsVicyEpThua9cewUgzwfkvQ/132', '', '', '2018-11-02 15:59:17', 'otvsK0b-ATMmSHEMEE9sbaQ44sE0', '', '', '');
INSERT INTO `user` VALUES ('33', '李应', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGrDY3cRGPxOU4grjqdnKKYTGibNaLEIKzFHYMEX0r0Yj8SkViaTtUE0UXEJibLypyGNRuSTqCiaGLgw/132', '', '', '2018-11-02 16:51:41', 'otvsK0WKuKOJB-6LbiOdXtM6SD0Q', '', '28', '');
INSERT INTO `user` VALUES ('34', '小悦悦', '0', '', '', '', '2018-11-03 15:55:24', 'otvsK0X5H1twdx3PXbFyKQqVVuQ8', '', '', '');
INSERT INTO `user` VALUES ('35', '鲁智深', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ0OUJicXE9EiccqmMGbgC4I1aiaN9qfXegI0frhvVZicnPztCjQQz7icEWtMYyG7VicAvQ6zeHZJy5fNfQ/132', '', '', '2018-11-03 16:27:03', 'otvsK0cy5W7Hw5YibgANqXg-8Dt8', '', '', '');
INSERT INTO `user` VALUES ('36', '方群', '2', 'https://wx.qlogo.cn/mmopen/vi_32/LWicoUend7QPKEWiaJqdPyuBIibeLVTBvicicMfK8dFoJUDaRxA18ibLrNPnuHrXTLmOkTvozJ8mMyTnlLL2qVezUSjg/132', 'Hunan', 'Shaoyang', '2018-11-13 19:50:02', 'otvsK0aq1ftzjIHwQmS9y33RAG_I', 'China', '', '');
