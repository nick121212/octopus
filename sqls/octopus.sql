-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: octopus
-- ------------------------------------------------------
-- Server version	5.5.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `parentKey` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `optype` int(11) DEFAULT '0',
  `title` varchar(10) NOT NULL,
  `icon` varchar(10) DEFAULT NULL,
  `searchSchemaKey` varchar(50) DEFAULT NULL,
  `formSchemaKey` varchar(50) DEFAULT NULL,
  `dataSchemaKey` varchar(50) DEFAULT NULL,
  `templateUrl` varchar(100) DEFAULT NULL,
  `controller` varchar(50) DEFAULT NULL,
  `linkUrl` varchar(30) DEFAULT NULL,
  `columns` text,
  `clearCurrentItem` tinyint(1) DEFAULT '0',
  `interfaces` text,
  `isList` tinyint(1) DEFAULT '0',
  `isRefresh` tinyint(1) DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `defaultDatas` text,
  `isNeedDetail` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `action_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'menu-view','module',1,1,'menus列表数据','pageview','module-form-search',NULL,'module-data','','','','[{\"name\":\"ID\",\"template\":\"item.id\"},{\"name\":\"名称\",\"template\":\"item.title\"},{\"name\":\"KEY\",\"template\":\"item.key\"},{\"name\":\"图标\",\"template\":\"<ng-md-icon icon=\'{{item.icon}}\'></ng-md-icon>\"},{\"name\":\"链接\",\"template\":\"item.link\"},{\"name\":\"lft\",\"template\":\"item.lft\"},{\"name\":\"rgt\",\"template\":\"item.rgt\"}]',0,'[\"menus-fetch\"]',1,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(2,'menu-add','module',4,4,'新建模块','add',NULL,'module-form-add&edit','module-data','','','',NULL,1,'[\"menus-add\"]',0,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(3,'menu-child-add','module',2,4,'新建子模块','add',NULL,'module-form-add&edit','module-data','','','',NULL,1,'[\"menus-add\"]',0,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45','{\n  \"parentKey\": {\n    \"path\": \"currentItem.key\"\n  }\n}',0),(4,'menu-edit','module',2,4,'修改模块','edit',NULL,'module-form-add&edit','module-data','','','',NULL,0,'[\"menus-id-edit\"]',0,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(5,'menu-delete','module',2,2,'删除模块','delete',NULL,'module-form-add&edit','module-data','','','',NULL,0,'[\"menus-id-delete\"]',0,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(6,'schema-view','schema',1,1,'SCHEMA列表数据','pageview','schema-form-search',NULL,'schema-data','','','','[{\"name\":\"ID\",\"template\":\"item.id\"},{\"name\":\"KEY\",\"template\":\"item.key\"},{\"name\":\"DESCTRIBUTION\",\"template\":\"item.description\"}]',0,'[\"schemas-fetch\"]',1,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(7,'schema-add','schema',4,4,'新建SCHEMA','add','schema-form-search','schema-form-add&edit','schema-data','','','',NULL,0,'[\"schemas-add\"]',0,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(8,'schema-edit','schema',2,4,'修改SCHEMA','edit',NULL,'schema-form-add&edit','schema-data','','','',NULL,0,'[\"schemas-id-edit\"]',0,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(9,'schema-delete','schema',2,2,'删除SCHEMA','delete',NULL,'','','','','',NULL,0,'[\"schemas-id-delete\"]',0,1,NULL,'2016-03-15 07:05:32','2016-04-08 03:43:45',NULL,0),(10,'action-view','action',1,1,'ACTION列表操作','pageview','action-form-search',NULL,'action-data',NULL,NULL,NULL,'[\n  {\n    \"name\": \"ID\",\n    \"template\": \"item.id\"\n  },\n  {\n    \"name\": \"key\",\n    \"template\": \"item.key\"\n  },\n  {\n    \"name\": \"标题\",\n    \"template\": \"item.title\"\n  },\n  {\n    \"name\": \"ICON\",\n    \"template\": \"<ng-md-icon ng-if=\'item.icon\' icon=\'{{item.icon}}\'></ng-md-icon>\"\n  },\n  {\n    \"name\": \"菜单类型\",\n    \"template\": \"item.type\"\n  },\n  {\n    \"name\": \"操作类型\",\n    \"template\": \"item.optype\"\n  },\n  {\n    \"name\": \"搜索SCHEMA\",\n    \"template\": \"item.searchSchemaKey\"\n  },\n  {\n    \"name\": \"表单SCHEMA\",\n    \"template\": \"item.formSchemaKey\"\n  },\n  {\n    \"name\": \"数据SCHEMA\",\n    \"template\": \"item.dataSchemaKey\"\n  },\n  {\n    \"name\": \"列表页?\",\n    \"template\": \"<ng-md-icon icon=\'{{item.isList?\\\"done\\\":\\\"clear\\\"}}\'></ng-md-icon>\"\n  },\n  {\n    \"name\": \"刷新否？\",\n    \"template\": \"<ng-md-icon icon=\'{{item.isRefresh?\\\"done\\\":\\\"clear\\\"}}\'></ng-md-icon>\"\n  }\n]',0,'[\"actions-fetch\"]',1,1,NULL,'0000-00-00 00:00:00','2016-04-08 03:43:45',NULL,0),(11,'action-add','action',4,4,'新建操作','add',NULL,'action-form-add&edit','action-data',NULL,NULL,NULL,NULL,0,'[\"actions-add\"]',0,1,NULL,'0000-00-00 00:00:00','2016-04-08 03:43:45',NULL,0),(12,'action-edit','action',2,4,'修改操作','edit',NULL,'action-form-add&edit','action-data',NULL,NULL,NULL,NULL,0,'[\"actions-id-edit\"]',0,1,NULL,'0000-00-00 00:00:00','2016-04-08 03:43:45',NULL,0),(13,'action-delete','action',2,2,'删除操作','delete',NULL,'','',NULL,NULL,NULL,NULL,0,'[\"actions-id-delete\"]',0,1,NULL,'0000-00-00 00:00:00','2016-04-08 03:43:45',NULL,0),(14,'interface-view','interface',1,1,'接口viewlist','pageview','interface-form-search',NULL,'interface-data',NULL,NULL,NULL,'[\n  {\n    \"name\": \"ID\",\n    \"template\": \"item.id\"\n  },\n  {\n    \"name\": \"KEY\",\n    \"template\": \"item.key\"\n  },\n  {\n    \"name\": \"地址\",\n    \"template\": \"item.baseUrl\"\n  },\n  {\n    \"name\": \"端口\",\n    \"template\": \"item.port\"\n  },\n  {\n    \"name\": \"api\",\n    \"template\": \"item.api\"\n  },\n  {\n    \"name\": \"协议\",\n    \"template\": \"item.verb\"\n  },\n  {\n    \"name\": \"前缀\",\n    \"template\": \"item.prefix\"\n  },\n  {\n    \"name\": \"参数?\",\n    \"template\": \"<ng-md-icon icon=\'{{item.needParams?\\\"done\\\":\\\"clear\\\"}}\'></ng-md-icon>\"\n  },\n  {\n    \"name\": \"数据?\",\n    \"template\": \"<ng-md-icon icon=\'{{item.needDatas?\\\"done\\\":\\\"clear\\\"}}\'></ng-md-icon>\"\n  },\n  {\n    \"name\": \"系统接口?\",\n    \"template\": \"<ng-md-icon icon=\'{{item.isSystem?\\\"done\\\":\\\"clear\\\"}}\'></ng-md-icon>\"\n  }\n]',0,'[\"interfaces-fetch\"]',1,1,NULL,'2016-03-15 09:52:10','2016-04-08 03:43:45',NULL,0),(15,'interface-add','interface',4,4,'新建接口','add',NULL,'interface-form-add&edit','interface-data',NULL,NULL,NULL,NULL,0,'[\"interfaces-add\"]',0,1,NULL,'2016-03-15 09:55:36','2016-04-08 03:43:45',NULL,0),(16,'interface-edit','interface',2,4,'修改接口','edit',NULL,'interface-form-add&edit','interface-data',NULL,NULL,NULL,NULL,0,'[\"interfaces-id-edit\"]',0,1,NULL,'2016-03-15 09:56:42','2016-04-08 03:43:45',NULL,0),(17,'interface-delete','interface',2,2,'删除接口','delete',NULL,'',NULL,NULL,NULL,NULL,NULL,0,'[\"interfaces-id-delete\"]',0,1,NULL,'2016-03-15 09:57:38','2016-04-08 03:43:45',NULL,0),(18,'server-fetch','server',1,1,'列表操作','pageview','server-form-search','','server-data',NULL,NULL,NULL,'[\n  {\n    \"name\": \"ID\",\n    \"template\": \"item.id\"\n  },\n  {\n    \"name\": \"type\",\n    \"template\": \"item.type\"\n  },\n  {\n    \"name\": \"标题\",\n    \"template\": \"item.title\"\n  },\n  {\n    \"name\": \"协议\",\n    \"template\": \"item.verb\"\n  },\n  {\n    \"name\": \"地址\",\n    \"template\": \"item.baseUrl\"\n  },\n  {\n    \"name\": \"端口\",\n    \"template\": \"item.port\"\n  }\n]',0,'[\"servers-fetch\"]',1,1,'服务器设置','2016-03-16 06:34:13','2016-04-08 03:43:45',NULL,0),(19,'server-add','server',4,4,'新建服务器','add',NULL,'server-form-add&edit','server-data',NULL,NULL,NULL,NULL,0,'[\"servers-add\"]',0,1,NULL,'2016-03-16 06:36:16','2016-04-08 03:43:45',NULL,0),(20,'server-edit','server',2,4,'修改服务器','edit',NULL,'server-form-add&edit','server-data',NULL,NULL,NULL,NULL,0,'[\"servers-id-edit\"]',0,1,NULL,'2016-03-16 06:37:40','2016-04-08 03:43:45',NULL,0),(21,'server-delete','server',2,2,'删除服务器','delete',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'[\"servers-id-delete\"]',0,1,NULL,'2016-03-16 06:38:52','2016-04-08 03:43:45',NULL,0),(53,'group-list','group',1,1,'权限组列表','pageview','group-form-search',NULL,'group-data',NULL,NULL,NULL,'[{\n  \"name\":\"KEY\",\n  \"template\":\"item.key\"\n},{\n  \"name\":\"标题\",\n  \"template\":\"item.title\"\n},{\n  \"name\":\"描述\",\n  \"template\":\"item.description\"\n}]',0,'[\"groups-fetch\"]',1,0,'权限组列表','2016-03-24 05:46:42','2016-04-08 03:43:45',NULL,0),(54,'groups-add','group',4,4,'添加权限组','add',NULL,'group-form-add&edit','group-data',NULL,NULL,NULL,NULL,0,'[\"groups-add\"]',0,1,'添加权限组','2016-03-24 05:55:29','2016-04-08 03:43:45',NULL,0),(55,'groups-id-edit','group',2,4,'修改权限组','edit',NULL,'group-form-add&edit','group-data',NULL,NULL,NULL,NULL,0,'[\"groups-id-edit\"]',0,1,'修改权限组','2016-03-24 06:01:33','2016-04-08 03:43:45',NULL,1),(56,'groups-id-delete','group',2,2,'删除权限组','delete',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'[\"groups-id-delete\"]',0,1,NULL,'2016-03-24 06:02:37','2016-04-08 03:43:45',NULL,0),(57,'groups-action','group',2,5,'编辑组操作','details',NULL,NULL,NULL,'ecms/app/modules/ecms/tpls/group_action.html','GroupActionManagerController',NULL,NULL,0,'[\"groupaction-add\"]',0,0,NULL,'2016-03-24 06:17:13','2016-04-08 03:43:45',NULL,1),(59,'group-detail','group',1,1,'group详情操作','details',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'[\"menus-fetch\",\"actions-fetch\",\"groupactions-detail\"]',0,0,NULL,'2016-03-24 07:55:30','2016-04-08 03:43:45',NULL,0),(60,'role-pageview','role',1,1,'角色列表','pageview','roles-form-search',NULL,'roles-data',NULL,NULL,NULL,'[{\n  \"name\":\"KEY\",\n  \"template\":\"item.key\"\n},{\n  \"name\":\"标题\",\n  \"template\":\"item.title\"\n},{\n  \"name\":\"简介\",\n  \"template\":\"item.description\"\n}]',0,'[\"roles-fetch\"]',1,0,'角色列表','2016-03-24 09:59:55','2016-04-08 03:43:45',NULL,0),(61,'roles-id-edit','role',2,4,'修改角色','edit',NULL,'role-form-add&edit','role-data',NULL,NULL,NULL,NULL,0,'[\"roles-id-edit\"]',0,1,NULL,'2016-03-24 10:05:42','2016-04-08 03:43:45',NULL,0),(62,'role-id-delete','role',2,2,'删除角色','delete',NULL,'','',NULL,NULL,NULL,NULL,0,'[\"roles-id-delete\"]',0,1,NULL,'2016-03-24 10:06:43','2016-04-08 03:43:45',NULL,0),(63,'role-add','role',4,4,'新建角色','add',NULL,'role-form-add&edit','role-data',NULL,NULL,NULL,NULL,0,'[\"roles-add\"]',0,1,NULL,'2016-03-24 10:09:15','2016-04-08 03:43:45',NULL,0),(64,'role-group','role',2,5,'赋予权限组','details',NULL,NULL,NULL,'ecms/app/modules/ecms/tpls/role_group.html','RoleGroupManagerController',NULL,NULL,0,'[\"rolegroup-add\"]',0,0,NULL,'2016-03-24 10:14:38','2016-04-08 03:43:45',NULL,1),(65,'role-detail','role',1,1,'详情','details',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'[\"groups-fetch\",\"rolegroups-detail\"]',0,0,NULL,'2016-03-24 10:15:43','2016-04-08 03:43:45',NULL,0),(66,'crawler_settings-view','crawler_settings',1,1,'view','pageview',NULL,NULL,NULL,NULL,NULL,NULL,'[\n  {\n    \"name\": \"KEY\",\n    \"template\": \"item.key\"\n  },\n  {\n    \"name\": \"描述\",\n    \"template\": \"item.description\"\n  }\n]',0,'[\"crawler_settings-fetch\"]',1,0,NULL,'2016-04-07 09:07:52','2016-04-08 07:37:58',NULL,0),(67,'crawler_settings-add','crawler_settings',4,4,'新建爬虫配置','add',NULL,'crawler_settings-form-add&edit','crawler_settings-data',NULL,NULL,NULL,NULL,0,'[\"crawler_settings-add\"]',0,1,NULL,'2016-04-07 09:14:53','2016-04-08 06:17:12',NULL,0),(68,'crawler_settings-delete','crawler_settings',2,2,'删除','delete',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'[\"crawler_setting-delete\"]',0,1,NULL,'2016-04-07 09:44:26','2016-04-08 07:30:07',NULL,0),(69,'crawler_settings-edit','crawler_settings',2,4,'修改','edit',NULL,'crawler_settings-form-add&edit','crawler_settings-data',NULL,NULL,NULL,NULL,0,'[\n  \"crawler_setting-edit\"\n  ]',0,1,NULL,'2016-04-08 06:51:00','2016-04-08 07:06:17',NULL,0),(70,'crawler_setting-start','crawler_settings',2,2,'开始爬取','play_arrow',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'[\"crawlar_setting-start\"]',0,0,NULL,'2016-04-13 10:39:08','2016-04-13 10:52:22',NULL,0);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `actions` text,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `group_title_unique` (`title`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `group_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (2,'admin','管理组',NULL,'管理组','2016-03-24 06:17:33','2016-03-24 06:17:33');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupaction`
--

DROP TABLE IF EXISTS `groupaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupKey` varchar(50) NOT NULL,
  `actionkey` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupaction`
