package kr.co.acomp.hello.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.acomp.hello.dao.vo.user;
import kr.co.acomp.hello.service.UserService;

@Controller
@RequestMapping(value= "/")
public class userController {

//	@Autowired private CalcService calcService;
	@Autowired private UserService userService;
	
	@GetMapping("{pageName}") //@GetMapping : @RequestMapping(method = RequestMethod.GET) 의 축약형으로써
	public String getSinglePage(@PathVariable("pageName")String pageName) {
		if(!pageName.equals("resistration"))
			return pageName;
		else
			return PostSinglePage(pageName);
		
	}
	@PostMapping("{pageName}")  
	public String PostSinglePage(@PathVariable("pageName")String pageName) {		
		return pageName;
	}
	@RequestMapping
	String test() {
		return "join";
	}

	@RequestMapping("join")
	@ResponseBody
	public user login(user user,HttpSession session) {	
		if(userService.login(user)>=1) {
			user.setLoginFlag(1);
			session.setAttribute("id",user.getId());
			session.setAttribute("pw",user.getPw());
		}else {
			user.setLoginFlag(0);
		}
		
		return user;
		
	}
	
}
