package com.kh.joba.user.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectChatList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("chatMapper.selectChatList", null, rows);
	}

	@Override
	public int selectChatTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.selectChatTotalContents");
	}

}
