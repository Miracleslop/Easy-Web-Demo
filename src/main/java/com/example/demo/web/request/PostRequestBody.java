package com.example.demo.web.request;

import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

public class PostRequestBody {

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "日期")
    private Date date;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
