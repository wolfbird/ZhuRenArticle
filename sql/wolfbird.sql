/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.49 : Database - wolfbird
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wolfbird` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wolfbird`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_avatar` varchar(255) DEFAULT NULL,
  `article_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_value` int(11) DEFAULT NULL,
  `article_content` varchar(2550) DEFAULT NULL,
  `article_hidden` int(11) DEFAULT NULL,
  `article_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`article_id`,`user_id`,`article_avatar`,`article_date`,`article_value`,`article_content`,`article_hidden`,`article_title`) values (17,7,'pig1.png','2017-09-11 16:59:00',-1,'做人最实在的“十句话”<br>&emsp;&emsp;1.遇到乞讨者：遇到要钱的就给他(她)点饭，遇到要饭的就给他(她)点钱。　　<br>&emsp;&emsp;2.上车遇到老弱病残、孕妇：让座的时候别动声色，也别大张旗鼓。站起来用身体挡住其他人留出空位子给需要的人，然后装作下车走远点。人太多实在走不远，人家向你表示谢意的时候微笑一下。　　<br>&emsp;&emsp;3.雨雪的时候、天冷的傍晚或者是雪天的傍晚，遇到卖菜的、卖水果的、卖报纸的剩的不多了又不能回家，能全买就全买，不能全买就买一份，反正吃什么也是吃，看什么也是看，买下来让人早点回家。　　<br>&emsp;&emsp;4.遇到迷路的小孩和老头老太太，能送回家送回家，不能送回家的送上车、送到***也行，如果有电话的替老人或小孩打个电话就走，反正你也不缺那两个电话费。　　<br>&emsp;&emsp;5.遇到迷路的人打听某个地址，碰巧你又知道，就主动告诉一声。别不好意思，没有人笑话你。　　<br>&emsp;&emsp;6.捡到钱包就找找失主，如果你实在缺钱就把现金留下。打电话告诉失主就说你在厕所里捡到的。把信用卡、身份证、驾驶执照还给人家，一般人家也不会在乎钱了。把人家的地址记在你的笔记本上，以后发达了去找人家道个谦，把钱还给人家。　　<br>&emsp;&emsp;7.遇到学生出来打工的、勤工俭学的，特别是中学生、小姑娘。她卖什么你就买点，如果她不是家庭困难，出来打工也需要勇气的，鼓励鼓励她吧。　　<br>&emsp;&emsp;8.遇到夜里摆地摊的，能买就多买一些，别还价，东西都不贵。家境哪怕好一点，谁会大冷天夜里摆地摊。　　<br>&emsp;&emsp;9.如果钱还宽裕，别养二奶，偷偷养几个贫困山区的学生。别让人家知道你是谁，要不然见面了多尴尬，多不好意思。但是你心里一定会觉得舒坦，比***提心吊胆的要好得多。如果真想包也可以包一个，好事坏事一起做。人吗，本来就复杂。　　<br>&emsp;&emsp;10.如果时间还宽裕，而且碰巧觉得我说的在理，那就顶一下我的贴子，总比去顶看了没什么收获的贴子舒服。时间宽裕不少就请把这几句话多转几个地方，毕竟好人多了咱们心里也舒坦。',0,'来看看吧，兄弟们'),(22,8,'pig1.png','2017-09-12 14:15:18',1,'<p>玩儿we</p><p>we 饿</p><p>&nbsp;沃尔沃</p><p>wewe</p><p>&nbsp;额问问</p><p>&nbsp;玩儿w</p><p>&nbsp;问问</p><p>我玩儿我</p><p>&nbsp;we</p><p><br/></p><p><br/></p>',0,'我任务而'),(23,4,'7f45e4ad-cb06-4fc7-82d8-24a35edad8e6.png','2017-09-15 03:13:04',0,'<p>饭店和东方红<br/></p>',0,'的风格和风格的话'),(24,14,'aaec5a44-e77e-4852-b2e0-c7c449d95301.png','2017-09-15 06:07:06',0,'<p>&nbsp;热液热液</p>',0,'惹人眼');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `comment_content` varchar(255) DEFAULT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_hidden` int(11) DEFAULT NULL,
  `comment_value` int(11) DEFAULT NULL,
  `comment_read` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`comment_id`,`user_id`,`article_id`,`comment_content`,`comment_date`,`comment_hidden`,`comment_value`,`comment_read`) values (3,1,3,'您是真的睿智','2017-09-06 21:17:45',0,0,0),(4,5,3,'希望早日看到您的新专辑','2017-09-06 21:23:48',0,0,0),(9,8,22,'牛皮','2017-09-14 02:29:37',0,0,0);

/*Table structure for table `garner` */

DROP TABLE IF EXISTS `garner`;

CREATE TABLE `garner` (
  `garner_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `garner_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `garner_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`garner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `garner` */

/*Table structure for table `star` */

DROP TABLE IF EXISTS `star`;

CREATE TABLE `star` (
  `star_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `star_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `star_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`star_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `star` */

insert  into `star`(`star_id`,`user_id`,`article_id`,`star_date`,`star_value`) values (4,5,3,'2017-09-06 21:29:23',1),(5,1,25,'2017-09-13 22:09:32',1),(12,8,22,'2017-09-14 02:34:49',1),(13,4,17,'2017-09-14 15:24:55',-1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role` int(11) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `user_bio` varchar(255) DEFAULT NULL,
  `user_value` int(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_role`,`user_name`,`user_password`,`user_avatar`,`user_location`,`user_bio`,`user_value`) values (1,NULL,'1','1','pig2.png','不知道','这人啥也没说',0),(4,NULL,'韬酱','123','7f45e4ad-cb06-4fc7-82d8-24a35edad8e6.png','206猪圈','这人啥也没说',0),(5,NULL,'你的胖虎哥哥','123','pig3.png','不知道','这人啥也没说',0),(6,NULL,'李狗十万阴兵','123','pig1.png','不知道','这人啥也没说',0),(7,NULL,'教您做“人”','123','pig1.png','不知道','这人啥也没说',0),(8,NULL,'苏打明','123','14b0cd5c-0e55-4326-9511-fc02dffd1ff3.png','不知道','这人啥也没说',0),(14,NULL,'黄波','123','aaec5a44-e77e-4852-b2e0-c7c449d95301.png','地区不明','这人啥也没说',0),(15,NULL,'我是你爹','123','pig2.png','地区不明','这人啥也没说',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
