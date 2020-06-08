/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.22 : Database - ruoyi_blog_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


/*Table structure for table `tb_blog` */

DROP TABLE IF EXISTS `tb_blog`;

CREATE TABLE `tb_blog` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) NOT NULL COMMENT '博客标题',
  `blog_sub_url` varchar(200) NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` varchar(200) NOT NULL COMMENT '博客封面图',
  `blog_content` mediumtext NOT NULL COMMENT '博客内容',
  `blog_category_id` int(11) NOT NULL COMMENT '博客分类id',
  `blog_category_name` varchar(50) NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` varchar(200) NOT NULL COMMENT '博客标签',
  `blog_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-草稿 1-发布',
  `blog_views` bigint(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `enable_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog` */

insert  into `tb_blog`(`blog_id`,`blog_title`,`blog_sub_url`,`blog_cover_image`,`blog_content`,`blog_category_id`,`blog_category_name`,`blog_tags`,`blog_status`,`blog_views`,`enable_comment`,`is_deleted`,`create_time`,`update_time`) values (1,'我是zoro','about','/blog/admin/dist/img/rand/36.jpg','## About me\n\n我是zoro，一名Java开发者,大三学生一枚。共勉！\n\n## Contact\n\n- 我的邮箱：971594738@qq.com\n- 我的网站：待补充',20,'About','java',1,260,0,0,'2017-03-12 00:31:15','2019-06-20 00:31:15'),(80,'Day525','','/blog/admin/dist/img/rand/11.jpg','ffff',25,'JAVA','java',1,12,0,0,'2019-07-22 13:46:57','2019-07-22 13:46:57'),(83,'test','','/blog/admin/dist/img/rand/1.jpg','推推推',25,'JAVA','test',1,0,0,0,'2020-06-06 11:10:28','2020-06-06 11:10:28');

/*Table structure for table `tb_blog_category` */

DROP TABLE IF EXISTS `tb_blog_category`;

CREATE TABLE `tb_blog_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) NOT NULL COMMENT '分类的名称',
  `category_icon` varchar(50) NOT NULL COMMENT '分类的图标',
  `category_rank` int(11) NOT NULL DEFAULT '1' COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_category` */

insert  into `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) values (20,'About','/blog/admin/dist/img/category/13.png',34,0,'2019-06-26 00:28:49'),(22,'SSM','/blog/admin/dist/img/category/18.png',19,0,'2019-06-26 00:28:49'),(24,'日常随笔','/blog/admin/dist/img/category/06.png',45,0,'2019-06-26 00:28:49'),(25,'JAVA','/blog/admin/dist/img/category/02.png',101,0,'2019-06-26 00:28:49'),(26,'SS','/admin/dist/img/category/00.png',1,1,'2019-07-02 09:10:21'),(27,'Android','/blog/admin/dist/img/category/03.png',1,0,'2019-07-03 15:18:43'),(28,'test','/blog/admin/dist/img/category/00.png',1,1,'2020-06-06 09:04:58');

/*Table structure for table `tb_blog_comment` */

DROP TABLE IF EXISTS `tb_blog_comment`;

CREATE TABLE `tb_blog_comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联的blog主键',
  `commentator` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` varchar(50) NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
  `commentator_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` varchar(200) NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `comment_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_comment` */

insert  into `tb_blog_comment`(`comment_id`,`blog_id`,`commentator`,`email`,`website_url`,`comment_body`,`comment_create_time`,`commentator_ip`,`reply_body`,`reply_create_time`,`comment_status`,`is_deleted`) values (34,80,'45','1455941195@qq.com','','你好','2019-07-25 10:57:26','','你还会或或','2020-06-05 08:12:29',1,0);

/*Table structure for table `tb_blog_tag` */

DROP TABLE IF EXISTS `tb_blog_tag`;

CREATE TABLE `tb_blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag` */

insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (142,'java',1,'2019-07-22 13:25:24'),(143,'fdsf',1,'2019-07-22 13:40:02'),(144,'fds',1,'2019-07-22 13:40:02'),(145,'fdfsd',1,'2019-07-22 13:40:02'),(146,'d',1,'2019-07-22 13:40:02'),(147,'fsd',1,'2019-07-22 13:40:02'),(148,'fsdfdsf',1,'2019-07-22 13:40:02'),(149,'java',0,'2019-07-22 13:46:57'),(150,'test',0,'2020-06-06 09:19:25'),(151,'111',0,'2020-06-06 09:51:39');

/*Table structure for table `tb_blog_tag_relation` */

DROP TABLE IF EXISTS `tb_blog_tag_relation`;

CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint(20) NOT NULL COMMENT '博客id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag_relation` */

insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (433,80,149,'2020-06-05 17:27:11'),(434,1,149,'2020-06-05 17:27:23'),(438,83,150,'2020-06-06 11:10:28');

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` varchar(200) NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_config` */

insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerAbout','About','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerCopyRight','2020','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerICP','待补充','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerPoweredBy','https://github.com/oneonepiece','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerPoweredByURL','https://github.com/oneonepiece','2019-05-02 06:33:07','2020-05-26 09:15:17'),('websiteDescription','整合十三的blog和ruoyi的后台管理框架开发,ssm+shiro','2019-05-02 06:33:07','2020-06-06 01:44:04'),('websiteIcon','/blog/admin/dist/img/favicon.png','2019-05-02 06:33:07','2020-06-06 01:44:04'),('websiteLogo','/blog/admin/dist/img/logo2.png','2019-05-02 06:33:07','2020-06-06 01:44:04'),('websiteName','BLOG','2019-05-02 06:33:07','2020-06-06 01:44:04'),('yourAvatar','/blog/admin/dist/img/default-150x150.png','2019-05-02 06:33:07','2020-06-06 01:42:11'),('yourEmail','971594738@qq.com','2019-05-02 06:33:07','2020-06-06 01:42:11'),('yourName','ZORO','2019-05-02 06:33:07','2020-06-06 01:42:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
