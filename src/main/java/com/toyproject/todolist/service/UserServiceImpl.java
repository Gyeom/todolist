package com.toyproject.todolist.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.toyproject.todolist.dao.UserDAO;
import com.toyproject.todolist.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO userDao;

	@Override
	public boolean selectUser(UserDTO userDTO) throws Exception {
		// TODO Auto-generated method stub
		return userDao.selectUser(userDTO);
	}

	@Override
	public boolean insertUser(UserDTO userDTO) throws Exception {
		// TODO Auto-generated method stub
		return userDao.insertUser(userDTO);
	}

}
