package com.example.demo.service.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
* <p>
* 年级表
* </p>
*
* @author slop
* @since 2019-04-30
*/
@TableName("s_section")
public class Section extends Model<Section> {

    private static final long serialVersionUID = 1L;

    /**
    * 主键
    */
    @TableId("section_id")
    private Integer sectionId;

    /**
    * 名称
    */
    @TableField("name")
    private String name;

    /**
    * 英文名
    */
    @TableField("en_name")
    private String enName;

    /**
    * 学校ID
    */
    @TableField("school_id")
    private Integer schoolId;

    /**
    * 是否删除（伪删除）
    */
    @TableField("delete_flag")
    @TableLogic(value = "0", delval = "1")
    private Boolean deleteFlag;

    /**
    * 创建人
    */
    @TableField("creator")
    private Integer creator;

    /**
    * 创建时间
    */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
    * 修改人
    */
    @TableField("modifier")
    private Integer modifier;

    /**
    * 修改时间
    */
    @TableField("modify_time")
    private LocalDateTime modifyTime;

    public Integer getSectionId() {
        return sectionId;
    }

    public Section setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
        return this;
    }
    public String getName() {
        return name;
    }

    public Section setName(String name) {
        this.name = name;
        return this;
    }
    public String getEnName() {
        return enName;
    }

    public Section setEnName(String enName) {
        this.enName = enName;
        return this;
    }
    public Integer getSchoolId() {
        return schoolId;
    }

    public Section setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
        return this;
    }
    public Boolean getDeleteFlag() {
        return deleteFlag;
    }

    public Section setDeleteFlag(Boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
        return this;
    }
    public Integer getCreator() {
        return creator;
    }

    public Section setCreator(Integer creator) {
        this.creator = creator;
        return this;
    }
    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public Section setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
        return this;
    }
    public Integer getModifier() {
        return modifier;
    }

    public Section setModifier(Integer modifier) {
        this.modifier = modifier;
        return this;
    }
    public LocalDateTime getModifyTime() {
        return modifyTime;
    }

    public Section setModifyTime(LocalDateTime modifyTime) {
        this.modifyTime = modifyTime;
        return this;
    }

    public static final String SECTION_ID = "section_id";

    public static final String NAME = "name";

    public static final String EN_NAME = "en_name";

    public static final String SCHOOL_ID = "school_id";

    public static final String DELETE_FLAG = "delete_flag";

    public static final String CREATOR = "creator";

    public static final String CREATE_TIME = "create_time";

    public static final String MODIFIER = "modifier";

    public static final String MODIFY_TIME = "modify_time";

    @Override
    protected Serializable pkVal() {
        return this.sectionId;
    }

    @Override
    public String toString() {
    return "Section{" +
            "sectionId=" + sectionId +
            ", name=" + name +
            ", enName=" + enName +
            ", schoolId=" + schoolId +
            ", deleteFlag=" + deleteFlag +
            ", creator=" + creator +
            ", createTime=" + createTime +
            ", modifier=" + modifier +
            ", modifyTime=" + modifyTime +
    "}";
    }
}