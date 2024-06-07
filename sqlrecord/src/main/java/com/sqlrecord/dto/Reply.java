package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private String id;
	private int rno; //댓글 번호
	private int pno;
	private String title;
	private String content;
	private String resdate;
	private float star;
	
}
