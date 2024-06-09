package com.sqlrecord.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sqlrecord.dto.Reply;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Reply> getReplyList() {
		return sqlSession.selectList("reply.getReplyList");
	}

	@Override
	public Reply getReply(int rno) {
		return sqlSession.selectOne("reply.getReply",rno);
	}

	@Override
	public int replyCount() {
		return sqlSession.selectOne("reply.replyCount");
	}

	@Override
	public void insReply(Reply reply) {
		sqlSession.insert("reply.insReply", reply);
	}

	@Override
	public void changeReply(Reply reply) {
		sqlSession.update("reply.changeReply", reply);
	}

	@Override
	public void delReply(int rno) {
		sqlSession.delete("Reply.delReply", rno);
	}

	@Override
	public List<Map<String, Object>> getReplyStarAll() {
		return sqlSession.selectList("reply.getReplyStarAll");
	}

}