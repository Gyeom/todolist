package com.toyproject.todolist.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toyproject.todolist.dto.BoardDTO;
import com.toyproject.todolist.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	 @Inject
	    private BoardService service;


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		 List<BoardDTO> boardList = null;
		try {
			boardList = service.selectBoard();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  model.addAttribute("boardList", boardList);

		return "home";
	}
	
}