--

LOCK TABLES `groupaction` WRITE;
/*!40000 ALTER TABLE `groupaction` DISABLE KEYS */;
INSERT INTO `groupaction` VALUES (11,'admin','menu-add','2016-03-24 09:36:39','2016-03-24 09:36:39'),(13,'admin','menu-child-add','2016-03-24 09:37:55','2016-03-24 09:37:55'),(16,'admin','menu-delete','2016-03-24 09:41:36','2016-03-24 09:41:36'),(19,'admin','menu-edit','2016-03-24 09:42:24','2016-03-24 09:42:24');
/*!40000 ALTER TABLE `groupaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseUrl` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `api` varchar(255) NOT NULL,
  `verb` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `key` varchar(50) NOT NULL,
  `description` text,
  `needParams` tinyint(1) DEFAULT '1',
  `needDatas` tinyint(1) DEFAULT '1',
  `isAllParam` tinyint(1) DEFAULT '1',
  `params` text,
  `fields` text,
  `isSystem` tinyint(1) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `interface_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,'',NULL,'menus/all','GET','','menus-all-fetch','拉取menus的全部数据,包括深度',0,0,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(2,'',NULL,'menus','GET','','menus-fetch','拉取menus的全部数据',1,0,1,'null','[\n  {\n    \"field\": \"datas\",\n    \"path\": \"rows\"\n  },\n  {\n    \"field\": \"menus\",\n    \"path\": \"rows\"\n  },\n  {\n    \"field\": \"total\",\n    \"path\": \"count\"\n  }\n]',1,'2016-03-15 07:05:32','2016-03-24 08:25:41',NULL),(3,'',NULL,'menus/:key/edit','GET','','menus-key-detail','拉取menus中某条详情，搜索条件为key',1,0,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(4,'',NULL,'menus','POST','','menus-add','新建menus一条数据',0,1,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(5,'',NULL,'menus/:id','DELETE','','menus-id-delete','删除menus中的一条数据',0,0,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(6,'',NULL,'menus/:id','PUT','','menus-id-edit','修改menus中的一条数据',0,1,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(7,'',NULL,'schemas','GET','','schemas-fetch','拉取schemas中所有数据',1,0,1,'null','[{\"field\":\"datas\",\"path\":\"rows\"},{\"field\":\"total\",\"path\":\"count\"}]',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(8,'',NULL,'schemas','POST','','schemas-add','添加schemas中的一条数据',0,1,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(9,'',NULL,'schemas/:id','PUT','','schemas-id-edit','修改schemas中的一条数据',0,1,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(10,'',NULL,'schemas/:id','DELETE','','schemas-id-delete','修改schemas中的一条数据',0,0,1,'null','',1,'2016-03-15 07:05:32','2016-03-15 07:05:32',NULL),(11,NULL,NULL,'actions','GET',NULL,'actions-fetch','拉取actions的全部数据',1,0,1,NULL,'[\n  {\n    \"field\": \"datas\",\n    \"path\": \"rows\"\n  },\n  {\n    \"field\": \"actions\",\n    \"path\": \"rows\"\n  },\n  {\n    \"field\": \"total\",\n    \"path\": \"count\"\n  }\n]',1,'0000-00-00 00:00:00','2016-03-24 08:26:12',NULL),(12,NULL,NULL,'actions','POST',NULL,'actions-add','添加actions中的一条数据',0,1,1,NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(13,NULL,NULL,'actions/:id','PUT',NULL,'actions-id-edit','修改actions中的一条数据',0,1,1,NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(14,NULL,NULL,'actions/:id','DELETE',NULL,'actions-id-delete','删除actions中的一条数据',0,0,1,NULL,NULL,1,'0000-00-00 00:00:00','2016-03-22 12:10:25',NULL),(15,NULL,NULL,'interfaces','GET',NULL,'interfaces-fetch','拉取interfaces中所有数据',1,0,1,NULL,'[{\"field\":\"datas\",\"path\":\"rows\"},{\"field\":\"total\",\"path\":\"count\"}]',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(16,NULL,NULL,'interfaces','POST',NULL,'interfaces-add','添加interfaces中一条数据',0,1,1,NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(17,NULL,NULL,'interfaces/:id','PUT',NULL,'interfaces-id-edit','修改interfaces中一条数据',0,1,1,NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(18,NULL,NULL,'interfaces/:id','DELETE',NULL,'interfaces-id-delete','删除interfaces中一条数据',0,0,1,NULL,NULL,1,'0000-00-00 00:00:00','2016-04-07 10:04:22',NULL),(20,NULL,NULL,'servers','GET',NULL,'servers-fetch','拉取所有的服务器数据',1,0,1,NULL,'[\n  {\n    \"field\": \"datas\",\n    \"path\": \"rows\"\n  },\n  {\n    \"field\": \"total\",\n    \"path\": \"count\"\n  }\n]',1,'2016-03-16 06:41:22','2016-03-16 06:41:22',NULL),(21,NULL,NULL,'servers','POST',NULL,'servers-add','新建一个服务器信息',0,1,1,NULL,NULL,1,'2016-03-16 06:43:07','2016-03-16 06:43:07',NULL),(22,'',0,'servers/:id','PUT',NULL,'servers-id-edit','修改一个服务器数据',0,1,1,NULL,NULL,1,'2016-03-16 06:43:59','2016-03-16 06:45:15',NULL),(23,NULL,NULL,'servers/:id','DELETE',NULL,'servers-id-delete',NULL,0,0,1,NULL,NULL,1,'2016-03-16 06:44:24','2016-03-16 06:44:24',NULL),(44,NULL,NULL,'groups','GET',NULL,'groups-fetch','拉取所有权限组数据',1,0,1,NULL,'[\n  {\n    \"field\": \"datas\",\n    \"path\": \"rows\"\n  },\n  {\n    \"field\": \"groups\",\n    \"path\": \"rows\"\n  },\n  {\n    \"field\": \"total\",\n    \"path\": \"count\"\n  }\n]',1,'2016-03-24 05:51:49','2016-03-24 10:26:08',NULL),(45,NULL,NULL,'groups','POST',NULL,'groups-add','添加一个权限组',0,1,1,NULL,NULL,1,'2016-03-24 05:52:26','2016-03-24 05:52:26',NULL),(46,NULL,NULL,'groups/:id','PUT',NULL,'groups-id-edit',NULL,0,1,1,NULL,NULL,1,'2016-03-24 05:53:07','2016-03-24 05:53:07',NULL),(47,NULL,NULL,'groups/:id','DELETE',NULL,'groups-id-delete',NULL,0,0,1,NULL,NULL,1,'2016-03-24 05:53:32','2016-03-24 05:53:32',NULL),(48,NULL,NULL,'groupactions/:key/edit','GET',NULL,'groupactions-detail',NULL,0,0,1,NULL,'[\n  {\n    \"field\":\"groupactions\",\n    \"path\":\"rows\"\n  }\n  ]',1,'2016-03-24 07:48:23','2016-03-24 07:48:23',NULL),(49,NULL,NULL,'groupactions','POST',NULL,'groupaction-add',NULL,0,1,1,NULL,NULL,1,'2016-03-24 09:13:52','2016-03-24 09:13:52',NULL),(50,NULL,NULL,'roles','GET',NULL,'roles-fetch',NULL,1,0,1,NULL,'[{\n  \"field\":\"datas\",\n  \"path\":\"rows\"\n},{\n  \"field\":\"count\",\n  \"path\":\"count\"\n}]',1,'2016-03-24 10:01:18','2016-03-24 10:01:18',NULL),(51,NULL,NULL,'roles','POST',NULL,'roles-add',NULL,0,1,1,NULL,NULL,1,'2016-03-24 10:01:50','2016-03-24 10:09:30',NULL),(52,NULL,NULL,'roles/:id','PUT',NULL,'roles-id-edit',NULL,0,1,1,NULL,NULL,1,'2016-03-24 10:02:16','2016-03-24 10:02:16',NULL),(53,NULL,NULL,'roles/:id','DELETE',NULL,'roles-id-delete',NULL,0,0,1,NULL,NULL,1,'2016-03-24 10:02:45','2016-03-24 10:02:45',NULL),(54,NULL,NULL,'rolegroups/:key/edit','GET',NULL,'rolegroups-detail',NULL,0,0,1,NULL,'[\n  {\n    \"field\": \"rolegroups\",\n    \"path\": \"rows\"\n  }\n]',1,'2016-03-24 10:21:46','2016-03-24 10:21:46',NULL),(55,NULL,NULL,'rolegroups','POST',NULL,'rolegroup-add',NULL,0,1,1,NULL,NULL,1,'2016-03-24 10:22:47','2016-03-24 10:22:47',NULL),(57,NULL,NULL,'/api/crawler_setting','GET',NULL,'crawler_settings-fetch','拉取所有的爬虫设置数据',1,0,1,NULL,'[{\n  \"field\":\"datas\",\n  \"path\":\"rows\"\n},{\n  \"field\":\"count\",\n  \"path\":\"rcount\"\n}]',0,'2016-04-08 06:08:27','2016-04-08 06:08:27',2),(60,NULL,NULL,'/api/crawler_setting','POST',NULL,'crawler_settings-add',NULL,0,1,1,NULL,NULL,0,'2016-04-08 06:16:04','2016-04-08 07:03:54',2),(61,NULL,NULL,'/api/crawler_setting/:id','PUT',NULL,'crawler_setting-edit',NULL,1,1,1,NULL,NULL,0,'2016-04-08 06:16:29','2016-04-08 06:53:22',2),(62,NULL,NULL,'/api/crawler_setting/:id','DELETE',NULL,'crawler_setting-delete',NULL,1,1,1,NULL,NULL,0,'2016-04-08 06:16:48','2016-04-08 07:36:37',2),(64,NULL,NULL,'/api/crawler_setting/start/:id','POST',NULL,'crawlar_setting-start',NULL,1,1,1,NULL,NULL,0,'2016-04-13 10:42:17','2016-04-13 10:46:33',2);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `parentKey` varchar(255) DEFAULT NULL,
  `description` text,
  `isShow` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `menu_title_unique` (`title`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `menu_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'permiss_sy','GM系统','domain',NULL,1,28,NULL,'GM系统',1,'2016-03-15 07:05:32','2016-03-17 09:13:45'),(2,'settings','系统设置','settings',NULL,2,13,'permiss_sy','系统设置',1,'2016-03-15 07:05:32','2016-03-15 07:05:32'),(3,'module','模块管理','view_module','#/pages/module',3,4,'settings','模块管理',1,'2016-03-15 07:05:32','2016-03-18 07:28:00'),(4,'action','操作管理','note_add','#/pages/action',5,6,'settings','操作管理',1,'2016-03-15 07:05:32','2016-03-15 09:11:52'),(6,'interface','接口设置','extension','#/pages/interface',7,8,'settings','接口设置',1,'2016-03-15 07:05:32','2016-03-15 07:05:32'),(7,'schema','SCHEMA设置','card_travel','#/pages/schema',9,10,'settings','SCHEMA设置',1,'2016-03-15 07:05:32','2016-03-24 04:53:13'),(8,'server','服务器设置','computer','#/pages/server',11,12,'settings','服务器设置',1,'2016-03-15 07:05:32','2016-03-16 06:27:50'),(9,'permiss','权限设置','apps',NULL,14,19,'permiss_sy','权限设置',1,'2016-03-15 07:05:32','2016-03-24 05:50:03'),(10,'group','权限组管理','group','#/pages/group',15,16,'permiss','权限组管理',1,'2016-03-15 07:05:32','2016-03-15 07:05:32'),(11,'role','角色管理','people_outline','#/pages/role',17,18,'permiss','角色管理',1,'2016-03-15 07:05:32','2016-03-24 09:57:49'),(12,'person_set','用户设置','person','',20,23,'permiss_sy','用户设置',1,'2016-03-15 07:05:32','2016-03-24 10:47:10'),(13,'admin','用户管理','person_outline','#/pages/admin',21,22,'person_set','管理员设置',1,'2016-03-15 07:05:32','2016-03-24 10:47:36'),(14,'crawler','爬虫设置','bug_report','',24,27,'permiss_sy','爬虫模块',1,'2016-04-07 08:13:44','2016-04-07 09:00:42'),(15,'crawler_settings','爬虫配置','build','#/pages/crawler_settings',25,26,'crawler','爬虫爬取地址设置',1,'2016-04-07 08:15:54','2016-04-07 09:08:44');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `role_title_unique` (`title`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `role_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','管理员角色','管理员','2016-03-24 10:09:53','2016-03-24 10:10:09');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolegroup`
--

DROP TABLE IF EXISTS `rolegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupKey` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolegroup`
--

LOCK TABLES `rolegroup` WRITE;
/*!40000 ALTER TABLE `rolegroup` DISABLE KEYS */;
INSERT INTO `rolegroup` VALUES (8,'admin','admin','2016-03-24 10:43:52','2016-03-24 10:43:52');
/*!40000 ALTER TABLE `rolegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema`
--

DROP TABLE IF EXISTS `schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `content` text NOT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `schema_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema`
--

LOCK TABLES `schema` WRITE;
/*!40000 ALTER TABLE `schema` DISABLE KEYS */;
INSERT INTO `schema` VALUES (1,'schema-data',1,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"type\",\n    \"key\",\n    \"content\"\n  ],\n  \"properties\": {\n    \"type\": {\n      \"type\": \"number\",\n      \"title\": \"类型\",\n      \"enum\": [\n        1,\n        2\n      ]\n    },\n    \"key\": {\n      \"type\": \"string\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"描述\"\n    },\n    \"content\": {\n      \"type\": \"string\",\n      \"title\": \"内容\",\n      \"format\": \"json\"\n    }\n  }\n}','schema字段说明','2016-03-15 07:05:32','2016-03-22 11:32:52'),(2,'schema-form-add&edit',2,'{\"form\":[{\"key\":\"key\",\"type\":\"text\"},{\"key\":\"description\",\"type\":\"textarea\"},{\"key\":\"content\",\"type\":\"jsoneditor\",\"preferText\":true,\"jsonOptions\":{\"mode\":\"tree\",\"modes\":[\"tree\",\"code\"]}}]}','schema新建和修改表单的说明字段','2016-03-15 07:05:32','2016-03-15 07:05:32'),(4,'schema-form-search',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\",\n      \"required\": false,\n      \"copyValueTo\": [\n        \"r-key.$like\"\n      ]\n    }\n  ],\n  \"limit\":50\n}','schema搜索表单','2016-03-15 07:55:47','2016-03-18 08:52:12'),(5,'module-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"key\",\n    \"title\",\n    \"icon\"\n  ],\n  \"properties\": {\n    \"parentKey\": {\n      \"type\": \"string\",\n      \"title\":\"父节点KEY\"\n    },\n    \"key\": {\n      \"type\": \"string\",\n      \"maxLength\": 50\n      \n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"title\":\"标题\"\n    },\n    \"icon\": {\n      \"type\": \"string\",\n      \"title\":\"图标\"\n    },\n    \"link\": {\n      \"type\": \"string\",\n      \"title\":\"链接\"\n    },\n    \"isShow\": {\n      \"type\": \"boolean\",\n      \"title\":\"是否显示\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\":\"描述\"\n    }\n  }\n}','模块管理数据字段说明','2016-03-15 08:03:03','2016-03-15 10:45:24'),(6,'module-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"icon\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"link\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"parentKey\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"isShow\",\n      \"type\": \"checkbox\"\n    }\n  ]\n}','模块管理新建和修改表单描述','2016-03-15 08:16:44','2016-03-15 10:32:01'),(7,'module-form-search',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\",\n      \"required\": false,\n      \"copyValueTo\": [\n        \"r-key.$eq\"\n      ]\n    }\n  ],\n  \"limit\": 50\n}','模块管理搜索表单描述','2016-03-15 08:19:50','2016-03-18 08:54:32'),(8,'interface-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"api\",\n    \"key\",\n    \"verb\"\n  ],\n  \"properties\": {\n    \"key\": {\n      \"type\": \"string\"\n    },\n    \"baseUrl\": {\n      \"type\": \"string\",\n      \"title\": \"接口地址\"\n    },\n    \"port\": {\n      \"type\": \"number\",\n      \"title\": \"接口端口\"\n    },\n    \"api\": {\n      \"type\": \"string\",\n      \"title\": \"接口api\"\n    },\n    \"verb\": {\n      \"type\": \"string\",\n      \"title\": \"协议类型\",\n      \"enum\": [\n        \"GET\",\n        \"POST\",\n        \"DELETE\",\n        \"PUT\"\n      ]\n    },\n    \"needParams\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否需要参数\"\n    },\n    \"needDatas\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否需要数据\"\n    },\n    \"prefix\": {\n      \"type\": \"string\",\n      \"title\": \"搜索字段前缀\"\n    },\n    \"type\": {\n      \"type\": \"number\",\n      \"title\": \"对应的服务器的type\"\n    },\n    \"fields\": {\n      \"type\": \"string\",\n      \"title\": \"接口返回字段描述\",\n      \"format\": \"json\"\n    },\n    \"isSystem\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否是系统接口\"\n    },\n    \"isAllParam\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否需要所有的参数\"\n    },\n    \"params\": {\n      \"type\": \"string\",\n      \"title\": \"参数描述\",\n      \"format\": \"json\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"描述\"\n    }\n  }\n}','接口设置数据字段','2016-03-15 08:27:18','2016-03-17 04:33:50'),(9,'interface-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"type\",\n      \"type\": \"number\"\n    },\n    {\n      \"key\": \"baseUrl\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"port\",\n      \"type\": \"number\"\n    },\n    {\n      \"key\": \"api\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"verb\",\n      \"type\": \"select\",\n      \"titleMap\": [\n        {\n          \"name\": \"GET\",\n          \"value\": \"GET\"\n        },\n        {\n          \"name\": \"POST\",\n          \"value\": \"POST\"\n        },\n        {\n          \"name\": \"DELETE\",\n          \"value\": \"DELETE\"\n        },\n        {\n          \"name\": \"PUT\",\n          \"value\": \"PUT\"\n        }\n      ]\n    },\n    {\n      \"key\": \"prefix\",\n      \"type\": \"text\",\n      \"default\": \"filter\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    },\n    {\n      \"key\": \"params\",\n      \"type\": \"jsoneditor\",\n      \"preferText\": true,\n      \"jsonOptions\": {\n        \"mode\": \"tree\",\n        \"modes\": [\n          \"tree\",\n          \"code\"\n        ]\n      }\n    },\n    {\n      \"key\": \"fields\",\n      \"type\": \"jsoneditor\",\n      \"preferText\": true,\n      \"jsonOptions\": {\n        \"mode\": \"tree\",\n        \"modes\": [\n          \"tree\",\n          \"code\"\n        ]\n      }\n    },\n    {\n      \"key\": \"needParams\",\n      \"type\": \"checkbox\"\n    },\n    {\n      \"key\": \"needDatas\",\n      \"type\": \"checkbox\"\n    },\n    {\n      \"key\": \"isSystem\",\n      \"type\": \"checkbox\"\n    }\n  ]\n}','接口设置中新建和修改表单描述','2016-03-15 08:32:25','2016-03-17 04:34:10'),(10,'interface-form-search',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\",\n      \"required\": false,\n      \"copyValueTo\": [\n        \"r-key.$eq\"\n      ]\n    }\n  ],\n  \"limit\":50\n}','接口设置搜索表单描述','2016-03-15 08:32:57','2016-03-18 08:52:35'),(11,'action-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"type\",\n    \"key\",\n    \"parentKey\",\n    \"title\",\n    \"icon\",\n    \"interfaces\"\n  ],\n  \"properties\": {\n    \"key\": {\n      \"type\": \"string\",\n      \"maxLength\": 50\n    },\n    \"parentKey\": {\n      \"type\": \"string\",\n      \"title\": \"所属模块\",\n      \"maxLength\": 50\n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"title\": \"操作名称\",\n      \"maxLength\": 10\n    },\n    \"icon\": {\n      \"type\": \"string\",\n      \"title\": \"操作ICON\"\n    },\n    \"searchSchemaKey\": {\n      \"type\": \"string\",\n      \"title\": \"搜索表单SCHEMA\"\n    },\n    \"formSchemaKey\": {\n      \"type\": \"string\",\n      \"title\": \"表单SCHEMA\"\n    },\n    \"dataSchemaKey\": {\n      \"type\": \"string\",\n      \"title\": \"数据描述SCHEMA\"\n    },\n    \"templateUrl\": {\n      \"type\": \"string\",\n      \"title\": \"自定义模板URL\"\n    },\n    \"controller\": {\n      \"type\": \"string\",\n      \"title\": \"自定义控制器\"\n    },\n    \"linkUrl\": {\n      \"type\": \"string\",\n      \"title\": \"跳转地址\"\n    },\n    \"columns\": {\n      \"type\": \"string\",\n      \"title\": \"表头信息\",\n      \"format\": \"json\"\n    },\n    \"interfaces\": {\n      \"type\": \"string\",\n      \"title\": \"操作所需要的接口\",\n      \"format\": \"json\"\n    },\n    \"clearCurrentItem\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否清除掉当前的表单数据\"\n    },\n    \"isNeedDetail\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否需要调用detail接口\"\n    },\n    \"isList\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否是列表操作\"\n    },\n    \"isRefresh\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否需要刷新列表页面在操作完成之后\"\n    },\n    \"defaultDatas\": {\n      \"type\": \"string\",\n      \"title\": \"默认的数据配置\",\n      \"format\": \"json\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"描述\"\n    },\n    \"type\": {\n      \"type\": \"number\",\n      \"title\": \"菜单类型\",\n      \"enum\": [\n        1,\n        2,\n        3,\n        4\n      ]\n    },\n    \"optype\": {\n      \"type\": \"number\",\n      \"title\": \"操作类型\",\n      \"enum\": [\n        1,\n        2,\n        3,\n        4,\n        5\n      ]\n    }\n  }\n}','操作管理数据字段描述','2016-03-15 08:48:13','2016-03-22 11:01:36'),(12,'action-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"parentKey\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"icon\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"type\",\n      \"type\": \"select\",\n      \"titleMap\": [\n        {\n          \"name\": \"系统操作菜单\",\n          \"value\": 1\n        },\n        {\n          \"name\": \"单个数据菜单\",\n          \"value\": 2\n        },\n        {\n          \"name\": \"多选菜单\",\n          \"value\": 3\n        },\n        {\n          \"name\": \"顶级菜单\",\n          \"value\": 4\n        }\n      ]\n    },\n    {\n      \"key\": \"optype\",\n      \"type\": \"select\",\n      \"titleMap\": [\n        {\n          \"name\": \"无操作\",\n          \"value\": 1\n        },\n        {\n          \"name\": \"确认操作\",\n          \"value\": 2\n        },\n        {\n          \"name\": \"跳转操作\",\n          \"value\": 3\n        },\n        {\n          \"name\": \"弹窗操作\",\n          \"value\": 4\n        },\n        {\n          \"name\": \"自定义弹窗操作\",\n          \"value\": 5\n        }\n      ]\n    },\n    {\n      \"key\": \"searchSchemaKey\",\n      \"type\": \"text\",\n      \"condition\": \"model.optype!==2 && model.isList==true\"\n    },\n    {\n      \"key\": \"formSchemaKey\",\n      \"type\": \"text\",\n      \"condition\": \" model.optype==2 ||model.optype==5 || model.optype==4\"\n    },\n    {\n      \"key\": \"dataSchemaKey\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"templateUrl\",\n      \"type\": \"text\",\n      \"condition\": \"model.optype==5\"\n    },\n    {\n      \"key\": \"controller\",\n      \"type\": \"text\",\n      \"condition\": \"model.optype==5\"\n    },\n    {\n      \"key\": \"linkUrl\",\n      \"type\": \"text\",\n      \"condition\": \"model.optype==3\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    },\n    {\n      \"key\": \"isList\",\n      \"type\": \"checkbox\"\n    },\n    {\n      \"key\": \"isRefresh\",\n      \"type\": \"checkbox\"\n    },\n    {\n      \"key\": \"clearCurrentItem\",\n      \"type\": \"checkbox\"\n    },\n    {\n      \"key\": \"isNeedDetail\",\n      \"type\": \"checkbox\"\n    },\n    {\n      \"key\": \"columns\",\n      \"type\": \"jsoneditor\",\n      \"preferText\": true,\n      \"condition\": \"model.isList==true\",\n      \"jsonOptions\": {\n        \"mode\": \"tree\",\n        \"modes\": [\n          \"tree\",\n          \"code\"\n        ]\n      }\n    },\n    {\n      \"key\": \"interfaces\",\n      \"type\": \"jsoneditor\",\n      \"preferText\": true,\n      \"jsonOptions\": {\n        \"mode\": \"tree\",\n        \"modes\": [\n          \"tree\",\n          \"code\"\n        ]\n      }\n    },\n    {\n      \"key\": \"defaultDatas\",\n      \"type\": \"jsoneditor\",\n      \"preferText\": true,\n      \"jsonOptions\": {\n        \"mode\": \"tree\",\n        \"modes\": [\n          \"tree\",\n          \"code\"\n        ]\n      }\n    }\n  ]\n}','操作管理新建修改表单描述','2016-03-15 09:01:00','2016-03-22 11:02:10'),(13,'action-form-search',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\",\n      \"copyValueTo\": [\n        \"r-key.$eq\"\n      ]\n    },\n    {\n      \"key\": \"parentKey\",\n      \"type\": \"text\",\n      \"copyValueTo\": [\n        \"r-parentKey.$eq\"\n      ]\n    }\n  ],\n  \"limit\":50\n}','操作管理搜索表单描述','2016-03-15 09:01:36','2016-03-18 08:55:48'),(14,'server-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"type\",\n    \"key\",\n    \"description\"\n  ],\n  \"properties\": {\n    \"type\": {\n      \"type\": \"number\",\n      \"title\": \"类型，来区分不同的接口调用不同的地址\"\n    },\n    \"key\": {\n      \"type\": \"string\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"描述\"\n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"title\": \"标题\"\n    },\n    \"baseUrl\": {\n      \"type\": \"string\",\n      \"title\": \"服务器地址\"\n    },\n    \"port\": {\n      \"type\": \"number\",\n      \"title\": \"接口端口\"\n    },\n    \"verb\": {\n      \"type\": \"string\",\n      \"title\": \"接口协议\"\n    },\n    \"isDefault\": {\n      \"type\": \"boolean\",\n      \"title\": \"是否设为默认服务器\"\n    }\n  }\n}','服务器设置的字段描述','2016-03-16 06:51:23','2016-03-16 11:28:02'),(15,'server-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"baseUrl\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"port\",\n      \"type\": \"number\"\n    },\n    {\n      \"key\": \"verb\",\n      \"type\": \"select\",\n      \"titleMap\": [\n        {\n          \"name\": \"HTTP\",\n          \"value\": \"HTTP\"\n        },\n        {\n          \"name\": \"HTTPS\",\n          \"value\": \"HTTPS\"\n        }\n      ]\n    },\n    {\n      \"key\": \"type\",\n      \"type\": \"number\"\n    },\n    {\n      \"key\": \"isDefault\",\n      \"type\": \"checkbox\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    }\n  ]\n}','服务器设置的表单描述','2016-03-16 07:00:15','2016-03-16 11:27:26'),(16,'server-form-search',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\",\n      \"required\":false,\n      \"copyValueTo\":[\"r-key.$eq\"]\n    },\n    {\n      \"key\": \"type\",\n      \"type\": \"number\",\n      \"required\":false,\n      \"copyValueTo\":[\"r-type.$eq\"]\n    }\n  ]\n}','服务器设置搜索表单描述','2016-03-16 07:01:47','2016-03-16 07:01:47'),(17,'article-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"original_author\",\n    \"title\",\n    \"desription\",\n    \"content\",\n    \"tags\",\n    \"classes\",\n    \"picture_url\",\n    \"status\"\n  ],\n  \"properties\": {\n    \"author_id\": {\n      \"type\": \"string\",\n      \"title\": \"作者\"\n    },\n    \"original_author\": {\n      \"type\": \"string\",\n      \"title\": \"原作者\"\n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"title\": \"标题\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"导读\"\n    },\n    \"content\": {\n      \"type\": \"string\",\n      \"title\": \"内容\"\n    },\n    \"tags\": {\n      \"type\": \"object\",\n      \"title\": \"标签\",\n      \"default\": []\n    },\n    \"classes\": {\n      \"type\": \"object\",\n      \"title\": \"栏目\",\n      \"default\": []\n    },\n    \"picture_url\": {\n      \"type\": \"string\",\n      \"title\": \"特色图片\"\n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"title\": \"状态\"\n    }\n  }\n}','文章数据字段描述','2016-03-17 05:50:18','2016-03-24 05:10:07'),(18,'article-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"original_author\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    },\n    {\n      \"key\": \"tags\",\n      \"type\": \"chips\",\n      \"secondaryTitle\": \"Enter\",\n      \"maxLength\": 10\n    },\n    {\n      \"key\": \"classes\",\n      \"type\": \"chips\",\n      \"secondaryTitle\": \"Enter\",\n      \"maxLength\": 10\n    },\n    {\n      \"key\": \"picture_url\",\n      \"type\": \"fileupload\",\n      \"filters\": \"|jpg|png|jpeg|bmp|gif\",\n      \"uploadPath\": \"http://192.168.1.210/ecms_ex_api/ue?action=uploadimage\"\n    },\n    {\n      \"key\": \"status\",\n      \"type\": \"select\",\n      \"titleMap\": [\n        {\n          \"name\": \"publish\",\n          \"value\": \"publish\"\n        },\n        {\n          \"name\": \"draft\",\n          \"value\": \"draft\"\n        }\n      ]\n    },\n    {\n      \"key\": \"content\",\n      \"type\": \"ueditor\",\n      \"config\": {}\n    }\n  ]\n}','文章新建和修改表单描述','2016-03-17 05:53:56','2016-03-23 09:20:42'),(19,'article-form-search',0,'{\n  \"form\": [\n    {\n      \"key\": \"author_id\",\n      \"type\": \"text\",\n      \"copyValueTo\": [\n        \"r-author_id\"\n      ]\n    }\n  ]\n}','文章列表搜索表单','2016-03-17 05:55:34','2016-03-18 09:14:41'),(20,'classes-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"name\",\n    \"slug\"\n  ],\n  \"properties\": {\n    \"name\": {\n      \"type\": \"string\",\n      \"title\":\"名称\"\n    },\n    \"slug\": {\n      \"type\": \"string\",\n      \"title\":\"别名\"\n    }\n  }\n}','栏目字段描述','2016-03-18 08:14:19','2016-03-18 08:14:19'),(21,'classes-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"name\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"slug\",\n      \"type\": \"text\"\n    }\n  ]\n}','新建修改栏目表单描述','2016-03-18 08:15:35','2016-03-18 08:15:35'),(22,'classes-form-search',0,'{\"form\":[{\"key\":\"name\",\"type\":\"text\",\"required\":false,\"copyValueTo\":[\"r-name\"]}]}','栏目搜索表单描述','2016-03-18 08:16:27','2016-03-18 09:14:23'),(23,'tag-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"type\",\n    \"key\",\n    \"description\"\n  ],\n  \"properties\": {\n    \"name\": {\n      \"type\": \"string\",\n      \"title\":\"名称\"\n    },\n    \"slug\": {\n      \"type\": \"string\",\n      \"title\":\"别名\"\n    }\n  }\n}','标签数据字段描述','2016-03-18 09:11:44','2016-03-18 09:11:44'),(24,'tag-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"name\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"slug\",\n      \"type\": \"text\"\n    }\n  ]\n}','标签新建修改表单描述','2016-03-18 09:12:51','2016-03-18 09:12:51'),(25,'tag-form-search',0,'{\n  \"form\":[\n    {\n      \"key\":\"name\",\n      \"requried\":false,\n      \"copuValutTo\":[\"r-name\"]\n    }\n    ]\n}','标签搜索表单描述','2016-03-18 09:14:06','2016-03-18 09:14:06'),(26,'pagetag-data',0,'{\n  \"type\": \"object\",\n  \"required\": [],\n  \"properties\": {\n    \"post_classes\": {\n      \"type\": \"array\",\n      \"title\": \"文章栏目\",\n      \"items\": {\n        \"type\": \"string\"\n      }\n    },\n    \"video_classes\": {\n      \"type\": \"array\",\n      \"title\": \"视频栏目\",\n      \"items\": {\n        \"type\": \"string\"\n      }\n    },\n    \"index_post_tags\": {\n      \"type\": \"array\",\n      \"title\": \"首页文章标签\",\n      \"items\": {\n        \"type\": \"string\"\n      }\n    },\n    \"index_video_tags\": {\n      \"type\": \"array\",\n      \"title\": \"首页视频标签\",\n      \"items\": {\n        \"type\": \"string\"\n      }\n    },\n    \"hot_tags\": {\n      \"type\": \"array\",\n      \"title\": \"右侧热门标签\",\n      \"items\": {\n        \"type\": \"string\"\n      }\n    }\n  }\n}','页面中的标签字段描述','2016-03-21 08:48:10','2016-03-25 08:02:20'),(27,'pagetag-form-save',0,'{\n  \"form\": [\n    {\n      \"key\": \"post_classes\",\n      \"type\": \"chips\",\n      \"secondaryTitle\": \"文章栏目\"\n    },\n    {\n      \"key\": \"video_classes\",\n      \"type\": \"chips\",\n      \"secondaryTitle\": \"视频栏目\"\n    },\n    {\n      \"key\": \"index_post_tags\",\n      \"type\": \"chips\",\n      \"secondaryTitle\": \"首页文章标签\"\n    },\n    {\n      \"key\": \"index_video_tags\",\n      \"type\": \"chips\",\n      \"secondaryTitle\": \"首页视频标签\"\n    },\n    {\n      \"key\": \"hot_tags\",\n      \"type\": \"chips\",\n      \"secondaryTitle\": \"右侧热门标签\"\n    }\n  ]\n}','页面中的标签保存表单字段描述','2016-03-21 08:49:23','2016-03-25 08:10:15'),(28,'pics-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"pics\"\n  ],\n  \"properties\": {\n    \"pics\": {\n      \"type\": \"array\",\n      \"title\": \"图片贴\",\n      \"items\": {\n        \"type\": \"object\",\n        \"required\": [\n          \"original_author\",\n          \"title\",\n          \"tags\",\n          \"picture_url\",\n          \"status\"\n        ],\n        \"properties\": {\n          \"original_author\": {\n            \"type\": \"string\",\n            \"title\": \"原作者\"\n          },\n          \"title\": {\n            \"type\": \"string\",\n            \"title\": \"标题\"\n          },\n          \"description\": {\n            \"type\": \"string\",\n            \"title\": \"描述\"\n          },\n          \"tags\": {\n            \"type\": \"array\",\n            \"title\": \"标签\",\n            \"default\": [],\n            \"startEmpty\":true,\n            \"items\": {\n              \"type\": \"string\"\n            }\n          },\n          \"picture_url\": {\n            \"type\": \"string\",\n            \"title\": \"图片地址\"\n          },\n          \"status\": {\n            \"type\": \"string\",\n            \"title\": \"状态\",\n            \"enums\": [\n              \"publish\",\n              \"draft\"\n            ]\n          }\n        }\n      }\n    }\n  }\n}','图片贴数据字段描述','2016-03-21 10:53:05','2016-03-22 11:04:59'),(29,'pics-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"pics\",\n      \"type\": \"tabarray\",\n      \"startEmpty\": true,\n      \"items\": [\n        {\n          \"key\": \"pics[].original_author\",\n          \"type\": \"text\"\n        },\n        {\n          \"key\": \"pics[].title\",\n          \"type\": \"text\"\n        },\n        {\n          \"key\": \"pics[].description\",\n          \"type\": \"textarea\"\n        },\n        {\n          \"key\": \"pics[].tags\",\n          \"startEmpty\": true,\n          \"type\": \"chips\"\n        },\n        {\n          \"key\": \"pics[].picture_url\",\n          \"type\": \"fileupload\",\n          \"filters\": \"|jpg|png|jpeg|bmp|gif\",\n          \"uploadPath\": \"http://192.168.1.210/ecms_ex_api/ue?action=uploadimage\"\n        },\n        {\n          \"key\": \"pics[].status\",\n          \"type\": \"select\",\n          \"titleMap\": [\n            {\n              \"name\": \"publish\",\n              \"value\": \"publish\"\n            },\n            {\n              \"name\": \"draft\",\n              \"value\": \"draft\"\n            }\n          ]\n        }\n      ]\n    }\n  ]\n}','添加图片贴','2016-03-21 10:56:30','2016-03-23 09:21:00'),(30,'videos-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"original_author\",\n    \"title\",\n    \"video_code\",\n    \"tags\",\n    \"picture_url\",\n    \"status\"\n  ],\n  \"properties\": {\n    \"original_author\": {\n      \"type\": \"string\",\n      \"title\": \"原作者\"\n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"title\": \"标题\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"描述\"\n    },\n    \"video_code\": {\n      \"type\": \"string\",\n      \"title\": \"视频代码\"\n    },\n    \"tags\": {\n      \"type\": \"array\",\n      \"title\": \"标签\",\n      \"default\": [],\n      \"startEmpty\":true,\n      \"items\": {\n        \"type\": \"string\"\n      }\n    },\n    \"picture_url\": {\n      \"type\": \"string\",\n      \"title\": \"图片地址\"\n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"title\": \"状态\",\n      \"enums\": [\n        \"publish\",\n        \"draft\"\n      ]\n    }\n  }\n}','视频贴数组字段描述','2016-03-22 08:13:35','2016-03-22 11:05:12'),(31,'videos-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"original_author\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    },\n    {\n      \"key\": \"video_code\",\n      \"type\": \"textarea\"\n    },\n    {\n      \"key\": \"tags\",\n      \"secondaryTitle\": \"新标签\",\n      \"type\": \"chips\"\n    },\n    {\n      \"key\": \"picture_url\",\n      \"type\": \"fileupload\",\n      \"filters\":\"|jpg|png|jpeg|bmp|gif\",\n      \"uploadPath\":\"http://192.168.1.210/ecms_ex_api/ue?action=uploadimage\"\n    },\n    {\n      \"key\": \"status\",\n      \"type\": \"select\",\n      \"titleMap\": [\n        {\n          \"name\": \"publish\",\n          \"value\": \"publish\"\n        },\n        {\n          \"name\": \"draft\",\n          \"value\": \"draft\"\n        }\n      ]\n    }\n  ]\n}','添加修改视频贴表单描述','2016-03-22 08:15:03','2016-03-23 09:10:57'),(32,'pics-form-edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"original_author\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    },\n    {\n      \"key\": \"tags\",\n      \"startEmpty\": true,\n      \"type\": \"chips\"\n    },\n    {\n      \"key\": \"picture_url\",\n      \"type\": \"fileupload\",\n      \"filters\": \"|jpg|png|jpeg|bmp|gif\",\n      \"uploadPath\": \"http://192.168.1.210/ecms_ex_api/ue?action=uploadimage\"\n    },\n    {\n      \"key\": \"status\",\n      \"type\": \"select\",\n      \"titleMap\": [\n        {\n          \"name\": \"publish\",\n          \"value\": \"publish\"\n        },\n        {\n          \"name\": \"draft\",\n          \"value\": \"draft\"\n        }\n      ]\n    }\n  ]\n}','修改图片贴表单描述','2016-03-22 11:28:07','2016-03-23 09:21:15'),(33,'pics-data-edit',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"original_author\",\n    \"title\",\n    \"description\",\n    \"tags\",\n    \"picture_url\",\"status\"\n  ],\n  \"properties\": {\n    \"original_author\": {\n      \"type\": \"string\",\n      \"title\": \"原作者\"\n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"title\": \"标题\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"描述\"\n    },\n    \"tags\": {\n      \"type\": \"array\",\n      \"title\": \"标签\",\n      \"default\": [],\n      \"startEmpty\": true,\n      \"items\": {\n        \"type\": \"string\"\n      }\n    },\n    \"picture_url\": {\n      \"type\": \"string\",\n      \"title\": \"图片地址\"\n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"title\": \"状态\",\n      \"enums\": [\n        \"publish\",\n        \"draft\"\n      ]\n    }\n  }\n}','图片贴修改数据字段描述','2016-03-22 11:36:12','2016-03-22 11:36:12'),(34,'fileupload-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \n  ],\n  \"properties\": {\n    \"action\": {\n      \"type\": \"string\"\n    }\n  }\n}','文件上传数据字段描述','2016-03-23 10:32:04','2016-03-23 10:32:04'),(35,'fileupload-form-search',0,'{\n  \"form\":[\n    \"*\"\n  ],\n  \"query\":{\n    \"action\":\"listimage\"\n  }\n}','文件上传搜索表单描述','2016-03-23 10:34:30','2016-03-23 10:34:30'),(36,'group-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"key\",\n    \"title\"\n  ],\n  \"properties\": {\n    \"key\": {\n      \"type\": \"string\",\n      \"title\":\"标识\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\":\"简介\"\n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"maxLength\":20,\n      \"title\":\"组名称\"\n    }\n  }\n}','权限组数据字段描述','2016-03-24 05:57:59','2016-03-24 05:57:59'),(37,'group-form-add&edit',0,'{\n  \"form\": [\n   {\n      \"key\": \"key\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    }\n  ]\n}','权限组添加修改表单描述','2016-03-24 05:58:59','2016-03-24 05:58:59'),(38,'role-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"key\",\n    \"title\"\n  ],\n  \"properties\": {\n    \"key\": {\n      \"type\": \"string\",\n      \"title\": \"标识\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"简介\"\n    },\n    \"title\": {\n      \"type\": \"string\",\n      \"maxLength\": 20,\n      \"title\": \"角色名称\"\n    }\n  }\n}','角色数据字段描述','2016-03-24 10:03:54','2016-03-24 10:03:54'),(39,'role-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"title\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    }\n  ]\n}','角色表单字段描述','2016-03-24 10:04:36','2016-03-24 10:04:36'),(40,'crawler_settings-data',0,'{\n  \"type\": \"object\",\n  \"required\": [\n    \"type\",\n    \"key\",\n    \"content\"\n  ],\n  \"properties\": {\n    \"type\": {\n      \"type\": \"number\",\n      \"title\": \"类型\",\n      \"enum\": [\n        1,\n        2\n      ]\n    },\n    \"key\": {\n      \"type\": \"string\"\n    },\n    \"description\": {\n      \"type\": \"string\",\n      \"title\": \"描述\"\n    },\n    \"content\": {\n      \"type\": \"string\",\n      \"title\": \"内容\",\n      \"format\": \"json\"\n    }\n  }\n}','爬虫配置设置数据字段描述','2016-04-07 09:15:58','2016-04-08 06:18:38'),(41,'crawler_settings-form-add&edit',0,'{\n  \"form\": [\n    {\n      \"key\": \"key\",\n      \"type\": \"text\"\n    },\n    {\n      \"key\": \"description\",\n      \"type\": \"textarea\"\n    },\n    {\n      \"key\": \"content\",\n      \"type\": \"jsoneditor\",\n      \"format\":\"json\",\n      \"preferText\": true,\n      \"jsonOptions\": {\n        \"mode\": \"tree\",\n        \"modes\": [\n          \"tree\",\n          \"code\"\n        ]\n      }\n    }\n  ]\n}','爬虫配置新建修改表单描述','2016-04-07 09:16:45','2016-04-08 06:19:05');
/*!40000 ALTER TABLE `schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `baseUrl` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `verb` varchar(255) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `description` text,
  `isDefault` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `server_title_unique` (`title`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `server_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (3,'crawler','爬虫数据服务','localhost',3001,'HTTP',2,'爬虫数据服务',1,'2016-04-07 09:01:35','2016-04-08 06:06:22');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'octopus'
--

--
-- Dumping routines for database 'octopus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-22 11:22:37
