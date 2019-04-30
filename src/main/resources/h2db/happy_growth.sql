BEGIN;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE `g_grade_class` (
 `grade_class_id` int(11) NOT NULL AUTO_INCREMENT,
 `number` varchar(16) NOT NULL,
 `name` varchar(1024) DEFAULT NULL,
 `en_name` varchar(1024) DEFAULT NULL,
 `abbreviation` varchar(32) DEFAULT NULL,
 `rank` int(8) DEFAULT NULL,
 `version_no` int(11) DEFAULT NULL,
 `parent_number` varchar(16) DEFAULT NULL,
 `parent_version_no` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`grade_class_id`)
);
CREATE TABLE `g_grade_class_colour` (
 `grade_class_colour_id` int(11) NOT NULL AUTO_INCREMENT,
 `number` varchar(16) NOT NULL,
 `back_hex` varchar(64) DEFAULT NULL,
 `text_hex` varchar(64) DEFAULT NULL,
 `g2c_back_hex` varchar(64) DEFAULT NULL,
 `g2c_text_hex` varchar(64) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`grade_class_colour_id`)
);
CREATE TABLE `g_grade_frame` (
 `grade_frame_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `grade_num` int(11) DEFAULT NULL,
 `grade_range` varchar(64) DEFAULT NULL,
 `school_id` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`grade_frame_id`)
);
CREATE TABLE `g_grade_level` (
 `grade_level_id` int(11) NOT NULL AUTO_INCREMENT,
 `grade_class_id` int(11) DEFAULT NULL,
 `point` decimal(11,2) DEFAULT NULL,
 `name` varchar(512) DEFAULT NULL,
 `en_name` varchar(512) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`grade_level_id`)
);
CREATE TABLE `g_grade_record` (
 `grade_record_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) DEFAULT NULL,
 `grade_table_id` int(11) DEFAULT NULL,
 `class_id` int(11) DEFAULT NULL,
 `student_id` int(11) DEFAULT NULL,
 `grade_class_id` int(11) DEFAULT NULL,
 `grade_level_id` int(11) DEFAULT NULL,
 `semester_id` int(11) DEFAULT NULL,
 `hold_time` datetime DEFAULT NULL,
 `point` decimal(11,2) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`grade_record_id`)
);
CREATE TABLE `g_grade_table` (
 `grade_table_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `en_name` varchar(255) DEFAULT NULL,
 `grade_frame_id` int(11) NOT NULL,
 `send_time_range_left` datetime DEFAULT NULL,
 `send_time_range_right` datetime DEFAULT NULL,
 `sort_num` int(11) NOT NULL,
 `school_id` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`grade_table_id`)
);
CREATE TABLE `g_grade_table_class` (
 `grade_table_class_id` int(11) NOT NULL AUTO_INCREMENT,
 `grade_table_id` int(11) NOT NULL,
 `grade_class_id` int(11) NOT NULL,
 `rank` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`grade_table_class_id`)
);
CREATE TABLE `g_grade_table_history_data` (
 `table_history_data_id` int(11) NOT NULL AUTO_INCREMENT,
 `semester_id` int(11) DEFAULT NULL,
 `section_id` int(11) DEFAULT NULL,
 `class_id` int(11) DEFAULT NULL,
 `class_data_json` longtext,
 `grade_frame_id` int(11) DEFAULT NULL,
 `grade_frame_data_json` longtext,
 `grade_table_id` int(11) DEFAULT NULL,
 `grade_table_data_json` longtext,
 `grade_class_data_json` longtext,
 PRIMARY KEY (`table_history_data_id`)
);
CREATE TABLE `g_grade_table_send_parent` (
 `table_send_par_id` int(11) NOT NULL AUTO_INCREMENT,
 `table_send_stu_id` int(11) NOT NULL,
 `member_id` int(11) NOT NULL,
 `read_flag` bit(1) NOT NULL DEFAULT 0,
 `read_time` datetime DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`table_send_par_id`)
);
CREATE TABLE `g_grade_table_send_student` (
 `table_send_stu_id` int(11) NOT NULL AUTO_INCREMENT,
 `grade_table_id` int(11) NOT NULL,
 `class_id` int(11) NOT NULL,
 `student_id` int(11) NOT NULL,
 `send_time` datetime DEFAULT NULL,
 `data_json` longtext,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 `semester_id` int(11) DEFAULT NULL,
 `status` varchar(8) DEFAULT NULL,
 PRIMARY KEY (`table_send_stu_id`)
);
CREATE TABLE `m_member` (
 `member_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `en_name` varchar(64) DEFAULT NULL,
 `mobile` varchar(64) DEFAULT NULL,
 `password` varchar(64) DEFAULT NULL,
 `gender` varchar(8) DEFAULT NULL,
 `avatar_url` varchar(512) DEFAULT 'https://file-hagrowth.dipont.com/tmp/wxf1870e555681db7c.o6zAJs59eKIZCg3mWVQq4xFuP5Yk.czyBcK9jNU3y3a8edea951ddde39253a4f167e137aaf.png',
 `member_type` varchar(8) NOT NULL DEFAULT '1000',
 `open_id` varchar(128) DEFAULT NULL,
 `activate_flag` bit(1) NOT NULL DEFAULT 0,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`member_id`)
);
CREATE TABLE `m_parent` (
 `parent_id` int(11) NOT NULL AUTO_INCREMENT,
 `member_id` int(11) NOT NULL,
 PRIMARY KEY (`parent_id`)
);
CREATE TABLE `m_parent_student` (
 `parent_student_id` int(11) NOT NULL AUTO_INCREMENT,
 `member_id` int(11) NOT NULL,
 `student_id` int(11) NOT NULL,
 `is_major` bit(1) DEFAULT NULL,
 `relationship` varchar(20) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`parent_student_id`)
);
CREATE TABLE `m_student` (
 `student_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `en_name` varchar(64) DEFAULT NULL,
 `avatar_url` varchar(512) DEFAULT 'https://file-hagrowth.dipont.com/tmp/wxf1870e555681db7c.o6zAJs59eKIZCg3mWVQq4xFuP5Yk.czyBcK9jNU3y3a8edea951ddde39253a4f167e137aaf.png',
 `gender` varchar(8) DEFAULT NULL,
 `birthday` datetime DEFAULT NULL,
 `school_id` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 `status` varchar(8) DEFAULT '1014',
 PRIMARY KEY (`student_id`)
);
CREATE TABLE `m_teacher` (
 `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
 `member_id` int(11) NOT NULL,
 `school_id` int(11) DEFAULT NULL,
 PRIMARY KEY (`teacher_id`)
);
CREATE TABLE `m_verify_code` (
 `verify_code_id` int(11) NOT NULL AUTO_INCREMENT,
 `mobile` varchar(64) NOT NULL,
 `verify_code` varchar(128) NOT NULL,
 `send_time` datetime NOT NULL,
 `failure_time` datetime NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`verify_code_id`)
);
CREATE TABLE `s_class` (
 `class_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `section_id` int(11) DEFAULT NULL,
 `address` varchar(64) DEFAULT NULL,
 `school_id` int(11) DEFAULT NULL,
 `grade_table_id` int(11) DEFAULT NULL,
 `grade_table_open_time` datetime DEFAULT NULL,
 `max_student_num` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`class_id`)
);
CREATE TABLE `s_class_student` (
 `class_student_id` int(11) NOT NULL AUTO_INCREMENT,
 `class_id` int(11) NOT NULL,
 `student_id` int(11) NOT NULL,
 `status` varchar(8) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`class_student_id`)
);
CREATE TABLE `s_class_teacher` (
 `class_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
 `class_id` int(11) NOT NULL,
 `member_id` int(11) NOT NULL,
 `job_type` varchar(8) NOT NULL DEFAULT '1000',
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`class_teacher_id`)
);
CREATE TABLE `s_school` (
 `school_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `city_id` int(11) DEFAULT NULL,
 `province_id` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`school_id`)
);
CREATE TABLE `s_section` (
 `section_id` int(11) NOT NULL,
 `name` varchar(64) DEFAULT NULL,
 `en_name` varchar(64) DEFAULT NULL,
 `school_id` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`section_id`)
);
CREATE TABLE `s_section_table` (
 `section_table_id` int(11) NOT NULL AUTO_INCREMENT,
 `section_id` int(11) NOT NULL,
 `grade_table_id` int(11) NOT NULL,
 `sort_num` int(11) NOT NULL,
 `semester_type` varchar(8) DEFAULT NULL,
 `semester_id` int(11) NOT NULL,
 `school_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`section_table_id`)
);
CREATE TABLE `s_semester` (
 `semester_id` int(11) NOT NULL AUTO_INCREMENT,
 `start_time` date DEFAULT NULL,
 `end_time` date DEFAULT NULL,
 `semester_type` varchar(8) DEFAULT NULL,
 `name` varchar(64) DEFAULT NULL,
 `status` varchar(8) DEFAULT NULL,
 `school_id` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`semester_id`)
);
CREATE TABLE `sys_international` (
 `international_id` int(8) NOT NULL AUTO_INCREMENT,
 `message_key` varchar(64) DEFAULT NULL,
 `message_value` varchar(64) DEFAULT NULL,
 `message_lang` varchar(8) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`international_id`)
);
CREATE TABLE `sys_permission` (
 `permission_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`permission_id`)
);
CREATE TABLE `sys_property` (
 `pro_id` int(8) NOT NULL AUTO_INCREMENT,
 `table_name` varchar(64) NOT NULL,
 `field_name` varchar(64) NOT NULL,
 `pro_key` varchar(8) NOT NULL,
 `pro_value` varchar(64) NOT NULL,
 `pro_en_value` varchar(64) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`pro_id`)
);
CREATE TABLE `sys_role` (
 `role_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`role_id`)
);
CREATE TABLE `sys_role_member` (
 `role_member_id` int(11) NOT NULL AUTO_INCREMENT,
 `role_id` int(11) NOT NULL,
 `member_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`role_member_id`)
);
CREATE TABLE `sys_role_permission` (
 `role_permission_id` int(11) NOT NULL AUTO_INCREMENT,
 `role_id` int(11) NOT NULL,
 `permission_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`role_permission_id`)
);
CREATE TABLE `t_trace` (
 `trace_id` int(11) NOT NULL AUTO_INCREMENT,
 `member_id` int(11) DEFAULT NULL,
 `grade_table_id` int(11) DEFAULT NULL,
 `class_id` int(11) DEFAULT NULL,
 `post_class_name` varchar(64) DEFAULT NULL,
 `post_section_id` int(11) DEFAULT NULL,
 `content` text,
 `post_time` datetime NOT NULL,
 `hold_time` datetime DEFAULT NULL,
 `semester_id` int(11) DEFAULT NULL,
 `trace_status` varchar(8) DEFAULT NULL,
 `score_flag` bit(1) NOT NULL DEFAULT 0,
 `share_flag` bit(1) NOT NULL DEFAULT 0,
 `source_type` varchar(8) DEFAULT NULL,
 `source_member_id` int(11) DEFAULT NULL,
 `behavior_analysis` text,
 `teaching_strategies` text,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_id`)
);
CREATE TABLE `t_trace_belong` (
 `trace_belong_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) NOT NULL,
 `trace_type_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_belong_id`)
);
CREATE TABLE `t_trace_grade_class` (
 `trace_grade_class_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) NOT NULL,
 `grade_class_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_grade_class_id`)
);
CREATE TABLE `t_trace_like` (
 `trace_like_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) NOT NULL,
 `member_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_like_id`)
);
CREATE TABLE `t_trace_resource_url` (
 `trace_resource_url_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) NOT NULL,
 `resource_url` varchar(512) NOT NULL,
 `resource_type` varchar(8) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_resource_url_id`)
);
CREATE TABLE `t_trace_review` (
 `trace_review_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) NOT NULL,
 `last_trace_review_id` int(11) DEFAULT NULL,
 `content` text,
 `member_id` int(11) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_review_id`)
);
CREATE TABLE `t_trace_share` (
 `trace_share_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) NOT NULL,
 `member_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_share_id`)
);
CREATE TABLE `t_trace_student` (
 `trace_student_id` int(11) NOT NULL AUTO_INCREMENT,
 `trace_id` int(11) NOT NULL,
 `student_id` int(11) NOT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_student_id`)
);
CREATE TABLE `t_trace_type` (
 `trace_type_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) DEFAULT NULL,
 `delete_flag` bit(1) NOT NULL DEFAULT 0,
 `creator` int(11) NOT NULL DEFAULT '0',
 `create_time` datetime NOT NULL,
 `modifier` int(11) NOT NULL DEFAULT '0',
 `modify_time` datetime NOT NULL,
 PRIMARY KEY (`trace_type_id`)
);
SET FOREIGN_KEY_CHECKS = 1;
COMMIT;