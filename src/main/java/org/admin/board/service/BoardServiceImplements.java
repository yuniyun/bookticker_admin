package org.admin.board.service;

import java.util.List;

import javax.inject.Inject;

import org.admin.board.model.BoardReportVO;
import org.admin.board.model.BoardVO;
import org.admin.board.model.BoardCriteria;
import org.common.model.BoardMapper;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImplements implements BoardService {

	@Inject
	private BoardMapper bm;
	

	@Override
	public void autherBoardWrite(BoardVO vo) throws Exception {
		bm.autherBoardWrite(vo);
	}

	@Override
	public void userBoardWrite(BoardVO vo) throws Exception {
		bm.userBoardWrite(vo);
	}

	@Override
	public void adminBoardWrite(BoardVO vo) throws Exception {
		bm.adminBoardWrite(vo);
	}

	@Override
	public BoardVO boardRead(Integer boardNo) throws Exception {
		return bm.boardRead(boardNo);
	}

	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		bm.boardUpdate(vo);
	}

	@Override
	public void boardDelete(Integer boardNo) throws Exception {
		bm.boardDelete(boardNo);
	}



	@Override
	public Integer boardTotalCnt(BoardCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return bm.boardTotalCnt(cri);
	}

	@Override
	public List<BoardReportVO> boardReportList(Integer boardNo) throws Exception {
		return bm.boardReportList(boardNo);
	}

	@Override
	public void boardReportDelete(Integer reportNo) throws Exception {
		bm.boardReportDelete(reportNo);
	}

	@Override
	public BoardReportVO boardReportRead(Integer reportNo) throws Exception {
		return bm.boardReportRead(reportNo);
	}

	@Override
	public List<BoardVO> boardList(BoardCriteria cri) throws Exception {
		return bm.boardList(cri);
	}


}
