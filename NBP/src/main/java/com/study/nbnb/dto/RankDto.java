package com.study.nbnb.dto;

import jakarta.annotation.Nullable;

public class RankDto {
   private int bNumber;
    private String writer;
    private String title;
    private int score;
    private int userScore;
    private int totalScore;
    
    @Nullable
   private String imageurl1;
   @Nullable
   private String imageurl2;
   @Nullable
   private String imageurl3;
   @Nullable
   private String imageurl;
   
   private int rank;

   public int getbNumber() {
      return bNumber;
   }
   
   public void setbNumber(int bNumber) {
      this.bNumber = bNumber;
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
   
   public int getUserScore() {
      return userScore;
   }
   
   public void setUserScore(int userScore) {
      this.userScore = userScore;
   }
   
   public int getTotalScore() {
      return totalScore;
   }
   
   public void setTotalScore(int totalScore) {
      this.totalScore = totalScore;
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
   
   public String getImageurl() {
      return imageurl;
   }
   
   public void setImageurl(String imageurl) {
      this.imageurl = imageurl;
   }
   
   public int getRank() {
      return rank;
   }
   
   public void setRank(int rank) {
      this.rank = rank;
   }
}