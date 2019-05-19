package com.toyproject.todolist.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.toyproject.todolist.dto.BoardDTO;
import com.toyproject.todolist.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	@Inject
	private BoardService boardService;

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		List<BoardDTO> boardList = null;
		try {
			boardList = boardService.selectBoard();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("boardList", boardList);

		return "home";
	}

	
	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String insertBoard(@RequestParam String content,@RequestParam String title, @RequestParam String duedate, HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 
		userid="kim";
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setTitle(title);
		boardDTO.setContent(content);
		try {
			boardDTO.setDuedate(new SimpleDateFormat("yyyy-MM-dd").parse(duedate));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		boardDTO.setUserid(userid);
		try {
			boardService.insertBoard(boardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/board";
	}
}
