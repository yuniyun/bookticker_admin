package org.common.web;

import java.io.File;
import java.io.FileInputStream;

import org.admin.board.model.BoardCriteria;
import org.admin.book.model.BookCriteria;
import org.apache.log4j.Logger;
import org.common.model.FileVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonController {
	
	private static Logger logger = Logger.getLogger(CommonController.class);
	
	//\\UNIORACLE\3r_card\IMAGE\이야기 시리즈\이야기\1.0
		@RequestMapping(value="/view", method= RequestMethod.GET)
		public @ResponseBody byte[]  viewFile(FileVO file)throws Exception{
			logger.info("view File: " + file.getFileName());
			
//			String path = "\\\\UNIORACLE\\3r_card\\"+ file.getFileType() +"\\"+ file.getSeries()
//					+"\\"+ file.getFileName() +"\\"+ file.getBookversion() +"\\"; //1
			
			String path; //2
			if(file.getPath() != null)
				path = file.getPath();
			else
				path = "C:\\UNIORACLE\\3r_card\\"+ file.getFileType() +"\\"+ file.getSeries()
				+"\\"+ file.getFileName() +"\\"+ file.getBookversion() +"\\"+ file.getPageNo() +".png"; //2
//				path += file.getPageNo() +".png"; //1
			FileInputStream fin = new FileInputStream(new File(path));
//			System.out.println(path);
			
			return FileCopyUtils.copyToByteArray(fin);
			
		}
	
		@RequestMapping(value = "/user/home", method = RequestMethod.GET)
		public void home(Model model) throws Exception {
			
		}
	
	/*//\\UNIORACLE\3r_card\IMAGE\이야기 시리즈\이야기\1.0
	@RequestMapping(value="/view", method= RequestMethod.GET)
	public @ResponseBody byte[]  viewFile(FileVO file)throws Exception{
		logger.info("view File: " + file.getFileName());
		String lastAttach = "";
		if(file.getFileType().equals("IMAGE")) lastAttach = file.getPageNo() +".png";
		else if(file.getFileType().equals("PDF")) lastAttach = file.getFileName() +".pdf";
		
//		String path = "\\\\UNIORACLE\\3r_card\\"+ file.getFileType() +"\\"+ file.getSeries()
//				+"\\"+ file.getFileName() +"\\"+ file.getBookversion() +"\\"+ lastAttach;
		
		String path = "C:\\UNIORACLE\\3r_card\\"+ file.getFileType() +"\\"+ file.getSeries()
				+"\\"+ file.getFileName() +"\\"+ file.getBookversion() +"\\"+ lastAttach;
		System.out.println(path);
		FileInputStream fin = new FileInputStream(new File(path));
		
		
		return FileCopyUtils.copyToByteArray(fin);
		
	}	
*/
}