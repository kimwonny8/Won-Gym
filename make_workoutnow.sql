DROP DATABASE  'workoutnow_db';
CREATE DATABASE  'workoutnow_db'
USE 'workoutnow_db';

CREATE TABLE 'member' (
  'm_id' varchar(30) NOT NULL,
  'm_pw' varchar(30) NOT NULL,
  'm_name' varchar(30) NOT NULL,
  'm_birth' varchar(30) DEFAULT NULL,
  'm_gender' varchar(5) DEFAULT NULL,
  'm_phone' varchar(30) DEFAULT NULL,
  'm_coin' int(11) NOT NULL DEFAULT 0,
  'm_grade' varchar(20) NOT NULL,
  'c_code' varchar(20) NOT NULL,
  PRIMARY KEY ('m_id')
) 

CREATE TABLE 'member_pt' (
  'mp_code' int(11) NOT NULL AUTO_INCREMENT,
  'm_id' varchar(30) NOT NULL,
  'pt_code' int(11) NOT NULL,
  't_id' varchar(30) NOT NULL,
  'mp_state' varchar(30) DEFAULT NULL COMMENT 'CR-장바구니, PP-결제진행중, PC-결제완료(대기), CP-진행중,  CC-완료, RE-취소',
  'mp_date' timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  'mp_coin' int(11) DEFAULT NULL,
  'mp_cnt' int(11) DEFAULT NULL,
  'mp_tall' int(11) DEFAULT NULL,
  'mp_weight' int(11) DEFAULT NULL,
  'mp_detail' varchar(100) DEFAULT NULL,
  PRIMARY KEY ('mp_code'),
  KEY 'FK_member_TO_member_pt_1' ('m_id'),
  KEY 'FK_pt_TO_member_pt_2' ('t_id'),
  KEY 'FK_member_pt_pt' ('pt_code') USING BTREE,
  CONSTRAINT 'FK_member_TO_member_pt_1' FOREIGN KEY ('m_id') REFERENCES 'member' ('m_id') ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 'FK_member_pt_pt' FOREIGN KEY ('pt_code') REFERENCES 'pt' ('pt_code') ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 'FK_pt_TO_member_pt_2' FOREIGN KEY ('t_id') REFERENCES 'pt' ('t_id') ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE 'm_image' (
  'm_id' varchar(30) NOT NULL,
  'mi_file_name' varchar(100) NOT NULL,
  'mi_size' int(11) NOT NULL,
  'mi_thum_name' varchar(100) DEFAULT NULL,
  PRIMARY KEY ('m_id'),
  CONSTRAINT 'FK_member_TO_m_image_1' FOREIGN KEY ('m_id') REFERENCES 'member' ('m_id') ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE 'pt' (
  'pt_code' int(11) NOT NULL AUTO_INCREMENT COMMENT '동네코드+일련번호',
  't_id' varchar(30) NOT NULL,
  'pt_title' varchar(30) DEFAULT NULL,
  'pt_con_c' int(11) DEFAULT NULL,
  'pt_one_c' int(11) DEFAULT NULL,
  'pt_content' text DEFAULT NULL,
  'pt_like' int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY ('pt_code') USING BTREE,
  KEY 'FK_pt_trainer' ('t_id'),
  CONSTRAINT 'FK_pt_trainer' FOREIGN KEY ('t_id') REFERENCES 'trainer' ('t_id') ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE 'trainer' (
  't_id' varchar(30) NOT NULL,
  't_con_cnt' int(11) NOT NULL DEFAULT 0,
  't_pt_cnt' int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY ('t_id'),
  CONSTRAINT 'FK_member_TO_trainer_1' FOREIGN KEY ('t_id') REFERENCES 'member' ('m_id') ON DELETE CASCADE ON UPDATE CASCADE
) 