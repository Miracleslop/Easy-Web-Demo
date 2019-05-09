package com.example.demo.web.controller;


import com.example.demo.service.entity.Section;
import com.example.demo.web.request.PostRequestBody;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.api.ISectionService;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
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
@Api("demo")
public class DemoController extends BaseController {

    @Autowired
    private ISectionService sectionService;

    @Autowired
    private HttpServletRequest request;


    @RequestMapping(value = "/", method = {RequestMethod.GET})
    public String hello() {
        List<Section> list = sectionService.list();
        return list.get(0).toString();
    }


    @ApiOperation(value = "测试Post")
    @RequestMapping(value = "/demoPost", method = {RequestMethod.POST})
    public String demoPost(@RequestBody PostRequestBody body) throws IOException {
        HttpServletRequest httpServletRequest = request;
        StringBuilder sbf = new StringBuilder();
//        BufferedReader br = httpServletRequest.getReader();
//        String line;
//        while ((line = br.readLine()) != null) {
//            sbf.append(line);
//        }
//        br.close();
        return sbf.toString();
    }

}
