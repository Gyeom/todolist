package com.toyproject.todolist.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.toyproject.todolist.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.toyproject.todolist.mapper.boardMapper";

	@Override
	public List<BoardDTO> selectBoard() throws Exception {

		return sqlSession.selectList(Namespace+".selectBoard");
	}
	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace+".insertBoard", boardDTO);
	}
}
