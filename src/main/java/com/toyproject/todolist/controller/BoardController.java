package com.toyproject.todolist.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String home(Locale locale, Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 
		if(userid==null) {
			model.addAttribute("message","nologin");
			return "redirect:/login";
		}
		System.out.println(userid+"---------------------------------------------");
		List<BoardDTO> boardList = null;
		try {
			boardList = boardService.selectBoard(userid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("boardList", boardList);

		return "board";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/board", method = RequestMethod.DELETE)
	public Map<String,Object> deleteBoard(@RequestParam String bno) {
		try {
			boardService.deleteBoard(Integer.parseInt(bno));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "success");
		return map;
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String insertBoard(@RequestParam String content,@RequestParam String title, @RequestParam String duedate, HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 

		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setTitle(title);
		boardDTO.setContent(content);
		boardDTO.setUserid(userid);
		try {
			boardDTO.setDuedate(new SimpleDateFormat("yyyy-MM-dd").parse(duedate));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			boardService.insertBoard(boardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/board", method = RequestMethod.PUT)
	public Map<String,Object> updateBoard(@RequestParam String title, @RequestParam String content, @RequestParam String no, HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 
		userid="kim";
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNo(Integer.parseInt(no));
		boardDTO.setTitle(title);
		boardDTO.setContent(content);
		boardDTO.setUserid(userid);
		try {
			boardService.updateBoard(boardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "success");
		System.out.println("fFF");
		return map;
	}
}
