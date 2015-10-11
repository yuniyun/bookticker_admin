package org.admin.board.web;

import java.util.Map;

import javax.inject.Inject;

import org.admin.board.model.BoardVO;
import org.admin.board.model.BoardCriteria;
import org.admin.board.model.PageMaker;
import org.admin.board.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/board/*")
public class BoardController {

	@Inject
	private BoardService bs;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, BoardCriteria cri) throws Exception {
		model.addAttribute("boardList", bs.boardList(cri));
		PageMaker pm = new PageMaker(cri, bs.boardTotalCnt(cri));
		model.addAttribute("pageMaker", pm);
		
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(Model model, Integer boardNo) throws Exception {
		model.addAttribute("boardRead", bs.boardRead(boardNo));
	}

	@RequestMapping(value = "/boardReportList", method = RequestMethod.GET)
	public void boardReportList(Model model, Integer boardNo) throws Exception {
		model.addAttribute("reportList", bs.boardReportList(boardNo));
	}
	
	@RequestMapping(value = "/boardReportRead", method = RequestMethod.GET)
	public void boardReportRead(Model model, Integer reportNo) throws Exception {
		model.addAttribute("reportRead", bs.boardReportRead(reportNo));
	}
	// @RequestMapping(value ="/write",method = RequestMethod.POST)
	// public String create(Model model, BoardVO bvo) throws Exception{
	// bs.create(bvo);
	// return "/board/success"; 
	// }
}
