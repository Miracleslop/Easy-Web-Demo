begin;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE s_school;
truncate TABLE m_teacher;
TRUNCATE TABLE m_student;
TRUNCATE TABLE s_class_student;
TRUNCATE TABLE m_member;
TRUNCATE TABLE s_class_teacher;
TRUNCATE TABLE m_parent_student;
TRUNCATE TABLE t_trace_type;
TRUNCATE TABLE s_semester;
TRUNCATE TABLE s_class;
TRUNCATE TABLE s_section;
TRUNCATE TABLE s_section_table;
TRUNCATE TABLE g_grade_class;
TRUNCATE TABLE g_grade_level;
TRUNCATE TABLE g_grade_class_colour;
TRUNCATE TABLE g_grade_frame;
TRUNCATE TABLE g_grade_table;
TRUNCATE TABLE g_grade_table_class;
commit ;