package kr.co.acomp.hello.dao;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.acomp.hello.dao.vo.Article;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/"
		+ "spring/datasource.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ArticleDAOTest {

	@Autowired
	private ArticleDAO dao;
	
	
	@Test
	@Ignore
	public void testInsertArticle() {
		Article article =new Article(2,"lee","test","테스트입니다");
		dao.insertArticle(article);
		
	}
	@Test
	public void testselectArticleById() {
	
		Article article=dao.selectArticleById("2");
		System.out.println(article);
		Assert.assertTrue(article.getAuthor().equals("lee"));
		
		//System.out.println(article.getAuthor());		
	}

}

