package com.example.demo;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.IColumnType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AutoGeneratorMain {

    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
    public static String scanner(String tip) {
        Scanner scanner = new Scanner(System.in);
        StringBuilder help = new StringBuilder();
        help.append("请输入" + tip + "：");
        System.out.println(help.toString());
        if (scanner.hasNext()) {
            String ipt = scanner.next();
            if (StringUtils.isNotEmpty(ipt)) {
                return ipt;
            }
        }
        throw new MybatisPlusException("请输入正确的" + tip + "！");
    }

    public static void main(String[] args) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        String projectPath = System.getProperty("user.dir");
        // 全局配置
        mpg.setGlobalConfig(new GlobalConfig()
                .setOutputDir(projectPath + "/crm-service-impl/src/main/java")
                .setAuthor("auto")

                //  注意日期 不然会报错
                .setDateType(DateType.ONLY_DATE)
                .setOpen(false)

                // 是否覆盖同名文件，默认是false
                .setFileOverride(true)

                // ActiveRecord特性: new User().set("name", "James").set("age", 25).save();
                .setActiveRecord(false)

                // 实体属性 Swagger2 注解
                .setSwagger2(true)
                // XML 二级缓存
                .setEnableCache(false)
                // XML ResultMap
                .setBaseResultMap(true)
                // XML columList
                .setBaseColumnList(false)

                // 自定义文件命名，注意 %s 会自动填充表实体属性
                .setMapperName("%sDao")
                .setXmlName("%sDao")
                .setServiceName("MP%sService")
                .setServiceImplName("%sServiceDiy")
                .setControllerName("%sAction")
        );

        mpg.setDataSource(new DataSourceConfig()
                .setSchemaName("public")
                .setDbType(DbType.MYSQL)
                .setUrl("jdbc:mysql://203.110.166.228:3307/crm_sprint_3.0.0?zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2b8&characterEncoding=utf-8&useSSL=false")
                .setDriverName("com.mysql.jdbc.Driver")
                .setUsername("crm_dev")
                .setPassword("111111")
                .setTypeConvert(new MySqlTypeConvert() {
                    @Override
                    public IColumnType processTypeConvert(GlobalConfig globalConfig, String fieldType) {
                        return super.processTypeConvert(globalConfig, fieldType);
                    }
                })
        );

        mpg.setPackageInfo(new PackageConfig()
//                .setModuleName("s")
                        .setParent("com.dipont.crm.service")
                        .setEntity("entity")
                        .setMapper("mapper")
                        .setService("face")
                        .setServiceImpl("face.impl")
        );


//        // 自定义配置
//        InjectionConfig cfg = new InjectionConfig() {
//            @Override
//            public void initMap() {
//                // to do nothing
//            }
//        };
//
//        // 如果模板引擎是 freemarker
//        String templatePath = "/templates/mapper.xml.ftl";
//        // 如果模板引擎是 velocity
//        // String templatePath = "/templates/mapper.xml.vm";
//
//        // 自定义输出配置
//        List<FileOutConfig> focList = new ArrayList<>();
//        // 自定义配置会被优先输出
//        focList.add(new FileOutConfig(templatePath) {
//            @Override
//            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//                return projectPath + "/src/main/resources/mapper/" + pc.getModuleName()
//                        + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
//            }
//        });
//        /*
//        cfg.setFileCreate(new IFileCreate() {
//            @Override
//            public boolean isCreate(ConfigBuilder configBuilder, FileType fileType, String filePath) {
//                // 判断自定义文件夹是否需要创建
//                checkDir("调用默认方法创建的目录");
//                return false;
//            }
//        });
//        */
//        cfg.setFileOutConfigList(focList);
//        mpg.setCfg(cfg);

        // 配置模板
        // 配置自定义输出模板
        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
        TemplateConfig tc = new TemplateConfig()
                .setEntity("templates/entity.java")
                .setController("templates/controller.java")
                .setServiceImpl("templates/serviceImpl.java")
                .setXml(null);
        mpg.setTemplate(tc);

        // 策略配置
        mpg.setStrategy(new StrategyConfig()
//        strategy.setInclude(scanner("表名，多个英文逗号分割").split(","))
                        // strategy.setCapitalMode(true)// 全局大写命名 ORACLE 注意
                        .setInclude("s_section")


                        .setNaming(NamingStrategy.underline_to_camel)
                        .setColumnNaming(NamingStrategy.underline_to_camel)
//        strategy.setEntityLombokModel(true)

                        .setRestControllerStyle(true)
//        strategy.setSuperEntityClass("com.example.demo.service.entity.BaseEntity")
                        .setSuperControllerClass("com.example.demo.web.controller.BaseController")

                        .setEntityTableFieldAnnotationEnable(true)
                        .setLogicDeleteFieldName("delete_flag")
                        .setEntityBooleanColumnRemoveIsPrefix(true)

                        .setSuperEntityColumns("id")
                        .setControllerMappingHyphenStyle(true)
                        .setTablePrefix("s_", "g_")  // 此处可以修改为您的表前缀

                        // 【实体】是否生成字段常量（默认 false）
                        .setEntityColumnConstant(true)
                        // 【实体】是否为构建者模型（默认 false）
                        .setEntityBuilderModel(true)
        );


        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        mpg.execute();
    }
}
