-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: crawler
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
-- Table structure for table `crawler_setting`
--

DROP TABLE IF EXISTS `crawler_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crawler_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `content` text NOT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `crawler_setting_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawler_setting`
--

LOCK TABLES `crawler_setting` WRITE;
/*!40000 ALTER TABLE `crawler_setting` DISABLE KEYS */;
INSERT INTO `crawler_setting` VALUES (1,'qyer.com',0,'{\n  \"key\": \"qyer\",\n  \"crawler\": {\n    \"host\": \"place.qyer.com\",\n    \"initialPath\": \"/japan/travel-notes/\",\n    \"initialPort\": 80,\n    \"initialProtocol\": \"http\",\n    \"interval\": 1000,\n    \"maxConcurrency\": 5,\n    \"domainWhitelist\": [\n      \"place.qyer.com\",\n      \"bbs.qyer.com\"\n    ],\n    \"timeout\": 10000,\n    \"listenerTTL\": 10000,\n    \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36\",\n    \"decodeResponses\": false,\n    \"respectRobotsTxt\": false,\n    \"allowInitialDomainChange\": false,\n    \"filterByDomain\": true,\n    \"scanSubdomains\": false,\n    \"ignoreWWWDomain\": false,\n    \"stripWWWDomain\": false,\n    \"stripQuerystring\": true,\n    \"useProxy\": false,\n    \"proxyHostname\": \"218.3.177.19\",\n    \"proxyPort\": 8088,\n    \"proxyUser\": null,\n    \"proxyPass\": null,\n    \"maxResourceSize\": 16777216,\n    \"downloadUnsupported\": false,\n    \"needsAuth\": false,\n    \"authUser\": \"\",\n    \"authPass\": \"\",\n    \"customHeaders\": {},\n    \"acceptCookies\": true,\n    \"urlEncoding\": \"unicode\",\n    \"parseHTMLComments\": true,\n    \"parseScriptTags\": true,\n    \"maxDepth\": 3,\n    \"fetchWhitelistedMimeTypesBelowMaxDepth\": true,\n    \"ignoreInvalidSSL\": false\n  },\n  \"notFetch\": [\n    {\n      \"regex\": \"window\\\\.location\\\\;\",\n      \"scope\": \"gi\"\n    },\n    {\n      \"regex\": \"string(.*?)href\",\n      \"scope\": \"gi\"\n    },\n    {\n      \"regex\": \"%7b(.*?)%7d\",\n      \"scope\": \"gi\"\n    }\n  ],\n  \"robots\": {\n    \"url\": \"http://www.example.com/robots.txt\",\n    \"headers\": [\n      \"User-agent: *\"\n    ]\n  },\n  \"conditions\": [\n    {\n      \"key\": \"youji\",\n      \"description\": \"游记页面\",\n      \"regex\": \"thread\\\\-\\\\d+\\\\-\\\\d+\\\\.html\",\n      \"scope\": \"gi\",\n      \"enabled\": true,\n      \"store\": {\n        \"type\": \"elastic\",\n        \"elastic\": {\n          \"index\": \"qyer\",\n          \"type\": \"youji\"\n        }\n      },\n      \"datas\": {\n        \"pageKey\": {\n          \"type\": \"url\",\n          \"datas\": {\n            \"key\": {\n              \"replace\": [\n                \"(.*?)thread-\",\n                \"-(.*?)\\\\.html\"\n              ],\n              \"scope\": \"gi\"\n            }\n          }\n        },\n        \"postContent\": {\n          \"type\": \"html\",\n          \"selector\": \".bbs_detail_list .bbs_detail_item:eq(0)\",\n          \"datas\": {\n            \"postUid\": {\n              \"attr\": \"data-uid\"\n            },\n            \"isFirst\": {\n              \"attr\": \"data-isfirst\"\n            },\n            \"fromDevice\": {\n              \"attr\": \"data-fromdevice\"\n            },\n            \"postUidPersonHref\": {\n              \"selector\": \".bbs_detail_title .face\",\n              \"attr\": \"href\"\n            },\n            \"content\": {\n              \"selector\": \".bbs_detail_content\",\n              \"method\": \"text\"\n            }\n          }\n        }\n      }\n    },\n    {\n      \"key\": \"poi\",\n      \"description\": \"poi页面\",\n      \"enabled\": false,\n      \"regex\": \"/poi/(.*?)/\",\n      \"scope\": \"gi\",\n      \"store\": {\n        \"type\": \"elastic\",\n        \"elastic\": {\n          \"index\": \"qyer\",\n          \"type\": \"poi\"\n        }\n      }\n    }\n  ]\n}','穷游页面爬取设置','2016-04-08 06:57:25','2016-04-13 08:18:37');
/*!40000 ALTER TABLE `crawler_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'crawler'
--

--
-- Dumping routines for database 'crawler'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-22 11:22:05
