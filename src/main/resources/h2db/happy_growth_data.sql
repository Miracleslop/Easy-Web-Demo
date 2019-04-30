SET FOREIGN_KEY_CHECKS = 0;
--  学校

INSERT INTO s_school ( school_id, name, city_id, province_id )
VALUES
	( 1, '南京市第一幼儿园', 1, 1 );


--  学生

INSERT INTO m_student (student_id, name, en_name, gender, birthday, school_id, status )
VALUES
	( 1, '毋一璇', '', 'female', '2014-04-28', 1, 1206 ),
	( 2, '寇叶丰', '', 'female', '2014-05-29', 1, 1206 ),
	( 3, '蒲佳美', '', 'female', '2014-07-13', 1, 1206 ),
	( 4, '祖凡桃', '', 'female', '2014-12-07', 1, 1206 ),
	( 5, '韩瑞云', '', 'female', '2014-07-26', 1, 1206 ),
	( 6, '幸卓然', '', 'female', '2014-11-22', 1, 1206 ),
	( 7, '后志勇', '', 'female', '2014-07-26', 1, 1206 ),
	( 8, '蓬文耀', '', 'female', '2014-07-26', 1, 1206 ),
	( 9, '扈鸿卓', '', 'female', '2014-07-26', 1, 1206 )
;

--  班级和学生的关系
INSERT INTO s_class_student ( class_id, student_id, status )
VALUES
	( 1, 1, '1206' ),
	( 1, 2, '1206' ),
	( 1, 8, '1207' ),
	( 1, 9, '1207' ),
	( 2, 3, '1206' ),
	( 2, 4, '1206' ),
	( 3, 5, '1206' ),
	( 3, 6, '1206' );


--  用户（教师/家长）

INSERT INTO m_member ( member_id, name, en_name, mobile, password, gender, member_type, open_id, activate_flag )
VALUES
	( 1, '陶烨', '', '18913727740', '123456', 'male', '1001', NULL , TRUE ),
	( 2, '褚逸飞', '', '15062228390', '123456', 'male', '1001', NULL , TRUE ),
	( 3, '何小康', '', '13057670012', '123456', 'male', '1001', 'o5Nb00F1gaseE-cqukWCdq8DHvGU', TRUE ),
	( 4, '李志', '', '18221540841', '123456', 'male', '1001', NULL , TRUE ),
	( 5, '陶烨', '', '18913727740', '123456', 'male', '1000', NULL , TRUE ),
	( 6, '褚逸飞', '', '15062228390', '123456', 'male', '1000', NULL , TRUE ),
	( 7, '何小康', '', '13057670012', '123456', 'male', '1000', NULL , TRUE ),
	( 8, '李志', '', '18221540841', '123456', 'male', '1000', NULL , TRUE );


-- 教师附表补齐
insert into m_teacher(member_id, school_id)
select m.member_id, 1
from m_member m
		 left join m_teacher mt on m.member_id = mt.member_id
where mt.member_id is null
  and m.member_type = '1001';

-- 家长附表补齐
insert into m_parent(member_id)
select m_member.member_id
from m_member
		 left join m_parent mp on m_member.member_id = mp.member_id
where mp.parent_id is null;


--  班级和老师的关系
INSERT INTO s_class_teacher ( member_id, class_id, job_type )
VALUES
	( 1, 1, '1012' ),
	( 1, 2, '1011' ),
	( 1, 3, '1011' ),
	( 2, 1, '1011' ),
	( 2, 2, '1012' ),
	( 2, 3, '1011' ),
	( 3, 1, '1012' ),
	( 3, 2, '1011' ),
	( 3, 3, '1011' ),
	( 4, 1, '1011' ),
	( 4, 2, '1012' ),
	( 4, 3, '1011' );

