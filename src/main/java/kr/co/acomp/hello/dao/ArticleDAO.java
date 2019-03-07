package kr.co.acomp.hello.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.acomp.hello.dao.vo.Article;

@Repository
public class ArticleDAO {

	@Autowired
	SqlSession sqlSession;
	
	public void insertArticle(Article article) {
//		System.out.println(article);
		sqlSession.insert
		("mappers.article-mapper.insertArticle",article);
	}

	public Article selectArticleById(String articleId) {
		
//		Article article =new Article(10,"lee","test","테스트입니다");
//		return article;
		return sqlSession.selectOne
				("mappers.article-mapper.selectArticleById",articleId);
	}
}
