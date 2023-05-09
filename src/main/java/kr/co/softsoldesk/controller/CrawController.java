package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ma")
public class CrawController {
    
	@GetMapping("/books/{category}")
	public ModelAndView getAladinBooks(@PathVariable("category") String categoryId) throws Exception {
	    String url = "https://www.aladin.co.kr/shop/common/wbest.aspx?BestType=Bestseller&BranchType=1&CID=" + categoryId;
	    
	    Document doc = Jsoup.connect(url).get();
	    Elements topBooks = doc.select("div.ss_book_box");

	    List<Map<String, String>> books = new ArrayList<>();

	    for (int i = 0; i < 3; i++) {
	        Element bookElement = topBooks.get(i);
	        String title = bookElement.select("div.ss_book_list > ul > li > a.bo3").text();
	        String imgUrl = bookElement.select("div.flipcover_in > img.front_cover").attr("src");


	        Map<String, String> book = new HashMap<>();
	        book.put("title", title);
	        book.put("imgUrl", imgUrl);

	        books.add(book);
	    }

	    ModelAndView modelAndView = new ModelAndView("books");
	    modelAndView.addObject("books", books);
	    return modelAndView;
	}



}