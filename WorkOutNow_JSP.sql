DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`m_id`	varchar(30)	NOT NULL,
	`m_pw`	varchar(30)	NOT NULL,
	`m_brith`	varchar(30)	NULL,
	`m_gender`	varchar(5)	NULL,
	`m_phone`	varchar(30)	NULL,
	`m_coin`	int	NOT NULL	DEFAULT 0,
	`m_grade`	varchar(5)	NOT NULL	COMMENT 'T-트레이너, C-회원, A-관리자',
	`c_code`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `trainer`;

CREATE TABLE `trainer` (
	`t_id`	varchar(30)	NOT NULL,
	`t_con_cnt`	int	NOT NULL	DEFAULT 0,
	`t_pt_cnt`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `pt`;

CREATE TABLE `pt` (
	`pt_id`	varchar(30)	NOT NULL	COMMENT '동네코드+일련번호',
	`t_id`	varchar(30)	NOT NULL,
	`pt_title`	varchar(30)	NULL,
	`pt_one_c`	int	NULL,
	`pt_con_c`	int	NULL,
	`pt_content`	text	NULL,
	`pt_like`	int	NOT NULL	DEFAULT 0
);

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
	`c_code`	varchar(20)	NOT NULL,
	`c_name`	varchar(30)	NOT NULL
);

DROP TABLE IF EXISTS `member_pt`;

CREATE TABLE `member_pt` (
	`mp_code`	varchar(50)	NOT NULL	COMMENT '상품번호+아이디+상태+일련번호',
	`m_id`	varchar(30)	NOT NULL,
	`pt_id`	varchar(30)	NOT NULL	COMMENT 'C-상담, PT-수업 + 일련번호',
	`t_id`	varchar(30)	NOT NULL,
	`mp_stat`	varchar(30)	NOT NULL	COMMENT 'CR-장바구니, M-결제완료, W-대기, P-진행중,  CM-완료',
	`mp_date`	date	NULL,
	`mp_coin`	int	NULL,
	`mp_cnt`	int	NULL,
	`mp_tall`	int	NULL,
	`mp_weight`	int	NULL,
	`mp_detail`	varchar(100)	NULL
);

DROP TABLE IF EXISTS `m_image`;

CREATE TABLE `m_image` (
	`m_id`	varchar(30)	NOT NULL,
	`mi_file_name`	varchar(100)	NOT NULL,
	`mi_path`	varchar(100)	NOT NULL,
	`mi_size`	int	NOT NULL,
	`mi_thum_name`	varchar(100)	NULL
);

DROP TABLE IF EXISTS `pt_image`;

CREATE TABLE `pt_image` (
	`p_id`	varchar(30)	NOT NULL	COMMENT 'C-상담, PT-수업 + 일련번호',
	`t_id`	varchar(30)	NOT NULL,
	`mi_file_name`	varchar(100)	NOT NULL,
	`mi_path`	varchar(100)	NOT NULL,
	`mi_size`	int	NOT NULL,
	`mi_thum_name`	varchar(100)	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`m_id`
);

ALTER TABLE `trainer` ADD CONSTRAINT `PK_TRAINER` PRIMARY KEY (
	`t_id`
);

ALTER TABLE `pt` ADD CONSTRAINT `PK_PT` PRIMARY KEY (
	`pt_id`,
	`t_id`
);

ALTER TABLE `city` ADD CONSTRAINT `PK_CITY` PRIMARY KEY (
	`c_code`
);

ALTER TABLE `member_pt` ADD CONSTRAINT `PK_MEMBER_PT` PRIMARY KEY (
	`mp_code`,
	`m_id`,
	`pt_id`,
	`t_id`
);

ALTER TABLE `m_image` ADD CONSTRAINT `PK_M_IMAGE` PRIMARY KEY (
	`m_id`
);

ALTER TABLE `pt_image` ADD CONSTRAINT `PK_PT_IMAGE` PRIMARY KEY (
	`p_id`,
	`t_id`
);

ALTER TABLE `trainer` ADD CONSTRAINT `FK_member_TO_trainer_1` FOREIGN KEY (
	`t_id`
)
REFERENCES `member` (
	`m_id`
);

ALTER TABLE `pt` ADD CONSTRAINT `FK_trainer_TO_pt_1` FOREIGN KEY (
	`t_id`
)
REFERENCES `trainer` (
	`t_id`
);

ALTER TABLE `member_pt` ADD CONSTRAINT `FK_member_TO_member_pt_1` FOREIGN KEY (
	`m_id`
)
REFERENCES `member` (
	`m_id`
);

ALTER TABLE `member_pt` ADD CONSTRAINT `FK_pt_TO_member_pt_1` FOREIGN KEY (
	`pt_id`
)
REFERENCES `pt` (
	`pt_id`
);

ALTER TABLE `member_pt` ADD CONSTRAINT `FK_pt_TO_member_pt_2` FOREIGN KEY (
	`t_id`
)
REFERENCES `pt` (
	`t_id`
);

ALTER TABLE `m_image` ADD CONSTRAINT `FK_member_TO_m_image_1` FOREIGN KEY (
	`m_id`
)
REFERENCES `member` (
	`m_id`
);

ALTER TABLE `pt_image` ADD CONSTRAINT `FK_pt_TO_pt_image_1` FOREIGN KEY (
	`p_id`
)
REFERENCES `pt` (
	`pt_id`
);

ALTER TABLE `pt_image` ADD CONSTRAINT `FK_pt_TO_pt_image_2` FOREIGN KEY (
	`t_id`
)
REFERENCES `pt` (
	`t_id`
);

