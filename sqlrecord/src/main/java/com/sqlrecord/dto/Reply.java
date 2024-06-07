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
	private int pno; //상품 번호
	private int nno; //대댓글 번호
	private int depth; //댓글의 깊이 부모 0 자식 1
	private String content;
	private String resdate;
	private float star;
	
}
