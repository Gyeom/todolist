package com.toyproject.todolist.service;


import com.toyproject.todolist.dto.UserDTO;


public interface UserService {
    public boolean selectUser(UserDTO userDTO) throws Exception;
    public boolean insertUser(UserDTO userDTO) throws Exception;
}
