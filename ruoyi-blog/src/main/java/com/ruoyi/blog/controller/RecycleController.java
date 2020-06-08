package com.ruoyi.blog.controller;

import com.ruoyi.blog.service.BlogService;
import com.ruoyi.blog.service.CategoryService;
import com.ruoyi.blog.util.PageQueryUtil;
import com.ruoyi.blog.util.Result;
import com.ruoyi.blog.util.ResultGenerator;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * author : Lin
 * 回收站管理
 */
@Controller
@RequestMapping("/blog/admin")
public class RecycleController {

    private String prefix = "blog";

    @Resource
    private BlogService blogService;
    @Resource
    private CategoryService categoryService;

    /**
     * 回收站列表
     */
    @RequiresPermissions("blog:admin:recycle:view")
    @GetMapping("/recycle/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(blogService.getBlogsPageByDeleted(pageUtil));
    }

    /**
     * 请求页
     */
    @RequiresPermissions("blog:admin:recycle:view")
    @GetMapping("/recycle")
    public String list(HttpServletRequest request) {
        return prefix + "/recycle";
    }

    /**
     * 在博客管理页面的删除操作只是把它放到回收站,在回收站删除才是从数据库层删除
     */
    @RequiresPermissions("blog:admin:recycle:remove")
    @PostMapping("/recycle/remove")
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (blogService.deleteBlogById(ids)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("删除失败");
        }
    }

    /**
     * 恢复博客
     */
    @RequiresPermissions("blog:admin:recycle:recovery")
    @PostMapping("/recycle/recovery")
    @ResponseBody
    public Result recovery(@RequestBody Integer[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (blogService.recoveryBatch(ids)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("恢复失败");
        }
    }

}
