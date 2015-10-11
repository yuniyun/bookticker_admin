package org.admin.book.web;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.admin.book.model.BookAdditionVO;
import org.admin.book.model.BookCriteria;
import org.admin.book.model.PermitInfoVO;
import org.admin.book.service.AdminBookService;
import org.common.model.BookVO;
import org.common.model.CardVO;
import org.common.model.FileVO;
import org.common.model.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin/book")
public class BookController {
	
	@Inject
	private AdminBookService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") BookCriteria cri, Model model) throws Exception {		
		model.addAttribute("list", service.listSearchBook(cri));	
		int totalCnt = service.totalBookCnt(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCnt);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageMaker", pageMaker);
	}
	@RequestMapping(value="/viewinfo", method=RequestMethod.GET)
	public void viewinfo(int bookno, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(int bookno, Model model) throws Exception{
		service.deleteBook(bookno);
		return "/admin/book/success";
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int bookno, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(@ModelAttribute("bvo")BookVO book, Model model) throws Exception{
		service.updateBook(book);
		return "/admin/book/success";
	}
	@RequestMapping(value="/regcode", method=RequestMethod.GET)
	public void regcodeGET(int bookno, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
	}
	
	@RequestMapping(value="/regcode", method=RequestMethod.POST)
	public @ResponseBody void regcodePOST(CardVO card, Model model) throws Exception{
		service.createCard(card);
	}
	
	@RequestMapping(value="/resultcode", method=RequestMethod.GET)
	public void resultcode(int bookno, int amount, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
		model.addAttribute("amount", amount);
	}
	
	@RequestMapping(value="/permitlist", method=RequestMethod.GET)
	public void permitinfo(int bookno, Model model) throws Exception{
		model.addAttribute("title", service.readBook(bookno).getTitle());
		model.addAttribute("perList", service.listPermitInfo(bookno));
	}
	@RequestMapping(value="/convertbook", method=RequestMethod.GET)
	public void convertbookGET(int bookno, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
	}
	@RequestMapping(value="/convertbook", method=RequestMethod.POST)
	public String convertbookPOST(PermitInfoVO permitInfo, Model model) throws Exception{
		service.createPermitInfo(permitInfo);
		return "/admin/book/success";
	}
	@RequestMapping(value="/errconvertbook", method=RequestMethod.GET)
	public void errconvertbookGET(int bookno, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
	}
	@RequestMapping(value="/errconvertbook", method=RequestMethod.POST)
	public String errconvertbookPOST(PermitInfoVO permitInfo, Model model) throws Exception{
		service.createPermitInfo(permitInfo);
		return "/admin/book/success";
	}
	@RequestMapping(value="/convertall", method=RequestMethod.POST)
	public String convertall(Model model) throws Exception{
		service.createPermitInfoAll();
		return "/admin/book/success";
	}
	/*@RequestMapping(value="/downloadpdf", method=RequestMethod.POST)
	public ModelAndView downloadpdf(FileVO file, Model model) throws Exception{
		System.out.println(file.getBookversion());
//		String path = "\\\\UNIORACLE\\3r_card\\"+ file.getFileType() +"\\"+ file.getSeries()
//				+"\\"+ file.getFileName() +"\\"+ file.getBookversion() +"\\"+ file.getFileName() +".pdf";
		String path = "\\\\UNIORACLE\\3r_card\\"+ file.getFileType() +"\\" + file.getFileName()+"\\"; // +"\\"+ file.getFileName() +".pdf"
		String fileName = file.getFileName() +".pdf";
		System.out.println(path+fileName);
		File fileDownload = new File(path, fileName);
		model.addAttribute("type", "pdf");
		model.addAttribute("fileDownload", fileDownload);
		return new ModelAndView("springDownload", "downloadFile", fileDownload);

	}*/
	
	@RequestMapping(value = "/download", method=RequestMethod.POST)
	public ModelAndView download(FileVO fileVO, HttpServletRequest req) {

	  File file = null;

	  String fileName = fileVO.getFileName() + ".pdf";
	  String path = "C:\\UNIORACLE\\3r_card\\PDF\\"+ fileVO.getSeries()
		+"\\"+ fileVO.getFileName() +"\\"+ fileVO.getBookversion();
//	  String path = "/resources/img";

	  try{
		  String realpath = req.getSession().getServletContext().getRealPath(path);
		  /*String path = req.getSession().getServletContext().getRealPath("\\\\UNIORACLE\\3r_card\\PDF"
		  		 + fileVO.getSeries() +"\\" + fileVO.getFileName()+"\\" + fileVO.getBookversion());*/
		  System.out.println(path + "\\" + fileName);
		  file = new File(realpath + "\\" + fileName);

	  }catch(Exception e){

	  }

	  /*if("get".equals(req.getMethod().toLowerCase())){

	            return new ModelAndView("/errorMethod", "downloadFile", file); // 잘못된 접근 방식

	  }else if(file == null || file.exists() == false){

	             return new ModelAndView("/fileNotFound", "downloadFile", file); // 파일이 없을 때

	  }*/

	  return new ModelAndView("download", "downloadFile", file).addObject("fileName", fileName);

	 

	}

	
	@RequestMapping(value="/readbook", method=RequestMethod.GET)
	public void readbook(int convertno, Model model) throws Exception{
		model.addAttribute("path", service.readConvertBook(convertno).getImgpath());
	}
	@RequestMapping(value="/report", method=RequestMethod.GET)
	public void report(int bookno, Model model) throws Exception{
		BookAdditionVO bookaddition = new BookAdditionVO();
		bookaddition.setBookno(bookno);
		bookaddition.setAddmode("신고");
		model.addAttribute("title", service.readBook(bookno).getTitle());
		model.addAttribute("reportlist", service.listBookAddition(bookaddition));
	}
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void gallary(Model model) throws Exception{
	}
}