--  家长和学生的关系
INSERT INTO m_parent_student ( member_id, student_id, is_major, relationship )
VALUES
	( 5, 1, TRUE, '爸爸' ),
	( 5, 2, FALSE, '爸爸' ),
	( 5, 3, FALSE, '爸爸' ),
	( 5, 4, FALSE, '爸爸' ),
	( 5, 5, FALSE, '爸爸' ),
	( 5, 6, FALSE, '爸爸' ),
	( 6, 1, FALSE, '爸爸' ),
	( 6, 2, TRUE, '爸爸' ),
	( 6, 3, FALSE, '爸爸' ),
	( 6, 4, FALSE, '爸爸' ),
	( 6, 5, FALSE, '爸爸' ),
	( 6, 6, FALSE, '爸爸' ),
	( 7, 1, FALSE, '爸爸' ),
	( 7, 2, FALSE, '爸爸' ),
	( 7, 3, TRUE, '爸爸' ),
	( 7, 4, FALSE, '爸爸' ),
	( 7, 5, TRUE, '爸爸' ),
	( 7, 6, FALSE, '爸爸' ),
	( 8, 1, FALSE, '爸爸' ),
	( 8, 2, FALSE, '爸爸' ),
	( 8, 3, FALSE, '爸爸' ),
	( 8, 4, TRUE, '爸爸' ),
	( 8, 5, FALSE, '爸爸' ),
	( 8, 6, TRUE, '爸爸' );



--  成长记录类型
	
INSERT INTO t_trace_type ( name )
VALUES
	( 'PE class' ),
	( 'Drama' ),
	( 'Art' ),
	( 'Music' );

--  学期

INSERT INTO s_semester ( semester_id, semester_type, start_time, end_time, name, status, school_id )
VALUES
	( 1, '1204', '2019-03-01', '2019-06-01', '2019-2020', '1202', 1 );

--  班级

INSERT INTO s_class ( class_id, name, section_id, address, grade_table_id, max_student_num, school_id )
VALUES
	( 1, 'HZ-K1A', 1, '河西', 1, 30, 1 ),
	( 2, 'HZ-K2A', 1, '新街口', 1, 30, 1 ),
	( 3, 'HZ-K3A', 3, '杭州', 4, 30, 1 );


--  年级

INSERT INTO s_section ( section_id, `name`, en_name, )
VALUES
	( 1, '小班', 'Kindergarten 1' ),
	( 2, '中班', 'Kindergarten 2' ),
	( 3, '大班', 'Kindergarten 3' );

--  评估计划

INSERT INTO `s_section_table` ( `section_table_id`, `section_id`, `grade_table_id`, `sort_num`, `semester_type`, `semester_id`, `school_id` )
VALUES
	( 1, 1, 1, 1, '1204', 1, 1 ),
	( 2, 1, 2, 2, '1204', 1, 1 ),
	( 3, 1, 3, 3, '1204', 1, 1 ),
	( 4, 3, 4, 1, '1204', 1, 1 ),
	( 5, 3, 5, 2, '1204', 1, 1 );

--  评分类目

