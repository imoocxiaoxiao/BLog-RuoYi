

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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog` */

insert  into `tb_blog`(`blog_id`,`blog_title`,`blog_sub_url`,`blog_cover_image`,`blog_content`,`blog_category_id`,`blog_category_name`,`blog_tags`,`blog_status`,`blog_views`,`enable_comment`,`is_deleted`,`create_time`,`update_time`) values (1,'我是zoro','about','/blog/admin/dist/img/rand/34.jpg','# About me\n\n自称ZORO，也可以叫我JOJO，一名Java开发者。很高兴认识各位，共勉！\n\n# Contact\n\n- 我的邮箱：971594738@qq.com\n- 我的网站地址：待补充',20,'About','java',1,295,0,0,'2020-06-07 00:31:15','2019-06-20 00:31:15'),(80,'Day525','','/blog/admin/dist/img/rand/11.jpg','ffff',25,'JAVA','java',1,51,0,1,'2019-07-22 13:46:57','2019-07-22 13:46:57'),(83,'test','','/blog/admin/dist/img/rand/1.jpg','推推推555',25,'JAVA','test',1,0,0,1,'2020-06-06 11:10:28','2020-06-06 11:10:28'),(84,'20200608','','/blog/admin/dist/img/rand/6.jpg','在今天',25,'JAVA','java',1,0,0,1,'2020-06-08 17:09:00','2020-06-08 17:09:00'),(85,'java','','/blog/admin/dist/img/rand/23.jpg','java',25,'JAVA','java',1,0,0,1,'2020-06-08 17:14:09','2020-06-08 17:14:09'),(86,'java','','/blog/admin/dist/img/rand/8.jpg','vavavava',25,'JAVA','java',1,1,0,1,'2020-06-08 17:16:47','2020-06-08 17:16:47'),(87,'感谢','thank','/blog/admin/dist/img/rand/21.jpg','# 本项目结合了RuoYi后台系统和十三的博客源码\n\n**链接[RuoYi后台系统](https://gitee.com/y_project/RuoYi \"RuoYi后台系统\")</br>** \n**链接[博客源码](https://github.com/ZHENFENG13/My-Blog \"博客源码\")**\n#### **感谢十三大佬和RuoYi**\n\n### 该项目把**十三**的**博客后端源码模块化**到**RuoYi**后台系统中。\n### 介绍RuoYi：\n**RuoYi**可以用于所有的Web应用程序，如网站管理后台，网站会员中心，CMS，CRM，OA。\n**RuoYi**是基于经典技术组合（Spring Boot、Apache Shiro、MyBatis、Thymeleaf、Bootstrap），内置模块如：\n**部门管理\n角色用户\n菜单及按钮授权\n数据权限\n系统参数\n日志管理\n通知公告等\n在线定时任务配置\n支持集群\n支持多数据源。**\n\n**十三的博客源码**也是基于 SpringBoot + Mybatis + Thymeleaf 等技术实现的 Java 博客系统,权限校验使用的是Spring Security,由于我整合了两者,把博客后台模块化到RuoYi中,因此本项目的权限校验部分变成了Shiro。\n**数据库**部分使用了Mysql数据库。由于**RuoYi**支持多数据源,因此我将涉及到BLog部分的表放在另一个库中。\n\n## 项目展示:\n### 后台展示:\n![展示图片1](http://127.0.0.1:8081/upload/20200610_14131336.png \"展示图片1\")\n\n### BLog主页:\n![展示图片2](http://127.0.0.1:8081/upload/20200610_14152358.png \"展示图片2\")\n\n\n\n\n# 完',25,'JAVA','感谢',1,61,0,0,'2020-06-10 14:16:47','2020-06-10 14:16:47'),(88,'我的开源项目!!!','opensource','/blog/admin/dist/img/rand/24.jpg','# 各位好,我的开源项目有:\n\n# 个人博客系统(也就是你看到的这个),详细阅读\"感谢\"页\nGitHub地址: </br>\nGitee 地址:\n\n# 基于Java的两个简单的漫画爬虫:\n\nGitHub地址: </br>\nGitee 地址:\n\n# 简单的Shiro例子,可适用于初学者了解Shiro:\nGitHub地址: </br>\nGitee 地址:',25,'JAVA','开源项目',1,6,0,0,'2020-06-10 14:57:09','2020-06-10 14:57:09');

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

insert  into `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) values (20,'About','/blog/admin/dist/img/category/13.png',36,0,'2019-06-26 00:28:49'),(22,'SSM','/blog/admin/dist/img/category/18.png',19,0,'2019-06-26 00:28:49'),(24,'日常随笔','/blog/admin/dist/img/category/06.png',45,0,'2019-06-26 00:28:49'),(25,'JAVA','/blog/admin/dist/img/category/02.png',126,0,'2019-06-26 00:28:49'),(26,'SS','/admin/dist/img/category/00.png',1,1,'2019-07-02 09:10:21'),(27,'Android','/blog/admin/dist/img/category/03.png',1,0,'2019-07-03 15:18:43'),(28,'test','/blog/admin/dist/img/category/00.png',1,1,'2020-06-06 09:04:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_comment` */

insert  into `tb_blog_comment`(`comment_id`,`blog_id`,`commentator`,`email`,`website_url`,`comment_body`,`comment_create_time`,`commentator_ip`,`reply_body`,`reply_create_time`,`comment_status`,`is_deleted`) values (34,80,'45','1455941195@qq.com','','你好','2019-07-25 10:57:26','','你还会或或','2020-06-05 08:12:29',1,1),(35,80,'one','145@qq.com','','yes','2020-06-08 09:04:07','','hello','2020-06-08 01:07:50',1,0);

/*Table structure for table `tb_blog_tag` */

DROP TABLE IF EXISTS `tb_blog_tag`;

CREATE TABLE `tb_blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag` */

insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (142,'java',1,'2019-07-22 13:25:24'),(143,'fdsf',1,'2019-07-22 13:40:02'),(144,'fds',1,'2019-07-22 13:40:02'),(145,'fdfsd',1,'2019-07-22 13:40:02'),(146,'d',1,'2019-07-22 13:40:02'),(147,'fsd',1,'2019-07-22 13:40:02'),(148,'fsdfdsf',1,'2019-07-22 13:40:02'),(149,'java',0,'2019-07-22 13:46:57'),(150,'test',0,'2020-06-06 09:19:25'),(151,'111',0,'2020-06-06 09:51:39'),(152,'感谢',0,'2020-06-10 14:16:47'),(153,'开源项目',0,'2020-06-10 14:57:09');

/*Table structure for table `tb_blog_tag_relation` */

DROP TABLE IF EXISTS `tb_blog_tag_relation`;

CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint(20) NOT NULL COMMENT '博客id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag_relation` */

insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (433,80,149,'2020-06-05 17:27:11'),(440,84,149,'2020-06-08 17:09:00'),(441,85,149,'2020-06-08 17:14:09'),(442,86,149,'2020-06-08 17:16:47'),(443,83,150,'2020-06-08 17:17:04'),(460,87,152,'2020-06-10 14:36:35'),(461,1,149,'2020-06-10 14:42:40'),(465,88,153,'2020-06-10 14:58:55');

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

insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerAbout','About','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerCopyRight','2020','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerICP','待补充','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerPoweredBy','https://github.com/oneonepiece','2019-05-02 06:33:07','2020-05-26 09:15:17'),('footerPoweredByURL','https://github.com/oneonepiece','2019-05-02 06:33:07','2020-05-26 09:15:17'),('websiteDescription','整合十三的blog和ruoyi的后台管理框架开发,ssm+shiro','2019-05-02 06:33:07','2020-06-10 03:57:00'),('websiteIcon','/blog/admin/dist/img/favicon.png','2019-05-02 06:33:07','2020-06-10 03:57:00'),('websiteLogo','/blog/admin/dist/img/logo2.png','2019-05-02 06:33:07','2020-06-10 03:57:00'),('websiteName','BLOG','2019-05-02 06:33:07','2020-06-10 03:57:00'),('yourAvatar','/blog/admin/dist/img/default-150x150.png','2019-05-02 06:33:07','2020-06-06 01:42:11'),('yourEmail','971594738@qq.com','2019-05-02 06:33:07','2020-06-06 01:42:11'),('yourName','ZORO','2019-05-02 06:33:07','2020-06-06 01:42:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
