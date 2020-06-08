package com.ruoyi.blog.controller;

import com.ruoyi.blog.service.CategoryService;
import com.ruoyi.blog.util.PageQueryUtil;
import com.ruoyi.blog.util.Result;
import com.ruoyi.blog.util.ResultGenerator;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 分类管理
 * @author Lin
 */
@Controller
@RequestMapping("/blog/admin")
public class CategoryController {

    private String prefix = "blog";

    @Resource
    private CategoryService categoryService;

    /**
     * 分类页
     */
    @RequiresPermissions("blog:admin:categories:view")
    @GetMapping(value = "/categories")
    public String categoryPage(HttpServletRequest request) {
        request.setAttribute("path", "categories");
        return prefix + "/category";
    }

    /**
     * 分类列表
     */
    @RequiresPermissions("blog:admin:categories:view")
    @RequestMapping(value = "/categories/list", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(categoryService.getBlogCategoryPage(pageUtil));
    }

    /**
     * 分类添加
     */
    @RequiresPermissions("blog:admin:categories:add")
    @RequestMapping(value = "/categories/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestParam("categoryName") String categoryName,
                       @RequestParam("categoryIcon") String categoryIcon) {
        if (StringUtils.isEmpty(categoryName) || StringUtils.isEmpty(categoryIcon)) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (categoryService.saveCategory(categoryName, categoryIcon)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("分类名称重复");
        }
    }

    /**
     * 分类修改
     */
    @RequiresPermissions("blog:admin:categories:edit")
    @RequestMapping(value = "/categories/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestParam("categoryId") Integer categoryId,
                         @RequestParam("categoryName") String categoryName,
                         @RequestParam("categoryIcon") String categoryIcon) {
        if (StringUtils.isEmpty(categoryName) || StringUtils.isEmpty(categoryIcon)) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (categoryService.updateCategory(categoryId, categoryName, categoryIcon)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("分类名称重复");
        }
    }

    /**
     * 分类删除
     */
    @RequiresPermissions("blog:admin:categories:remove")
    @RequestMapping(value = "/categories/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (categoryService.deleteBatch(ids)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("删除失败");
        }
    }

}