INSERT INTO `g_grade_class` ( `grade_class_id`, `number`, `name`, `en_name`, `abbreviation`, `rank`, `version_no`, `parent_number`, `parent_version_no` )
VALUES
	( 1, '00100000', '身体健康与发展', 'Bodily – Kinesthetic  Body Smart', 'BK', 1, 1, '00000000', 1 ),
	( 2, '00100100', '精细运动', 'Fine Motor', 'FM', 2, 1, '00100000', 1 ),
	( 3, '00100101', '使用大拇指和其它两个指头握笔，不再是整手抓笔。', 'Hold pencil between thumb and two fingers, no longer using whole-hand grasp', 'FM1', 3, 1, '00100100', 1 ),
	( 4, '00100200', '自我照料', 'Self-care', 'SC', 2, 1, '00100000', 1 ),
	( 5, '00100201', '在提醒下，按时睡觉和起床，并能坚持午睡。', 'Go to bed and get up on time when reminded. Stick to midday naps.', 'SC1', 3, 1, '00100200', 1 ),
	( 6, '00100202', '喜欢参加体育活动。', 'Engage in physical activities.', 'SC2', 3, 1, '00100200', 1 ),
	( 7, '00200000', '个人、社交与情感发展', 'Intrapersonal Self Smart', 'ITAP', 1, 1, '00000000', 1 ),
	( 8, '00200100', '自信心与自我意识', 'Self- Confidence and Self- Awareness ', 'SI', 2, 1, '00200000', 1 ),
	( 9, '00200101', '自己能做的事情愿意自己做。', 'Do what they are capable of independently.', 'CA1', 3, 1, '00200100', 1 ),
	( 10, '00200102', '能根据自己的兴趣选择游戏或其它活动。', 'Choose play or other activities based on their own interests.', 'CA2', 3, 1, '00200100', 1 ),
	( 11, '00200200', '情感与行为管理', 'Managing Feelings and Behavior (Self- Regulation) ', 'FB', 2, 1, '00200000', 1 ),
	( 12, '00200201', '识别一系列的情绪和感受（自己和他人的）。', 'Identify a variety of feelings and moods (in themselves and others). ', 'FB1', 3, 1, '00200200', 1 ),
	( 13, '00200300', '关系建立', 'Making Relationships', 'MR', 2, 1, '00200000', 1 ),
	( 14, '00200301', '长辈讲话时能认真听，并能听从长辈的要求。', 'Listen carefully to adults and follow their directions.', 'MR1', 3, 1, '00200300', 1 ),
	( 15, '00200400', '社会适应', 'Social Adaptability ', 'SA', 2, 1, '00200000', 1 ),
	( 16, '00200401', '对群体活动有兴趣。', 'Show interest in group activities.', 'SA1', 3, 1, '00200400', 1 );

--  评估四级类目

INSERT INTO `g_grade_level` ( `grade_level_id`, `grade_class_id`, `point`, `name`, `en_name` )
VALUES
	( 1, 3, 2.00, '掌握正确握笔姿势。', 'Scribble with uncontrolled strokes and go off the paper most of the time' ),
	( 2, 3, 4.00, '保持正确握笔姿势超过4秒。', 'Scribbles with controlled but not purposeful and frequently lose contact with the paper' ),
	( 3, 3, 6.00, '保持正确握笔姿势超过10秒。', 'Scribbles are well-controlled , purposeful and seldom lose contact with the paper' ),
	( 4, 5, 2.00, '按时睡觉和起床。', 'Take a longer time to sleep' ),
	( 5, 5, 4.00, '按时睡觉和起床并能坚持超过3天。', 'Need company to sleep' ),
	( 6, 5, 6.00, '按时睡觉和起床并能坚持超过5天。', 'Can sleep independently' ),
	( 7, 6, 2.00, '喜欢参加一项体育活动。', 'Holds cup with both hands and drinks, with assistance' ),
	( 8, 6, 4.00, '喜欢参加两项体育活动。', 'Holds cups both hands and drinks without assistance' ),
	( 9, 6, 6.00, '喜欢参加三项体育活动。', 'Holds cups to drink with one hand' ),
	( 10, 9, 2.00, '在反复督促下自己动手完成。', 'Show sense of self but still dependent on adult’s help' ),
	( 11, 9, 4.00, '在少次督促下自己动手完成。', 'Show pride in new accomplishment' ),
	( 12, 9, 6.00, '自己主动完成。', 'Insist upon doing things for himself / herself' ),
	( 13, 10, 2.00, '根据自己的兴趣选择一项游戏或其他活动。', 'Chooses play according to their own liking' ),
	( 14, 10, 4.00, '根据自己的兴趣选择两项游戏或其他活动。', 'Chooses to participate in an increasing variety of tasks and activities' ),
	( 15, 10, 6.00, '根据自己的兴趣选择三项游戏或其他活动。', 'Develops increased ability to make independent choices' ),
	( 16, 12, 2.00, '识别自己的情绪和感受。', 'Able to distinguish emotional cues between happy and sad' ),
	( 17, 12, 4.00, '识别他人的情绪和感受。', 'Able to distinguish emotional cues between happy, sad and angry' ),
	( 18, 12, 6.00, '识别自己和他人的情绪和感受。', 'Able to share feelings with adults when they are happy, sad or angry' ),
	( 19, 14, 2.00, '长辈讲话时能认真听。', 'Demonstrate warmth when interacting with adult' ),
	( 20, 14, 4.00, '能听从长辈要求。', 'Meet and accept  comfortably ' ),
	( 21, 14, 6.00, '能认真听长辈讲话并听从要求。', 'Respond  appropriately to directions from adult' ),
	( 22, 16, 2.00, '', 'Watches other children play and joins briefly' ),
	( 23, 16, 4.00, '', 'Plays alone in the presence of other children (parallel playing)' ),
	( 24, 16, 6.00, '', 'Begin to play with other children with adult supervision' );

