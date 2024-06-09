package com.sqlrecord.service;

import java.util.List;
import java.util.Map;

import com.sqlrecord.dto.Reply;

public interface ReplyService {
	public List<Reply> getReplyList();
	public Reply getReply(int rno );
	public int replyCount();
	public void insReply(Reply reply);
	public void changeReply(Reply reply);
	public void delReply(int rno);
	public List<Map<String, Object>> getReplyStarAll();
	public float avgStar();
}
