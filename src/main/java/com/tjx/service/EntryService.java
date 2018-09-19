package com.tjx.service;

import com.github.pagehelper.PageInfo;
import com.tjx.pojo.Entry;
import org.apache.ibatis.annotations.Param;

public interface EntryService {

    Long getCount();

    PageInfo getPage(Integer pageNum, Integer pagesize,Integer chooses);

    void add(Integer categoryId,String title,String summary, String uploaduser,String createdate);

    void update(Entry entry);

    void del(Integer id);
}