--  颜色

INSERT INTO `g_grade_class_colour` ( `grade_class_colour_id`, `number`, `back_hex`, `text_hex`, `g2c_back_hex`, `g2c_text_hex` )
VALUES
	( 1, '00100000', '#FEC9C8', '#873A3A', '#FFF0EF', '#873A3A' ),
	( 2, '00200000', '#FEE7AB', '#775E40', '#FFF8E5', '#775E40' ),
	( 3, '00300000', '#DCDBF7', '#727091', '#F3F2FE', '#727091' ),
	( 4, '00400000', '#F8DDB8', '#B56D22', '#FEF9F2', '#B56D22' ),
	( 5, '00500000', '#FAE3F2', '#824D71', '#FFFAFD', '#824D71' ),
	( 6, '00600000', '#DDF2E1', '#358A45', '#F4FBF6', '#358A45' ),
	( 7, '00700000', '#FCF3B7', '#716A4C', '#FDFBEB', '#716A4C' ),
	( 8, '00800000', '#DAF1FB', '#507D8F', '#F2FAFE', '#507D8F' );

--  评估框架

INSERT INTO `g_grade_frame` ( `grade_frame_id`, `name`, `grade_num`, `grade_range`, `school_id` )
VALUES
	( 1, 'Enseed', 3, '0, 2, 4, 6', 1 ),
	( 2, 'DRDP', 1, '0, 2, 4, 6', 1 );

--  评估表
INSERT INTO `g_grade_table` ( `grade_table_id`, `name`, `en_name`, `grade_frame_id`, `sort_num`, `school_id` )
VALUES
	( 1, '小班K1 Month1', 'Kindergarten 1 Month 1', 1, 1, 1 ),
	( 2, '小班K1 Month2', 'Kindergarten 1 Month 2', 1, 2, 1 ),
	( 3, '小班K1 Month3', 'Kindergarten 1 Month 3', 1, 3, 1 ),
	( 4, '小班D1 Month1', 'Dragon 1 Month 1', 2, 1, 1 ),
	( 5, '小班D1 Month2', 'Dragon 1 Month 2', 2, 2, 1 );


INSERT INTO `g_grade_table_class` ( `grade_table_id`, `grade_class_id`, `rank` ) SELECT
t.grade_table_id,
g.grade_class_id,
g.rank
FROM
	g_grade_table t,
	g_grade_class g;

INSERT INTO t_trace (trace_id, member_id, grade_table_id, class_id, post_class_name, post_section_id, content, hold_time, semester_id, trace_status, score_flag, share_flag)
VALUES
    ( 1, 4, 4, 3, 'HZ-K3A', 3, '坡上立着一只鹅，坡下就是一条河。宽宽的河，肥肥的鹅，鹅要过河，河要渡鹅不知是鹅过河，还是河渡鹅？', '2019-04-26 11:12:16.216', 1, '1101', TRUE, TRUE );

INSERT INTO t_trace_student ( trace_id, student_id )
VALUES
    ( 1, 5 ),
    ( 1, 6 );

-- INSERT INTO g_grade_record (trace_id, grade_table_id, class_id, student_id, grade_class_id, grade_level_id, semester_id, hold_time, point)
-- VALUES
--     ();


SET FOREIGN_KEY_CHECKS = 1;