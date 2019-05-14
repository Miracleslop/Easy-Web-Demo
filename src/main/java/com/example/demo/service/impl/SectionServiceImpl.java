package com.example.demo.service.impl;

import com.example.demo.service.entity.Section;
import com.example.demo.service.mapper.SectionMapper;
import com.example.demo.api.ISectionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
* <p>
* 年级表 服务实现类
* </p>
*
* @author slop
* @since 2019-04-30
*/
@Service
public class SectionServiceImpl extends ServiceImpl<SectionMapper, Section> implements ISectionService {

    @Autowired
    private SectionMapper sectionMapper;


    @Override
    public Integer queryCount(){
        return sectionMapper.queryCount();
    }

}
