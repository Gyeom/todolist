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
	public List<BoardDTO> selectBoard() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoard();
	}
	
	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		boardDao.insertBoard(boardDTO);
	}
}
