package org.admin.book.service;

import java.util.List;

import javax.inject.Inject;

import org.admin.book.model.BookAdditionVO;
import org.admin.book.model.BookCriteria;
import org.admin.book.model.PermitInfoVO;
import org.common.model.BookMapper;
import org.common.model.BookVO;
import org.common.model.CardVO;
import org.common.model.ConvertBookVO;
import org.common.model.Ghost4jBookConverter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminBookServiceImpl implements AdminBookService {
	
	@Inject
	private BookMapper mapper;

	@Override
	public BookVO readBook(Integer bookno) throws Exception {
		return mapper.readBook(bookno);
	}

	@Override
	public void updateBook(BookVO book) throws Exception {
		mapper.updateBook(book);
	}

	@Override
	public void deleteBook(Integer bookno) throws Exception {
		mapper.deleteBook(bookno);
	}

	@Override
	public void deleteReportCnt(Integer bookno) throws Exception {
		mapper.deleteReportCnt(bookno);
	}

	@Override
	public Integer totalBookCnt(BookCriteria cri) throws Exception {
		return mapper.totalBookCnt(cri);
	}

	@Override
	public String readPDFPath(Integer bookno) throws Exception {
		return mapper.readPDFPath(bookno);
	}

	@Override
	public String readIMGPath(Integer bookno, Integer pageno) throws Exception {
		return mapper.readIMGPath(bookno, pageno);
	}

	@Override
	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception {
//		System.out.println("Å°¿öµå: "+ cri.getKeyword() +", Å¸ÀÔ: "+cri.getSearchType());
		return mapper.listSearchBook(cri);
	}

	@Override
	public void createCard(CardVO card) throws Exception {
		mapper.createCard(card);
	}

	@Override
	public CardVO readCard(Integer cardno) throws Exception {
		return mapper.readCard(cardno);
	}

	@Override
	public void registUser(CardVO card, Integer bookno) throws Exception {
		mapper.updateCardUser(card);
		mapper.addSellCnt(bookno);
	}

	@Override
	public void deleteCard(Integer cardno) throws Exception {
		mapper.deleteCard(cardno);
	}

	@Override
	public List<CardVO> listAllCard() throws Exception {
		return mapper.listAllCard();
	}

	@Override
	public List<CardVO> listAllCard(Integer bookno) throws Exception {
		return mapper.listAllCard(bookno);
	}

	@Override
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception {
		return mapper.listBookAddition(bookAddition);
	}

	@Override
	public Integer bookReportCnt(Integer bookno) throws Exception {
		return mapper.bookReportCnt(bookno);
	}

	@Transactional
	@Override
	public void createPermitInfo(PermitInfoVO permitInfo) throws Exception {
		mapper.createPermitInfo(permitInfo);
		BookVO bvo = mapper.readBook(permitInfo.getBookno());
		if(permitInfo.getPermitstate().equals("½ÂÀÎ")){
			int totalpage = new Ghost4jBookConverter()
								.convertToIMG(bvo.getSeries(), bvo.getTitle(), bvo.getBookversion()+"");
			if(totalpage == -1){
				mapper.updateConvertstate(bvo.getBookno(), "º¯È¯¿À·ù");
				permitInfo.setPermitstate("->¿À·ù");
				mapper.createPermitInfo(permitInfo);
				return;
			}
			if(totalpage > 0){
				mapper.updatetotalPage(bvo.getBookno(), totalpage);
				System.out.println(totalpage);
				for(int i=1; i<=totalpage; i++){
					ConvertBookVO cbvo = new ConvertBookVO();
					cbvo.setBookno(bvo.getBookno());
					cbvo.setPageno(i);
					cbvo.setImgpath("C:\\unioracle\\3r_card\\image\\"
							+ bvo.getSeries() + "\\" + bvo.getTitle() + "\\"
							+ bvo.getBookversion() + "\\" + i + ".png");
					mapper.createConvertBook(cbvo);
				}
				mapper.updateConvertstate(bvo.getBookno(), "º¯È¯µÊ");
				return;
			}
		}
		mapper.updateConvertstate(bvo.getBookno(), "º¯È¯¾ÈµÊ"); //½ÂÀÎ & º¯È¯¾ÈµÊ -> ¿¡·¯
	}
	
	@Override
	public void createPermitInfoAll() throws Exception{
		List<Integer> booksno = mapper.listConvertReady();
		PermitInfoVO permitInfo = new PermitInfoVO();
		permitInfo.setPermitstate("½ÂÀÎ");
		for (Integer bookno : booksno) {
			permitInfo.setBookno(bookno);
			createPermitInfo(permitInfo);
		}
	}

	@Override
	public PermitInfoVO readPermitInfo(Integer permitno) throws Exception {
		return mapper.readPermitInfo(permitno);
	}

	@Override
	public List<PermitInfoVO> listPermitInfo(Integer bookno) throws Exception {
		return mapper.listPermitInfo(bookno);
	}

	@Override
	public ConvertBookVO readConvertBook(Integer convertno) throws Exception {
		return mapper.readConvertBook(convertno);
	}

	@Override
	public List<ConvertBookVO> listConvertBook() throws Exception {
		return mapper.listConvertBook();
	}

	@Override
	public List<ConvertBookVO> listOneConvertBook(Integer bookno) throws Exception {
		return mapper.listOneConvertBook(bookno);
	}

	/*@Override
	public void deleteConvertBook(Integer convertno) throws Exception {

	}*/

}
