package com.ruoyi.blog.controller;


import com.ruoyi.blog.service.BlogService;
import com.ruoyi.blog.service.CategoryService;
import com.ruoyi.blog.service.CommentService;
import com.ruoyi.blog.service.LinkService;
import com.ruoyi.blog.service.TagService;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.enums.DataSourceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 *
 */
@Controller
@RequestMapping("/blog/admin")
public class AdminController extends BaseController {


    private String prefix = "blog/admin";

    @Autowired
    private BlogService blogService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private LinkService linkService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CommentService commentService;


    @GetMapping("/dash")
    @DataSource(value = DataSourceType.SLAVE)
    public String index(HttpServletRequest request) {

        request.setAttribute("path", "index");
        request.setAttribute("categoryCount", categoryService.getTotalCategories());
        request.setAttribute("blogCount", blogService.getTotalBlogs());
        request.setAttribute("linkCount", linkService.getTotalLinks());
        request.setAttribute("tagCount", tagService.getTotalTags());
        request.setAttribute("commentCount", commentService.getTotalComments());
        request.setAttribute("path", "index");

        return prefix + "/index";
    }

}
