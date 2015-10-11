package org.admin.board.service;

import java.util.List;

import org.admin.board.model.BoardReportVO;
import org.admin.board.model.BoardVO;
import org.admin.board.model.BoardCriteria;
import org.apache.ibatis.annotations.Param;

public interface BoardService {
	
	public List<BoardVO> boardList(BoardCriteria cri) throws Exception;//��ü �Խñ۸���Ʈ
	
	public void autherBoardWrite(BoardVO vo) throws Exception;//�۰� �Խñ۾���
	public void userBoardWrite(BoardVO vo) throws Exception;//���� �Խñ۾���
	public void adminBoardWrite(BoardVO vo) throws Exception;//������ �Խñ۾���
	
	public BoardVO boardRead(Integer boardNo) throws Exception;//�Խñ���ȸ
	
	public void boardUpdate(BoardVO vo) throws Exception;//�Խñۼ���

	public void boardDelete(Integer boardNo) throws Exception;//�Խñۻ���
	
	public Integer boardTotalCnt(BoardCriteria cri) throws Exception;//��ü �Խñ� �� ��ȸ

	
	public List<BoardReportVO> boardReportList(Integer boardNo) throws Exception;//�Խñ� �Ű���Ʈ
	public void boardReportDelete(Integer reportNo) throws Exception;//�Խñ� �Ű����
	public BoardReportVO boardReportRead(Integer reportNo) throws Exception;//�Խñ� �Ű� ������ȸ

}
