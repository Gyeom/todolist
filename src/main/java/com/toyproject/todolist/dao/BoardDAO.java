package com.toyproject.todolist.dao;

import java.util.List;

import com.toyproject.todolist.dto.BoardDTO;

public interface BoardDAO {
	  public List<BoardDTO> selectBoard() throws Exception;
}
