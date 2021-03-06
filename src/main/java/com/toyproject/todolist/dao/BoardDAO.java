package com.toyproject.todolist.dao;

import java.util.List;

import com.toyproject.todolist.dto.BoardDTO;

public interface BoardDAO {
	  public List<BoardDTO> selectBoard(String userid) throws Exception;
	  public void insertBoard(BoardDTO boardDTO)  throws Exception;
	  public void deleteBoard(int bno);
	  public void updateBoard(BoardDTO boardDTO);
	public void updatePriority(BoardDTO boardDTO);
}
