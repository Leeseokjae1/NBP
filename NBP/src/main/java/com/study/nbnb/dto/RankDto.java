package com.study.nbnb.dto;

import jakarta.annotation.Nullable;

public class RankDto {
   private int b1Number;
    private String writer;
    private String title;
    private int score;
    
    @Nullable
   private String imageurl1;
   @Nullable
   private String imageurl2;
   @Nullable
   private String imageurl3;
   
   private int rank;

   public int getB1Number() {
      return b1Number;
   }

   public void setB1Number(int b1Number) {
      this.b1Number = b1Number;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public int getScore() {
      return score;
   }

   public void setScore(int score) {
      this.score = score;
   }

   public String getImageurl1() {
      return imageurl1;
   }

   public void setImageurl1(String imageurl1) {
      this.imageurl1 = imageurl1;
   }

   public String getImageurl2() {
      return imageurl2;
   }

   public void setImageurl2(String imageurl2) {
      this.imageurl2 = imageurl2;
   }

   public String getImageurl3() {
      return imageurl3;
   }

   public void setImageurl3(String imageurl3) {
      this.imageurl3 = imageurl3;
   }

   public int getRank() {
      return rank;
   }

   public void setRank(int rank) {
      this.rank = rank;
   }

}