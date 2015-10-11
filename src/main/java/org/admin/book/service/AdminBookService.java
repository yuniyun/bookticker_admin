package org.admin.book.service;

import java.util.List;

import org.admin.book.model.BookAdditionVO;
import org.admin.book.model.BookCriteria;
import org.admin.book.model.PermitInfoVO;
import org.common.model.BookVO;
import org.common.model.CardVO;
import org.common.model.ConvertBookVO;

public interface AdminBookService {

	// Book
	public BookVO readBook(Integer bookno) throws Exception;

	public void updateBook(BookVO book) throws Exception;

	public void deleteBook(Integer bookno) throws Exception;

	public void deleteReportCnt(Integer bookno) throws Exception;

	public Integer totalBookCnt(BookCriteria cri) throws Exception;

	public String readPDFPath(Integer bookno) throws Exception;

	public String readIMGPath(Integer bookno, Integer pageno) throws Exception;

	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception;
	

	// Card

	public void createCard(CardVO card) throws Exception;

	public CardVO readCard(Integer cardno) throws Exception;

	// Usingstate & Userid 수정
	public void registUser(CardVO card, Integer bookno) throws Exception;

	public void deleteCard(Integer cardno) throws Exception;

	public List<CardVO> listAllCard() throws Exception;

	public List<CardVO> listAllCard(Integer bookno) throws Exception;

	// BookAddition
	// 한책의 모든 신고 보기
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception;

	// 한 책의 신고 수
	public Integer bookReportCnt(Integer bookno) throws Exception;

	
	// PermitInfo
	public void createPermitInfo(PermitInfoVO permitInfo) throws Exception;
	
	public void createPermitInfoAll() throws Exception;

	public PermitInfoVO readPermitInfo(Integer permitno) throws Exception;

	public List<PermitInfoVO> listPermitInfo(Integer bookno) throws Exception;

	// ConvertBook
	public ConvertBookVO readConvertBook(Integer convertno) throws Exception;

	public List<ConvertBookVO> listConvertBook() throws Exception;

	public List<ConvertBookVO> listOneConvertBook(Integer bookno) throws Exception;

//	public void deleteConvertBook(Integer convertno) throws Exception;
}
