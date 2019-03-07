package kr.co.acomp.hello;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.co.acomp.hello.dao.vo.Article;
import kr.co.acomp.hello.service.BbsService;
import kr.co.acomp.hello.service.HelloService;

public class HelloMain {

	public static void main(String[] args) {
	/*	// TODO Auto-generated method stub
		HelloDAO dao=new HelloDAO();
		int result= dao.addTwoNumber(3, 5);
		*/
		AbstractApplicationContext ctx=
				new ClassPathXmlApplicationContext("/spring-context.xml");//bean을 생성
		BbsService service=ctx.getBean("bbsService",BbsService.class);//getBean은 dependency LockUP
		service.registArticle(new Article());
		//System.out.println(result);
	}

}
