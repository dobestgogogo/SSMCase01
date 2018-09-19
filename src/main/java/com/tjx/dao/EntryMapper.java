package com.tjx.dao;

import com.tjx.pojo.Entry;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EntryMapper {

    Long getCount();

    List<Entry> getPage(@Param("choose") Integer choose);

    void add(@Param("categoryId")Integer categoryId,@Param("title")String title,@Param("summary")String summary,@Param("uploaduser")String uploaduser,@Param("createdate")String createdate);

    void update(Entry entry);

    void del(Integer id);
}
