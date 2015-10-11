package org.admin.user.service;

import java.util.List;

import org.admin.user.model.MemberVO;
import org.admin.user.model.PageCriteria;
import org.admin.user.model.MemberCriteria;

public interface AdminMemberService {

	public void regist(MemberVO member) throws Exception;
	
	public MemberVO read(String userid) throws Exception; 
	
	public void modify(MemberVO member) throws Exception;
	
	public void remove(String userid) throws Exception;
	
	public Integer totalCnt() throws Exception;
	
	public List<MemberVO> listAll() throws Exception;
	
	public List<MemberVO> listPage(PageCriteria page) throws Exception;
	
	public Integer listCountPage(PageCriteria cri) throws Exception;
	
	public List<MemberVO> listSearch(MemberCriteria cri) throws Exception;
	
	public Integer listSearchCount(MemberCriteria cri) throws Exception;

	public Integer percentGender() throws Exception;
	
	public Integer percentGrade() throws Exception;
	
	public List<Integer> ageFigure() throws Exception;
}
