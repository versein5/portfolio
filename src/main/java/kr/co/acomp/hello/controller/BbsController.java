package kr.co.acomp.hello.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.acomp.hello.dao.vo.Article;
import kr.co.acomp.hello.service.BbsService;

@Controller
@RequestMapping("/bbs")
public class BbsController {

	@Autowired
	private BbsService bbsService;

	@GetMapping("")
	public String index() {
		//		bbsService.registArticle(new Article(5,"kim","test","test"));//오류테스트용
		return "index";
	}
	@GetMapping("/{articleId}")
	@ResponseBody
	public Article viewDetail(@PathVariable String articleId) {
		Article article = this.bbsService.viewArticleDetail(articleId);
		return article;
	}
	@PostMapping("/write")
	@ResponseBody
	public Article write(@RequestBody Article article) {
//		Article a=article;
//		return a;
		bbsService.registArticle(article);
		return article;

	}

	//	  @GetMapping("/{articleId}") public String viewDetail(@PathVariable String
	//	  articleId) { System.out.println("글번호는 :"+ articleId); return "write_ok"; }
	//	 
	//	@PostMapping("/write")
	//	public ModelAndView dowrite(Article article) {
	//		bbsService.registArticle(article);
	//		System.out.println("post request");
	//		return new ModelAndView("write_ok").addObject("article", article);
	//	}
	//
	//	@GetMapping("/write")
	//	public String write() {
	//		bbsService.registArticle(new Article());
	//		System.out.println("get request");
	//		return "write_ok";
	//	}
}
