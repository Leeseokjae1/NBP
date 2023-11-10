package com.study.nbnb.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class SearchResultDto
{
	private int id;
    private String title;
    private String Writer;
    private Date resultDate;
	private String boardName;
    private String titleColumn;
	
    
	public SearchResultDto(int id, String title, String writer, Date resultDate, String boardName, String titleColumn)
	{
		super();
		this.id = id;
		this.title = title;
		Writer = writer;
		this.resultDate = resultDate;
		this.boardName = boardName;
		this.titleColumn = titleColumn;
	}


	public int getId()
	{
		return id;
	}


	public void setId(int id)
	{
		this.id = id;
	}


	public String getTitle()
	{
		return title;
	}


	public void setTitle(String title)
	{
		this.title = title;
	}


	public String getWriter()
	{
		return Writer;
	}


	public void setWriter(String writer)
	{
		Writer = writer;
	}


	public Date getResultDate()
	{
		return resultDate;
	}


	public void setResultDate(Date resultDate)
	{
		this.resultDate = resultDate;
	}


	public String getBoardName()
	{
		return boardName;
	}


	public void setBoardName(String boardName)
	{
		this.boardName = boardName;
	}


	public String getTitleColumn()
	{
		return titleColumn;
	}


	public void setTitleColumn(String titleColumn)
	{
		this.titleColumn = titleColumn;
	}

}