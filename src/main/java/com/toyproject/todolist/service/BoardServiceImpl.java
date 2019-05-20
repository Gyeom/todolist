package com.toyproject.todolist.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.toyproject.todolist.dao.BoardDAO;
import com.toyproject.todolist.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO boardDao;


	@Override
	public List<BoardDTO> selectBoard(String userid) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoard(userid);
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		boardDao.insertBoard(boardDTO);
	}

	@Override
	public void deleteBoard(int bno) {
		// TODO Auto-generated method stub
		boardDao.deleteBoard(bno);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		boardDao.updateBoard(boardDTO);
	}
}
