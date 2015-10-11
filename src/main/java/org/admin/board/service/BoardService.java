package org.admin.board.service;

import java.util.List;

import org.admin.board.model.BoardReportVO;
import org.admin.board.model.BoardVO;
import org.admin.board.model.BoardCriteria;
import org.apache.ibatis.annotations.Param;

public interface BoardService {
	
	public List<BoardVO> boardList(BoardCriteria cri) throws Exception;//전체 게시글리스트
	
	public void autherBoardWrite(BoardVO vo) throws Exception;//작가 게시글쓰기
	public void userBoardWrite(BoardVO vo) throws Exception;//유저 게시글쓰기
	public void adminBoardWrite(BoardVO vo) throws Exception;//관리자 게시글쓰기
	
	public BoardVO boardRead(Integer boardNo) throws Exception;//게시글조회
	
	public void boardUpdate(BoardVO vo) throws Exception;//게시글수정

	public void boardDelete(Integer boardNo) throws Exception;//게시글삭제
	
	public Integer boardTotalCnt(BoardCriteria cri) throws Exception;//전체 게시글 수 조회

	
	public List<BoardReportVO> boardReportList(Integer boardNo) throws Exception;//게시글 신고리스트
	public void boardReportDelete(Integer reportNo) throws Exception;//게시글 신고삭제
	public BoardReportVO boardReportRead(Integer reportNo) throws Exception;//게시글 신고 내용조회

}
