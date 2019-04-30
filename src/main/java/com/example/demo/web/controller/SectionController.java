package com.example.demo.web.controller;


import com.example.demo.service.entity.Section;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.api.ISectionService;

import java.util.List;

/**
* <p>
* 年级表 前端控制器
* </p>
*
* @author slop
* @since 2019-04-30
*/
@RestController
@RequestMapping("/section")
public class SectionController extends BaseController {

    @Autowired
    private ISectionService sectionService;


    @RequestMapping("/")
    public String hello(){
        List<Section> list = sectionService.list();
        return list.get(0).toString();
    }

}
