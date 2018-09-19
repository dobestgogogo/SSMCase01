package com.tjx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tjx.dao.EntryMapper;
import com.tjx.pojo.Entry;
import com.tjx.service.EntryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class EntryServiceImpl implements EntryService {

    @Resource
    private EntryMapper entryMapper;

    @Override
    public Long getCount() {
        Long count = entryMapper.getCount();
        return count;
    }

    @Override
    public PageInfo getPage(Integer pageNum, Integer pageSize,Integer choose) {
        PageHelper.startPage(pageNum,pageSize);
        List<Entry> page = entryMapper.getPage(choose);
        PageInfo pageInfo = new PageInfo(page);
        return pageInfo;
    }

    @Override
    public void add(Integer categoryId,String title,String summary, String uploaduser,String createdate) {
        entryMapper.add(categoryId,title,summary,uploaduser,createdate);
    }

    @Override
    public void update(Entry entry) {
        entryMapper.update(entry);
    }

    @Override
    public void del(Integer id) {
        entryMapper.del(id);
    }
}
