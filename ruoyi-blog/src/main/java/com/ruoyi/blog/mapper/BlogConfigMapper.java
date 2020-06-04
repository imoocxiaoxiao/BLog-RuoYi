package com.ruoyi.blog.mapper;


import com.ruoyi.blog.entity.BlogConfig;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface BlogConfigMapper {
    List<BlogConfig> selectAll();

    BlogConfig selectByPrimaryKey(String configName);

    int updateByPrimaryKeySelective(BlogConfig record);

}