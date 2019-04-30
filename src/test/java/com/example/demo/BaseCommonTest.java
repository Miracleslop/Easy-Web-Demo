package com.example.demo;

import org.junit.FixMethodOrder;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
//  执行方法按照名称的顺序
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//  以dev环境允许测试用例
@ActiveProfiles("dev")
//  在每次方法执行之前执行sql脚本
@Sql(scripts = {"classpath:db/happy_growth_delete.sql", "classpath:db/happy_growth_data.sql"}, executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
public class BaseCommonTest {

}
