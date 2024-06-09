package com.sqlrecord.dao;

import java.util.List;
import java.util.Map;

import com.sqlrecord.dto.Reply;


public interface ReplyDAO {
	public List<Reply> getReplyList();
	public Reply getReply(int rno );
	public int replyCount();
	public void insReply(Reply reply);
	public void changeReply(Reply reply);
	public void delReply(int rno);
	public List<Map<String, Object>> getReplyStarAll();
}