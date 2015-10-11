package org.common.web;

import javax.inject.Inject;

import org.admin.board.model.BoardCriteria;
import org.admin.board.service.BoardService;
import org.admin.book.model.BookCriteria;
import org.admin.book.service.AdminBookService;
import org.admin.user.service.AdminMemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private AdminBookService as;
	
	@Inject
	private BoardService bs;
	
	@Inject
	private AdminMemberService ms;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void home(Model model) throws Exception {
		BookCriteria bookCri = new BookCriteria(1, 5);
		bookCri.setChargeType("작가");
		model.addAttribute("noFreeList", as.listSearchBook(bookCri));
		
		bookCri.setChargeType("일반");
		model.addAttribute("freeList", as.listSearchBook(bookCri));
		
		BoardCriteria boardCri = new BoardCriteria();
		boardCri.setBoardType("작가");
		model.addAttribute("boardAList", bs.boardList(boardCri));
		
		boardCri.setBoardType("일반");
		model.addAttribute("boardUList", bs.boardList(boardCri));
		
	}

	@RequestMapping(value = "/statistics", method = RequestMethod.GET)
	public void statistics(Model model) throws Exception {
		BookCriteria bookCri = new BookCriteria(1, 5);
		bookCri.setSortType("판매량");
		
		bookCri.setChargeType("작가");
		model.addAttribute("noFreeBestList", as.listSearchBook(bookCri));
		
		bookCri.setChargeType("일반");
		model.addAttribute("freeBestList", as.listSearchBook(bookCri));
		
		int femalePercent = ms.percentGender();
		model.addAttribute("femalePercent", femalePercent);
		model.addAttribute("malePercent", (100-femalePercent));
		
		int authorPercent = ms.percentGrade();
		model.addAttribute("authorPercent", authorPercent);
		model.addAttribute("generalPercent", (100-authorPercent));
		
		/*model.addAttribute("ageList", ms.ageFigure());*/
	}
}
