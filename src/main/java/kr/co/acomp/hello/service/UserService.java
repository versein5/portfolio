package kr.co.acomp.hello.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.acomp.hello.dao.UserDAO;
import kr.co.acomp.hello.dao.vo.Article;
import kr.co.acomp.hello.dao.vo.user;

@Service
public class UserService {
	
		@Autowired
		private UserDAO userDAO;
		
		public Integer login(user user) {
			user.setId(user.getId());
			user.setPw(user.getPw());
			int result=userDAO.login(user);
			
			return result;
		}
	}

