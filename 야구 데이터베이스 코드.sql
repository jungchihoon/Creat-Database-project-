//구단 
//테이블생성
CREATE TABLE `club` (
`clubname` varchar(10) NOT NULL,
`coach` varchar(45) DEFAULT NULL,
`homestadium` varchar(45) DEFAULT NULL,
`rank` int(11) DEFAULT NULL,
PRIMARY KEY (`clubname`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

//데이터 삽입
INSERT INTO `club` VALUES
('KIA','김기태','광주',8), ('KT','조범현','수원',9),('LG','양상문','잠실',5),
('NC','김경문','마산',2),('SK','김용희','인천',4),('넥센','염경엽','고척',3),
('두산','김태형','잠실',1),('롯데','조원우','사직',7),('삼성','류중일','대구',6),
('한화','김성근','대전',10);


//match 경기
//테이블 생성
CREATE TABLE `match0` (
`date` date NOT NULL,
`home` varchar(45) NOT NULL,
`away` varchar(45) DEFAULT NULL,
`time` time DEFAULT NULL,
`stadium` varchar(45) DEFAULT NULL,
PRIMARY KEY (`date`, `home`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

//데이터 삽입
INSERT INTO `match0` VALUES
('2017-06-29','KT','한화','18:30:00','청주'),('2017-06-29','LG','롯데','18:30:00','사직'),
('2017-06-29','SK','두산','18:30:00','잠실'),('2017-06-29','삼성','KIA','18:30:00','광주'),
('2017-06-29','넥센','NC','18:30:00','마산'),('2017-06-30','KIA','LG','18:30:00','잠실'),
('2017-06-30','NC','롯데','18:30:00','사직'),('2017-06-30','삼성','SK','18:30:00','문학'),
('2017-06-30','두산','한화','18:30:00','대전'),('2017-06-30','넥센','KT','18:30:00','수원');






//player (선수)
//테이블 생성

CREATE TABLE `player`(
`playernumber` int(11) NOT NULL,
`playername` varchar(45) NOT NULL,
`clubname` varchar(45) DEFAULT NULL,
`dateofbirth` date DEFAULT NULL,
`position` varchar(45) DEFAULT NULL,
PRIMARY KEY (`playernumber`,`playername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//데이터 삽입

INSERT INTO `player` VALUES
(2,'오지환','LG','1990-03-12','내야수'),(6,'김성현','SK','1987-03-09','내야수'),
(6,'대니돈','넥센','1984-07-20','내야수'),(7,'이병규','LG','1983-10-09','외야수'),
(8,'정근우','한화','1982-10-02','내야수'),(11,'류제국','LG','1983-05-30','투수'),
(13,'윤석민','넥센','1985-09-04','내야수'),(14,'서건창','넥센','1989-08-22','내야수'),
(14,'최정','SK','1987-02-28','내야수'),(14,'테임즈','NC','1986-11-10','내야수'),
(15,'이용규','한화','1985-08-26','외야수'),(16,'김주찬','KIA','1981-03-25','외야수'),
(17,'이명기','SK','1987-12-26','외야수'),(18,'박석민','NC','1985-06-22','내야수'),
(23,'차우찬','삼성','1987-05-31','투수'),(24,'김문호','롯데','1987-06-22','외야수'),
(24,'오재원','두산','1985-02-09','내야수'),(24,'임훈','LG','1985-07-17','외야수'),
(25,'배영섭','삼성','1986-06-27','외야수'),(25,'양의지','두산','1987-06-05','포수'),
(25,'이범호','KIA','1981-11-25','내야수'),(25,'최준석','롯데','1983-02-15','내야수'),
(27,'이호준','NC','1976-02-08','내야수'),(28,'장원준','두산','1985-07-31','투수'),
(29,'김광현','SK','1988-07-22','투수'),(30,'신현철','KT','1987-11-02','내야수'),
(31,'손아섭','롯데','1988-03-18','외야수'),(32,'박세웅','롯데','1995-11-30','투수'),
(33,'김주형','KIA','1985-12-15','내야수'),(33,'박용택','LG','1979-04-21','내야수'),
(34,'최형우','삼성','1983-12-16','외야수'),(35,'이진영','KT','1980-06-15','외야수'),
(36,'오재일','두산','1986-10-29','내야수'),(36,'유민상','KT','1989-04-13','내야수'),
(36,'이승엽','삼성','1976-08-18','내야수'),(37,'밴와트','KT','1986-02-14','투수'),
(37,'신재영','넥센','1989-11-18','투수'),(37,'정의윤','SK','1986-07-25','외야수'),
(42,'로저스','한화','1985-08-14','투수'),(43,'헥터','KIA','1987-01-26','투수'),
(44,'조인성','한화','1975-05-25','포수'),(47,'강민호','롯데','1985-08-18','포수'),
(47,'나성범','NC','1989-10-03','외야수'),(49,'민병헌','두산','1987-03-10','외야수'),
(51,'이재학','NC','1990-10-04','투수'),(52,'김태균','한화','1982-05-29','내야수'),
(53,'고종욱','넥센','1989-01-11','외야수'),(53,'이대형','KT','1983-07-19','외야수'),
(58,'박해민','삼성','1990-02-24','내야수'),(99,'필','KIA','1984-09-09','내야수');


//PITCHER 투수
//테이블 생성

CREATE TABLE `pitcher` (
`playernumber` int(11) NOT NULL,
`playername` varchar(45) NOT NULL,
`ERA` float DEFAULT NULL,
`win` int(11) DEFAULT NULL,
`lose` int(11) DEFAULT NULL,
PRIMARY KEY (`playernumber`,`playername`),
CONSTRAINT `playernumber` FOREIGN KEY (`playernumber`) REFERENCES `player`
(`playernumber`) ON DELETE NO ACTION ON UPDATE CASCADE
CONSTRAINT `playername` FOREIGN KEY (`playername`) REFERENCES `player`
(`playername`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


//데이터삽입
 INSERT INTO `pitcher` VALUES
 (11,'류제국',4.01,3,5),(23,'차우찬',4.5,1,3),(28,'장원준',3.73,7,2),
 (29,'김광현',3.14,5,5), (32,'박세웅',5.08,4,4),(37,'밴와트',4.93,3,5),
 (37,'신재영',2.98,7,2),(42,'로저스',3.82,2,3),(43,'헥터',2.95,6,1),
 (51,'이재학',3.83,5,2);




 // HITTER 타자

 //테이블 생성

 CREATE TABLE `hitter`(
 	`playernumber` int(11) NOT NULL,
 	`playername` varchar(45) NOT NULL,
 	`position` varchar(45) DEFAULT NULL,
 	`avr` float DEFAULT NULL,
 	`RBI` int(11) DEFAULT NULL,
 	`homerun` int(11) DEFAULT NULL,
 	PRIMARY KEY (`playernumber`, `playername`)
 	CONSTRAINT `playernumber2` FOREIGN KEY (`playernumber`) REFERENCES `player`
 	(`playernumber`) ON DELETE NO ACTION ON UPDATE CASCADE
 	CONSTRAINT `playername2` FOREIGN KEY (`playername`) REFERENCES `player`
 	(`playername`) ON DELETE NO ACTION ON UPDATE CASCADE
 	) ENGINE = InnoDB DEFAULT CHARSET=utf8;


 //데이터 삽입

 INSERT INTO `hitter` VALUES
 (2,'오지환','내야수',0.186,19,3),(6,'김성현','내야수',0.342,29,4),
 (6,'대니돈','내야수',0.277,37,10),(7,'이병규','외야수',0.293,23,5),
 (8,'정근우','내야수',0.291,30,6),(13,'윤석민','내야수',0.271,6,2),
 (14,'서건창','내야수',0.301,28,2),(14,'최정','내야수',0.268,32,15),
 (14,'테임즈','내야수',0.368,46,16),(15,'이용규','외야수',0.324,18,1),
 (16,'김주찬','외야수',0.406,21,6),(24,'오재원','내야수',0.295,21,2),
 (24,'임훈','외야수',0.261,4,0),(25,'배영섭','외야수',0.266,20,3),
 (25,'양의지','포수',0.34,33,10),(25,'이범호','내야수',0.317,29,8),
 (25,'최준석','내야수',0.276,42,12),(27,'이호준','내야수',0.316,40,8),
 (30,'신형철','내야수',0.278,2,0),(31,'손아섭','외야수',0.32,21,6),
 (33,'김주형','내야수',0.263,11,6),(33,'박용택','내야수',0.32,24,4),
 (34,'최형우','외야수',0.375,57,14),(35,'이진영','외야수',0.327,32,7),
 (36,'오재일','내야수',0.363,29,8),(36,'유민상','내야수',0.333,2,0),
 (36,'이승엽','내야수',0.294,44,10),(37,'정의윤','외야수',0.323,47,10),
 (44,'조인성','포수',0.154,6,2),(47,'강민호','포수',0.319,29,9),
 (47,'나성범','외야수',0.343,46,10),(49,'민병헌','외야수',0.362,38,10),
 (52,'김태균','내야수',0.33,38,4),(53,'고종욱','외야수',0.316,24,1),
 (53,'이대형','외야수',0.324,18,0),(58,'박해민','내야수',0.293,16,1),
 (99,'필','내야수',0.306,27,5);

 //메이저리그 경기
 //테이블 생성

 CREATE TABLE `majorgame` (
 	`playername` varchar(45) NOT NULL,
 	`date` date NOT NULL,
 	`game` varchar(45) DEFAULT NULL,
 	`time` time DEFAULT NULL,
 	PRIMARY KEY (`playername`,`date`)
 	) ENGINE = InnoDB DEFAULT CHARSET=utf8;

 //데이터 삽입

 INSERT INTO `majorgame` VALUES
 ('김현수','2017-06-29','볼티모어 vs 토론토','08:07:00'),
 ('김현수','2017-06-30','볼티모어 vs 토론토','08:07:00'),
 ('추신수','2017-06-29','텍사스 vs 클리브랜드','08:10:00'),
 ('추신수','2017-06-30','텍사스 vs 클리브랜드','01:10:00'),
 ('오승환','2017-06-29','세인트루이스 vs 에리조나','10:40:00'),
 ('오승환','2017-06-30','세인트루이스 vs 에리조나','04:40:00'),
 ('류현진','2017-06-29','LA다저스 vs LA에인절스','11:07:00'),
 ('류현진','2017-06-30','LA다저스 vs LA에인절스','11:07:00');
 


//메이저리그 선수
//테이블 생성 

CREATE TABLE `majorplayer` (
`playername` varchar(45) NOT NULL,
`dateOfbirth` date DEFAULT NULL,
`currentclub` varchar (45) DEFAULT NULL,
`previousclub` varchar(45) DEFAULT NULL,
`position` varchar(45) DEFAULT NULL,
PRIMARY KEY (`playername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//데이터 삽입
INSERT INTO `majorplayer` VALUES 
('추신수','1982-07-13','텍사스','신시내티','외야수'),
('김현수','1988-01-12','볼티모어','두산','외야수'),
('류현진','1987-03-25','LA다저스','한화','외야수'),
('오승한','1982-07-15','세인트루이스','삼성','외야수');


//메이저리그 투수
//테이블생성

CREATE TABLE `majorpitcher`(
`name` varchar(10) NOT NULL,
`ERA` float DEFAULT NULL,
`win` int(11) DEFAULT NULL,
`lose` int(11) DEFAULT NULL,
PRIMARY KEY (`name`)
CONSTRAINT `name` FOREIGN KEY (`name`) REFERENCES `majorplayer`
(`playername`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

//데이터 삽입
INSERT INTO `majorpitcher` VALUES 
('오승환',3.60,1,4),
('류현진',4.30,3,6);


//메이저리그 타자
//테이블생성

CREATE TABLE `majorhitter` (
`name` varchar(10) NOT NULL,
`position` varchar(45) DEFAULT NULL,
`avr` float DEFAULT NULL,
`RBI` int(11) DEFAULT NULL,
`homerun` int(11) DEFAULT NULL,
PRIMARY KEY (`name`)
CONSTRIANT `name2` FOREIGN KEY (`name`) REFERENCES `majorplayer`
(`playername`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

//데이터 삽입

INSERT INTO `majorhitter` VALUES
('김현수','외야수',0.245,8,1),('추신수','외야수',0.257,39,12);
