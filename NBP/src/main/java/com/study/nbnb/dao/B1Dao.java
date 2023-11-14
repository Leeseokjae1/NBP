package com.study.nbnb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.study.nbnb.dto.B1Dto;

@Mapper
public interface B1Dao {
   public List<B1Dto> listDao();
   public B1Dto viewDao(int b1_number);
   public int writeDao(String writer, String title, String content,
         String imageurl1, String imageurl2, String imageurl3);   
   
   public void modifyDao(Map<String, String> parameters);
   
   public B1Dto modifymoveDao(@Param("b1_number") String b1_number);
   public int deleteDao(String b1_number);
   
   public int likelyDao(int b1_number);
   public int likeDropDao(int b1_number);
   public int dislikelyDao(int b1_number);
   public int dislikeDropDao(int b1_number);
   
   public List<B1Dto> listCountDao();
   public List<B1Dto> pageDao(int page, int pageSize);   
   public int selectDao();
   
   public List<B1Dto> titleCountDao(@Param("keyword") String keyword);
   
   public List<B1Dto> titlesearchDao(@Param("title") String keyword,
                             @Param("page") int page,@Param("pagesize") int pageSize);
   
   public List<B1Dto> writerCountDao(@Param("keyword") String keyword);
   
   public List<B1Dto> writersearchDao(@Param("writer") String keyword,
                             @Param("page") int page,@Param("pagesize") int pageSize);
   
   public List<B1Dto> contentCountDao(@Param("keyword") String keyword);
   
   public List<B1Dto> contentsearchDao(@Param("content") String keyword,
                             @Param("page") int page,@Param("pagesize") int pageSize);   
   
   public List<B1Dto> SearchDao(@Param("keyword") String keyword, 
             @Param("start") int start, 
             @Param("pageSize") int pageSize);

   public int searchCountDao(@Param("keyword") String keyword);
   
 
	List<B1Dto> adB1post();
	void addeleteB1(int b1_number);
	B1Dto adB1Detail(int b1_number);
   
}


