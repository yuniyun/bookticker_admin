package org.common.model;

import java.util.List;

import org.admin.book.model.BookAdditionVO;
import org.admin.book.model.BookCriteria;
import org.admin.book.model.PermitInfoVO;
import org.apache.ibatis.annotations.Param;

public interface BookMapper {
	
	// Book
	
	public void createBook(BookVO book) throws Exception;
	
	public void createIndieBook(BookVO book) throws Exception;
	
	public BookVO readBook(Integer bookno) throws Exception; 
	
	public void updateBook(BookVO book) throws Exception;
	
	public void updateConvertstate
	(@Param("bookno")Integer bookno, @Param("convertstate")String convertstate) throws Exception;

	public void updateStarPoint(@Param("bookno")Integer bookno, @Param("starPoint_avg")float starPoint_avg) throws Exception;
	
	public void updatetotalPage(@Param("bookno")Integer bookno, @Param("pageTotal")Integer pageTotal) throws Exception;

	public void deleteBook(Integer bookno) throws Exception;
	
	public void addReportCnt(Integer bookno) throws Exception;
	
	public void deleteReportCnt(Integer bookno) throws Exception;
	
	public Integer totalBookCnt(BookCriteria cri) throws Exception;
	
	public Integer bookTotalPage(Integer bookno) throws Exception; //pdf total page
	
	public void addSellCnt(Integer bookno) throws Exception;

	public String readPDFPath(Integer bookno) throws Exception;
	
	public String readIMGPath(@Param("bookno")Integer bookno, @Param("pageno")Integer pageno) throws Exception;
	
	public List<Integer> listConvertReady() throws Exception;
			
	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception;
	
	public List<BookVO> listVersion(@Param("userid")String userid, @Param("title")String title) throws Exception;
		
	// Card
	public void createCard(CardVO card) throws Exception;
	
	public void createCardAndregisterUser(@Param("userid")String userid, @Param("bookno")Integer bookno) throws Exception;

	public CardVO readCard(Integer cardno) throws Exception;
	// Usingstate & Userid 수정
	public void updateCardUser(CardVO card) throws Exception;
	
	public void updateCardStarpoint(@Param("cardno")Integer cardno, @Param("starpoint")float starpoint) throws Exception;
	
	public void updateCardReview(CardVO card) throws Exception;
	// true or false 로 값을 받아 처리
	public void updateCardLikestate(CardVO card) throws Exception;
	
	public void updateCardContinuePage(CardVO card) throws Exception;
	
	public void deleteCard(Integer cardno) throws Exception;
	
	public Integer starpointBookCnt(Integer bookno) throws Exception; //평점 avg 구할 때 사용
	
	public List<CardVO> listAllCard() throws Exception;
	
	public List<CardVO> listAllCard(@Param("bookno") Integer bookno) throws Exception; //한책의 모든 카드
	
	// BookAddition

	public void createBookAddition(BookAdditionVO bookAddition) throws Exception;

	public BookAdditionVO readBookAddition(@Param("additionno") Integer additionno) throws Exception;

	public void updateBookAddition(BookAdditionVO bookAddition) throws Exception;

	public void deleteBookAddition(Integer additionno) throws Exception;
	// 한 페이지에의 bookaddition 모두 가져오기
	public List<BookAdditionVO> listOnePageBookAddition(BookAdditionVO bookAddition)
			throws Exception;
	// 한책의 모든 북애디션 보기
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception;
	//한 책의 신고 수
	public Integer bookReportCnt(@Param("bookno")Integer bookno) throws Exception; 
	
	// PermitInfo

	public void createPermitInfo(PermitInfoVO permitInfo) throws Exception;
	   
	public PermitInfoVO readPermitInfo(Integer permitno) throws Exception;
	   
	public List<PermitInfoVO> listPermitInfo(Integer bookno) throws Exception;

	// ConvertBook

	public void createConvertBook(ConvertBookVO convertbook) throws Exception;

	public ConvertBookVO readConvertBook(Integer convertno) throws Exception;

	public List<ConvertBookVO> listConvertBook() throws Exception;

	public List<ConvertBookVO> listOneConvertBook(@Param("bookno")Integer bookno) throws Exception;
	
	public void deleteConvertBook(Integer convertno) throws Exception;

}
