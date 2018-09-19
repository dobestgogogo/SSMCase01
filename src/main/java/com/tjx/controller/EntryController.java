package com.tjx.controller;

import com.github.pagehelper.PageInfo;
import com.tjx.pojo.Entry;
import com.tjx.service.EntryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

@Controller
@RequestMapping("/entry")
public class EntryController {
    @Resource
    private EntryService entryService;

    @RequestMapping("/getPage")
    @ResponseBody
    public PageInfo getPage(HttpServletRequest request){
        //获取页码,默认1
        Integer pageNum = Integer.parseInt(request.getParameter("pageNum"));
        //获取排序value
        Integer choose = Integer.parseInt(request.getParameter("choose"));
        //每页记录数
        Integer pageSize = 2;
        //分页
        PageInfo page = entryService.getPage(pageNum, pageSize, choose);
        return page;
    }

    @RequestMapping("/add")
    public String add(String title,String text,String uploaduser,String createdate){
        if (text=="" || text==null && uploaduser=="" || uploaduser==null){
            entryService.add(1,title,null,null,createdate);
        }else if (text=="" || text==null){
            entryService.add(1,title,null,uploaduser,createdate);
        }else if (uploaduser=="" || uploaduser==null){
            entryService.add(1,title,text,null,createdate);
        }else {
            entryService.add(1,title,text,uploaduser,createdate);
        }
        return "/index.jsp";
    }

    @RequestMapping("/update")
    public String update(Integer id,String title,String summary,String uploaduser,String createdate){
        Integer i = 2;
        entryService.update(new Entry(id,i,title,summary,uploaduser,createdate));
        return "/index.jsp";
    }

    @RequestMapping("/del")
    public void del(Integer id, HttpServletResponse response){
        entryService.del(id);
        PrintWriter pw = null;
        try {
            pw = response.getWriter();
            pw.print(true);
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
