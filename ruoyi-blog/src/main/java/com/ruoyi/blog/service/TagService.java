package com.ruoyi.blog.service;

import com.ruoyi.blog.entity.BlogTagCount;
import com.ruoyi.blog.util.PageQueryUtil;
import com.ruoyi.blog.util.PageResult;

import java.util.List;

public interface TagService {

    /**
     * 查询标签的分页数据
     *
     * @param pageUtil
     * @return
     */
    PageResult getBlogTagPage(PageQueryUtil pageUtil);

    int getTotalTags();

    Boolean saveTag(String tagName);

    Boolean deleteBatch(Integer[] ids);

    List<BlogTagCount> getBlogTagCountForIndex();
}
