package com.toyproject.todolist.service;

import java.util.List;

import com.toyproject.todolist.dto.BoardDTO;

public interface BoardService {
    
    public List<BoardDTO> selectBoard() throws Exception;
    public void insertBoard(BoardDTO boardDTO) throws Exception;
}


