-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.9.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- workoutnow_db 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `workoutnow_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `workoutnow_db`;

-- 테이블 workoutnow_db.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `m_id` varchar(30) NOT NULL,
  `m_pw` varchar(200) NOT NULL,
  `m_name` varchar(30) NOT NULL,
  `m_birth` varchar(30) DEFAULT NULL,
  `m_gender` varchar(5) DEFAULT NULL,
  `m_phone` varchar(30) DEFAULT NULL,
  `m_coin` int(11) NOT NULL DEFAULT 0,
  `m_grade` varchar(20) NOT NULL COMMENT 'client-일반회원, admin-관리자, trainer-트레이너회원, trainerW-트레이너회원승인전',
  `c_code` varchar(20) NOT NULL,
  `m_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 workoutnow_db.member_pt 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_pt` (
  `mp_code` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` varchar(30) NOT NULL,
  `pt_code` int(11) NOT NULL,
  `t_id` varchar(30) NOT NULL,
  `mp_state` varchar(30) DEFAULT NULL COMMENT 'CR-장바구니, PP-결제진행중, PC-결제완료(대기), CP-진행중,  CC-완료, RE-취소',
  `mp_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mp_coin` int(11) DEFAULT NULL,
  `mp_cnt` int(11) DEFAULT NULL,
  `mp_tall` int(11) DEFAULT NULL,
  `mp_weight` int(11) DEFAULT NULL,
  `mp_detail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mp_code`),
  KEY `FK_member_TO_member_pt_1` (`m_id`),
  KEY `FK_pt_TO_member_pt_2` (`t_id`),
  KEY `FK_member_pt_pt` (`pt_code`) USING BTREE,
  CONSTRAINT `FK_member_TO_member_pt_1` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_member_pt_pt` FOREIGN KEY (`pt_code`) REFERENCES `pt` (`pt_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pt_TO_member_pt_2` FOREIGN KEY (`t_id`) REFERENCES `pt` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 workoutnow_db.m_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `m_image` (
  `m_id` varchar(30) NOT NULL,
  `mi_file_name` varchar(100) NOT NULL,
  `mi_size` int(11) NOT NULL DEFAULT 0,
  `mi_thum_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `FK_member_TO_m_image_1` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 workoutnow_db.pt 구조 내보내기
CREATE TABLE IF NOT EXISTS `pt` (
  `pt_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '동네코드+일련번호',
  `t_id` varchar(30) NOT NULL,
  `pt_title` varchar(50) DEFAULT NULL,
  `pt_con_c` int(11) DEFAULT NULL,
  `pt_one_c` int(11) DEFAULT NULL,
  `pt_content` longtext DEFAULT NULL,
  `pt_like` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pt_code`) USING BTREE,
  KEY `FK_pt_trainer` (`t_id`),
  CONSTRAINT `FK_pt_trainer` FOREIGN KEY (`t_id`) REFERENCES `trainer` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 workoutnow_db.trainer 구조 내보내기
CREATE TABLE IF NOT EXISTS `trainer` (
  `t_id` varchar(30) NOT NULL,
  `t_license_name` varchar(100) NOT NULL DEFAULT '0',
  `t_license_num` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_id`),
  CONSTRAINT `FK_member_TO_trainer_1` FOREIGN KEY (`t_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
