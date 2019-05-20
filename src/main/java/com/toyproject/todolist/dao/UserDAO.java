package com.toyproject.todolist.dao;

import java.util.List;

import com.toyproject.todolist.dto.UserDTO;

public interface UserDAO {
	  public boolean selectUser(UserDTO userDTO) throws Exception;
	  public boolean insertUser(UserDTO userDTO)  throws Exception;
}
