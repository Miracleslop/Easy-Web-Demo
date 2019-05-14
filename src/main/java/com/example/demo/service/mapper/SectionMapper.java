package com.example.demo.service.mapper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.demo.service.entity.Section;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 年级表 Mapper 接口
 * </p>
 *
 * @author slop
 * @since 2019-04-30
 */
public interface SectionMapper extends BaseMapper<Section> {

    @Select("SELECT COUNT(1) FROM s_section")
    Integer queryCount();

}
