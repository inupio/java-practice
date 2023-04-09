-------------------user-------------------------------------------
DROP TABLE IF EXISTS `air_db_user`;				
/*!40101 SET @saved_cs_client     = @@character_set_client */;				
/*!50503 SET character_set_client = utf8mb4 */;				
CREATE TABLE `air_db_user` (				
`user_id` int NOT NULL AUTO_INCREMENT,				
`user_name` varchar(255) NOT NULL,				
`user_password` varchar(255) NOT NULL,				
`user_email` varchar(45) DEFAULT NULL,				
`user_tele` int DEFAULT NULL,				
`user_address` varchar(200) DEFAULT NULL,				
`user_account_status` tinyint NOT NULL DEFAULT '1',				
`user_balance` int DEFAULT NULL,				
`user_tax_num` int DEFAULT NULL,				
`user_tax_vatnum` int DEFAULT NULL,				
`user_global_language` varchar(45) NOT NULL DEFAULT 'Japanese',				
`user_global_time` varchar(45) NOT NULL DEFAULT 'UTC + 9',				
`user_global_infaltion` varchar(45) NOT NULL DEFAULT 'JPY',				
PRIMARY KEY (`user_id`)				
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;				


----------------------booking--------------------------------
	DROP TABLE IF EXISTS `air_booking`;							
	/*!40101 SET @saved_cs_client     = @@character_set_client */;							
	/*!50503 SET character_set_client = utf8mb4 */;							
	CREATE TABLE `air_booking` (							
	`user_id` int NOT NULL AUTO_INCREMENT,							
	`user_name` varchar(20) NOT NULL,							
	`room_id` int NOT NULL,							
	`room_name` varchar(45) NOT NULL,							
	`room_original_price` int DEFAULT NULL,							
	`room_price_offtax` int NOT NULL,							
	`room_review_rank` double NOT NULL,							
	`room_review_count` int NOT NULL,							
	`check_in_date` date NOT NULL,							
	`check_out_date` date NOT NULL,							
	`adult_num` int DEFAULT '1',							
	`children_num` int DEFAULT '0',							
	`infant_num` int DEFAULT '0',							
	`pet_num` int DEFAULT '0',							
	`customer_total_num` int GENERATED ALWAYS AS (((`adult_num` + `children_num`) + `infant_num`)) VIRTUAL,							
	PRIMARY KEY (`user_id`)							
	) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;	
	
	---------------------------------booking status------------------------
	create table booking_status (							
booking_id int(11) auto_increment,							
room_id int(11) ,							
room_name varchar(20),							
user_id int(11),							
user_name varchar(32),							
`check-in_date` date,							
`check-out_date` date,							
total_price int(20),							
`status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 0-pending ，1-confirmed，2-canselled，3-completed',							
							
primary key(booking_id)							
) ENGINE = InnoDB AUTO_INCREMENT = 10896 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;	

-----------------------------------	review--------------------------------------

CREATE TABLE `review_bnb` (							
`review_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '评价编号 自增',							
`room_id` int unsigned NOT NULL COMMENT '房间号',							
`room_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '房子名称',							
`review_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '评价标题',							
`review_detail` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '评价内容',							
`review_date` date NOT NULL COMMENT 'DATE',							
`point_clean` int unsigned NOT NULL COMMENT '评分 清洁度',							
`point_communication` int unsigned NOT NULL COMMENT '评分 交流',							
`point_info` int unsigned NOT NULL COMMENT '评分 情报准确',							
`point_location` int unsigned NOT NULL COMMENT '评分 地理位置',							
`point_price` int unsigned NOT NULL COMMENT '评分 价格',							
`point_checkin` int unsigned NOT NULL COMMENT '评分 办理入住',							
PRIMARY KEY (`review_id`) USING BTREE							
) ENGINE=InnoDB AUTO_INCREMENT=10896 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;							

-------------------------------experience-----------------------------
CREATE TABLE `experience_review` (				
`experience_review_id` varchar(20) NOT NULL,				
`experience_id` varchar(20) NOT NULL,				
`user_id` varchar(20) NOT NULL,				
`rating` int(11) NOT NULL,				
`comment` varchar(200) NOT NULL,				
`date` date NOT NULL,				
PRIMARY KEY (`experience_review_id`)				
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;				
				
CREATE TABLE `experience` (				
`experience_id` varchar(20) NOT NULL,				
`title` varchar(100) NOT NULL COMMENT '体验活动标题',				
`site` varchar(100) NOT NULL COMMENT '活动地点',				
`duration` varchar(100) NOT NULL COMMENT '活动时长',				
`price` varchar(100) NOT NULL COMMENT '活动价格',				
`schedule` varchar(100) NOT NULL COMMENT '活动开展时间段',				
`language` varchar(100) NOT NULL COMMENT '活动语言',				
`content` varchar(200) NOT NULL COMMENT '活动内容',				
`host_id` varchar(100) NOT NULL COMMENT '主持人id',				
`introduce` varchar(200) NOT NULL COMMENT '活动介绍',				
`location` varchar(100) NOT NULL COMMENT '集合地点',				
`message` varchar(200) NOT NULL COMMENT '集合信息',				
PRIMARY KEY (`experience_id`)				
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;				
				
CREATE TABLE `experience_image` (				
`experience_id` varchar(20) NOT NULL,				
`img_id` varchar(20) NOT NULL,				
`imgurl` varchar(100) NOT NULL,				
`show_on_page` tinyint(1) NOT NULL,				
PRIMARY KEY (`img_id`)				
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;				
				
----------------------message-----------
	CREATE TABLE `air_message` (				
	`message_kind` varchar(20) NOT NULL,				
	`message_content` varchar(300) NOT NULL,				
	`message_title` varchar(45) NOT NULL,				
	`message_id` int NOT NULL,				
	`sender_id` int NOT NULL,				
	`sender_name` varchar(30) NOT NULL,				
	`sender_date` date NOT NULL,				
	PRIMARY KEY (`message_kind`)				
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;				
	
-------------------notice-------------------

					
	DROP TABLE IF EXISTS `air_db_notice`;				
	/*!40101 SET @saved_cs_client     = @@character_set_client */;				
	/*!50503 SET character_set_client = utf8mb4 */;				
	CREATE TABLE `air_db_notice` (				
	`user_id` int NOT NULL AUTO_INCREMENT,				
	`user_name` varchar(255) NOT NULL,				
	`notice_id` int NOT NULL,				
	`notice_name` varchar(255) NOT NULL,				
	`notice_content` varchar(255) NOT NULL,				
	`notice_status` varchar(255) NOT NULL,				
	`notice_date` date DEFAULT NULL,				
	PRIMARY KEY (`user_id`)				
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;				

---------------------wishlists
create table wishlists (							
wishlist_id int(11) auto_increment,							
user_id int (11),							
wishlist_name varchar(32),							
created_date date,							
							
primary key(wishlist_id)							
							
)ENGINE = InnoDB AUTO_INCREMENT = 10896 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;							
							
create table wishlist_rooms(							
wishroom_id int(11),							
room_id int(11),							
wishlist_id int(11),							
added_date date							
							
)ENGINE = InnoDB AUTO_INCREMENT = 10896 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;																								
												