package com.toyproject.todolist.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toyproject.todolist.dto.UserDTO;
import com.toyproject.todolist.service.UserService;

@Controller
public class UserController {
	
	@Inject
	UserService userService;
	
	//페이지 이동
	
	@RequestMapping("/join") 
	public String join() {
		return "join"; 
	}
	@RequestMapping(value = "/login") 
	public String login() {
		return "login"; 
	}
	@RequestMapping(value = "/logout") 
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		model.addAttribute("message", "logout");
		return "login"; 
	}
	//동작
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST) 
	public String join(UserDTO userDTO, Model model) {
		boolean success = false;
		try {
			success = userService.insertUser(userDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("message", "duplicate");
			return "join";
		}
		if(!success) {
			model.addAttribute("message", "error");
			return "join";
		}
		return "login"; 
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET) 
	public String login(UserDTO userDTO,Model model, HttpSession session) {
		boolean success = false;
		try {
			success = userService.selectUser(userDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("message", "error");
			return "login";
		}
		if(!success) {
			model.addAttribute("message", "error");
			return "login";
		}
		session.setAttribute("userid", userDTO.getUserid());
		System.out.println("------------------------------------------------");
		return "redirect:/board"; 
	}
}
