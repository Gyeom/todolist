package com.toyproject.todolist.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.toyproject.todolist.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession sqlSession;
	private static final String Namespace = "com.toyproject.todolist.mapper.userMapper";
	
	@Override
	public boolean selectUser(UserDTO userDTO) throws Exception {
		// TODO Auto-generated method stub
		String name = sqlSession.selectOne(Namespace+".selectUser",userDTO);	
		return (name==null) ? false : true;
	}

	@Override
	public boolean insertUser(UserDTO userDTO) throws Exception {
		// TODO Auto-generated method stub
		int success =0;
		success = sqlSession.insert(Namespace+".insertUser", userDTO);
		return (success==0) ? false : true; 
	}

}
