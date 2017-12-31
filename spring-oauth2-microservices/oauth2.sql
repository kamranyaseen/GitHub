-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: oauth2
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `IX_AUTH_USERNAME` (`username`,`authority`),
  CONSTRAINT `FK_AUTH_USERS` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(255) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` datetime DEFAULT NULL,
  `lastModifiedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('account-service',NULL,'secret','read','authorization_code,password,refresh_token,implicit',NULL,NULL,900,NULL,'{}',NULL),('customer-service',NULL,'secret','read','authorization_code,password,refresh_token,implicit',NULL,NULL,900,NULL,'{}',NULL),('customer-service-write',NULL,'secret','write','authorization_code,password,refresh_token,implicit',NULL,NULL,900,NULL,'{}',NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` mediumblob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_code` (
  `code` varchar(255) DEFAULT NULL,
  `authentication` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spring_session` (
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `SPRING_SESSION_IX1` (`LAST_ACCESS_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('1639aeb9-356d-436c-a2f4-e51b5c98d958',1514705593396,1514706583312,1800,NULL);
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob,
  PRIMARY KEY (`SESSION_ID`,`ATTRIBUTE_NAME`),
  KEY `SPRING_SESSION_ATTRIBUTES_IX1` (`SESSION_ID`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_ID`) REFERENCES `spring_session` (`SESSION_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('1639aeb9-356d-436c-a2f4-e51b5c98d958','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN','¬\í\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\ï·\È/¢û\Õ\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$cec39648-0ed8-472a-990b-8d9ab51bf17f'),('1639aeb9-356d-436c-a2f4-e51b5c98d958','SPRING_SECURITY_LAST_EXCEPTION','¬\í\0sr\0Corg.springframework.security.authentication.BadCredentialsException&Nüd®]\0\0xr\09org.springframework.security.core.AuthenticationExceptionQ0\âgT\0\0xr\0\Zjava.lang.RuntimeExceptionž_G\n4ƒ\å\0\0xr\0java.lang.Exception\Ðý>\Z;\Ä\0\0xr\0java.lang.Throwable\Õ\Æ5\'9w¸\Ë\0L\0causet\0Ljava/lang/Throwable;L\0\rdetailMessaget\0Ljava/lang/String;[\0\nstackTracet\0[Ljava/lang/StackTraceElement;L\0suppressedExceptionst\0Ljava/util/List;xpq\0~\0	t\0Bad credentialsur\0[Ljava.lang.StackTraceElement;F*<<ý\"9\0\0xp\0\0\0Asr\0java.lang.StackTraceElementa	Åš&6Ý…\0I\0\nlineNumberL\0declaringClassq\0~\0L\0fileNameq\0~\0L\0\nmethodNameq\0~\0xp\0\0\0—t\0Yorg.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvidert\0.AbstractUserDetailsAuthenticationProvider.javat\0authenticatesq\0~\0\r\0\0\0®t\0;org.springframework.security.authentication.ProviderManagert\0ProviderManager.javaq\0~\0sq\0~\0\r\0\0\0\Çq\0~\0q\0~\0q\0~\0sq\0~\0\r\0\0\0^t\0Torg.springframework.security.web.authentication.UsernamePasswordAuthenticationFiltert\0)UsernamePasswordAuthenticationFilter.javat\0attemptAuthenticationsq\0~\0\r\0\0\0\Ôt\0Vorg.springframework.security.web.authentication.AbstractAuthenticationProcessingFiltert\0+AbstractAuthenticationProcessingFilter.javat\0doFiltersq\0~\0\r\0\0Kt\0Dorg.springframework.security.web.FilterChainProxy$VirtualFilterChaint\0FilterChainProxy.javaq\0~\0sq\0~\0\r\0\0\0tt\0Corg.springframework.security.web.authentication.logout.LogoutFiltert\0LogoutFilter.javaq\0~\0sq\0~\0\r\0\0Kq\0~\0q\0~\0 q\0~\0sq\0~\0\r\0\0\0|t\00org.springframework.security.web.csrf.CsrfFiltert\0CsrfFilter.javat\0doFilterInternalsq\0~\0\r\0\0\0kt\03org.springframework.web.filter.OncePerRequestFiltert\0OncePerRequestFilter.javaq\0~\0sq\0~\0\r\0\0Kq\0~\0q\0~\0 q\0~\0sq\0~\0\r\0\0\0@t\0:org.springframework.security.web.header.HeaderWriterFiltert\0HeaderWriterFilter.javaq\0~\0(sq\0~\0\r\0\0\0kq\0~\0*q\0~\0+q\0~\0sq\0~\0\r\0\0Kq\0~\0q\0~\0 q\0~\0sq\0~\0\r\0\0\0it\0Iorg.springframework.security.web.context.SecurityContextPersistenceFiltert\0%SecurityContextPersistenceFilter.javaq\0~\0sq\0~\0\r\0\0Kq\0~\0q\0~\0 q\0~\0sq\0~\0\r\0\0\08t\0Worg.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFiltert\0%WebAsyncManagerIntegrationFilter.javaq\0~\0(sq\0~\0\r\0\0\0kq\0~\0*q\0~\0+q\0~\0sq\0~\0\r\0\0Kq\0~\0q\0~\0 q\0~\0sq\0~\0\r\0\0\0\Öt\01org.springframework.security.web.FilterChainProxyq\0~\0 q\0~\0(sq\0~\0\r\0\0\0±q\0~\0<q\0~\0 q\0~\0sq\0~\0\r\0\0[t\04org.springframework.web.filter.DelegatingFilterProxyt\0\ZDelegatingFilterProxy.javat\0invokeDelegatesq\0~\0\r\0\0q\0~\0?q\0~\0@q\0~\0sq\0~\0\r\0\0\0Át\0/org.apache.catalina.core.ApplicationFilterChaint\0ApplicationFilterChain.javat\0internalDoFiltersq\0~\0\r\0\0\0¦q\0~\0Dq\0~\0Eq\0~\0sq\0~\0\r\0\0\0ct\03org.springframework.web.filter.RequestContextFiltert\0RequestContextFilter.javaq\0~\0(sq\0~\0\r\0\0\0kq\0~\0*q\0~\0+q\0~\0sq\0~\0\r\0\0\0Áq\0~\0Dq\0~\0Eq\0~\0Fsq\0~\0\r\0\0\0¦q\0~\0Dq\0~\0Eq\0~\0sq\0~\0\r\0\0\0lt\07org.springframework.web.filter.HttpPutFormContentFiltert\0HttpPutFormContentFilter.javaq\0~\0(sq\0~\0\r\0\0\0kq\0~\0*q\0~\0+q\0~\0sq\0~\0\r\0\0\0Áq\0~\0Dq\0~\0Eq\0~\0Fsq\0~\0\r\0\0\0¦q\0~\0Dq\0~\0Eq\0~\0sq\0~\0\r\0\0\0Qt\05org.springframework.web.filter.HiddenHttpMethodFiltert\0HiddenHttpMethodFilter.javaq\0~\0(sq\0~\0\r\0\0\0kq\0~\0*q\0~\0+q\0~\0sq\0~\0\r\0\0\0Áq\0~\0Dq\0~\0Eq\0~\0Fsq\0~\0\r\0\0\0¦q\0~\0Dq\0~\0Eq\0~\0sq\0~\0\r\0\0\0§t\0<org.springframework.session.web.http.SessionRepositoryFiltert\0SessionRepositoryFilter.javaq\0~\0(sq\0~\0\r\0\0\0Pt\09org.springframework.session.web.http.OncePerRequestFilterq\0~\0+q\0~\0sq\0~\0\r\0\0\0Áq\0~\0Dq\0~\0Eq\0~\0Fsq\0~\0\r\0\0\0¦q\0~\0Dq\0~\0Eq\0~\0sq\0~\0\r\0\0\0\Åt\06org.springframework.web.filter.CharacterEncodingFiltert\0CharacterEncodingFilter.javaq\0~\0(sq\0~\0\r\0\0\0kq\0~\0*q\0~\0+q\0~\0sq\0~\0\r\0\0\0Áq\0~\0Dq\0~\0Eq\0~\0Fsq\0~\0\r\0\0\0¦q\0~\0Dq\0~\0Eq\0~\0sq\0~\0\r\0\0\0jt\0<org.springframework.boot.actuate.autoconfigure.MetricsFiltert\0MetricsFilter.javaq\0~\0(sq\0~\0\r\0\0\0kq\0~\0*q\0~\0+q\0~\0sq\0~\0\r\0\0\0Áq\0~\0Dq\0~\0Eq\0~\0Fsq\0~\0\r\0\0\0¦q\0~\0Dq\0~\0Eq\0~\0sq\0~\0\r\0\0\0\Çt\0-org.apache.catalina.core.StandardWrapperValvet\0StandardWrapperValve.javat\0invokesq\0~\0\r\0\0\0`t\0-org.apache.catalina.core.StandardContextValvet\0StandardContextValve.javaq\0~\0psq\0~\0\r\0\0\Þt\03org.apache.catalina.authenticator.AuthenticatorBaset\0AuthenticatorBase.javaq\0~\0psq\0~\0\r\0\0\0Œt\0*org.apache.catalina.core.StandardHostValvet\0StandardHostValve.javaq\0~\0psq\0~\0\r\0\0\0Qt\0+org.apache.catalina.valves.ErrorReportValvet\0ErrorReportValve.javaq\0~\0psq\0~\0\r\0\0\0Wt\0,org.apache.catalina.core.StandardEngineValvet\0StandardEngineValve.javaq\0~\0psq\0~\0\r\0\0Vt\0+org.apache.catalina.connector.CoyoteAdaptert\0CoyoteAdapter.javat\0servicesq\0~\0\r\0\0#t\0(org.apache.coyote.http11.Http11Processort\0Http11Processor.javaq\0~\0ƒsq\0~\0\r\0\0\0Bt\0(org.apache.coyote.AbstractProcessorLightt\0AbstractProcessorLight.javat\0processsq\0~\0\r\0\0dt\04org.apache.coyote.AbstractProtocol$ConnectionHandlert\0AbstractProtocol.javaq\0~\0Šsq\0~\0\r\0\0³t\06org.apache.tomcat.util.net.NioEndpoint$SocketProcessort\0NioEndpoint.javat\0doRunsq\0~\0\r\0\0\01t\0.org.apache.tomcat.util.net.SocketProcessorBaset\0SocketProcessorBase.javat\0runsq\0~\0\r\0\0}t\0\'java.util.concurrent.ThreadPoolExecutort\0ThreadPoolExecutor.javat\0	runWorkersq\0~\0\r\0\0pt\0.java.util.concurrent.ThreadPoolExecutor$Workerq\0~\0˜q\0~\0•sq\0~\0\r\0\0\0=t\0:org.apache.tomcat.util.threads.TaskThread$WrappingRunnablet\0TaskThread.javaq\0~\0•sq\0~\0\r\0\0\ìt\0java.lang.Threadt\0Thread.javaq\0~\0•sr\0&java.util.Collections$UnmodifiableListü%1µ\ìŽ\0L\0listq\0~\0xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0\0w\0\0\0\0xq\0~\0§x'),('1639aeb9-356d-436c-a2f4-e51b5c98d958','SPRING_SECURITY_SAVED_REQUEST','¬\í\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequestXþ )&un\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0\"=t\0\0sr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie@+‚ŸÀ´f\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xpÿÿÿÿ\0\0\0\0\0ppt\0SESSIONpt\0$1639aeb9-356d-436c-a2f4-e51b5c98d958xsr\0java.util.TreeMapÁö>-%j\æ\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\å\Î\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0text/css,*/*;q=0.1xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, brxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9,ar;q=0.8xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\0,SESSION=1639aeb9-356d-436c-a2f4-e51b5c98d958xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8765xt\0referersq\0~\0\0\0\0w\0\0\0t\0http://localhost:8765/loginxt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0qMozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~ø`œ0ù\ì\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpÿÿÿÿt\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0*ÿÿÿÿq\0~\0q\0~\0q\0~\0-q\0~\0q\0~\0xsq\0~\0*ÿÿÿÿq\0~\0q\0~\0t\0arq\0~\0q\0~\0xxt\0GETsq\0~\0pw\0\0\0\0xppt\0\r/css/main.csst\0\"http://localhost:8765/css/main.csst\0httpt\0	localhostt\0\r/css/main.css');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user','password',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-31 11:29:40
