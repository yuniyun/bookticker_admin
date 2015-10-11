package org.common.model;

import java.util.List;

import org.admin.user.model.MemberVO;
import org.admin.user.model.PageCriteria;
import org.admin.user.model.MemberCriteria;

public interface MemberMapper {
		
	public void create(MemberVO member) throws Exception;
	
	public MemberVO read(String userid) throws Exception; 
	
	public void update(MemberVO member) throws Exception;
	
	public void delete(String userid) throws Exception;

	public Integer addMyBookCnt(String userid) throws Exception;

	public Integer addWritingCnt(String userid) throws Exception;
	
	public Integer deleteWritingCnt(String userid) throws Exception;
	
	public Integer totalCnt() throws Exception;
	
	public List<MemberVO> listAll() throws Exception;
	
	public List<MemberVO> listPage(PageCriteria page) throws Exception;
	
	public Integer listCountPage(PageCriteria cri) throws Exception;
	
	public List<MemberVO> listSearch(MemberCriteria cri) throws Exception;
	
	public Integer listSearchCount(MemberCriteria cri) throws Exception;
	
}