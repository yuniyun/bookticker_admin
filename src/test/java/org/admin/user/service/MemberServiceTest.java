package org.admin.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.admin.user.model.MemberVO;
import org.admin.user.model.PageCriteria;
import org.admin.user.model.MemberCriteria;
import org.admin.user.service.AdminMemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MemberServiceTest {

	private static final Logger logger = LoggerFactory
			.getLogger(MemberServiceTest.class);

	@Inject
	DataSource dateSource;

	private MemberVO memberVO = new MemberVO();

	@Inject
	private AdminMemberService memberService;

	@Test
	public void testRegist() throws Exception {
		for (int i = 1; i < 30; i++) {
		memberVO.setUserid("aaa"+i+"@naver.com");
		memberVO.setUserpw("pw"+i);
		memberVO.setUsername("HDH"+i);
		memberVO.setBirth("910306"+i);
		memberVO.setGender("남");
		memberVO.setPhone("01031292509"+i);
		memberVO.setGrade("일반");
		memberVO.setLivestate("사용"+i);
		memberVO.setMybookcnt(0);
		memberVO.setWritingcnt(0);
		memberService.regist(memberVO);
		}
	}

	@Test
	public void testRead() throws Exception {
		logger.info(memberService.read("id").toString());
	}

	@Test
	public void testListAll() throws Exception {
		List<MemberVO> list = memberService.listAll();
		for (MemberVO memberVO : list) {
			logger.info(memberVO.toString());
		}
	}

	@Test
	public void testModify() throws Exception {
		memberVO.setUserid("momo@dummy.com");
		memberVO.setLivestate("사용중");
		memberService.modify(memberVO);
	}

	@Test
	public void testRemove() throws Exception {
		memberService.remove("id");
	}

	@Test
	public void testListPage() throws Exception {

		PageCriteria cri = new PageCriteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<MemberVO> list = memberService.listPage(cri);
		for (MemberVO memberVO : list) {
			logger.info(memberVO.toString());
		}
	}
	
	@Test
	public void testListPageCount() throws Exception {

		PageCriteria cri = new PageCriteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		logger.info(memberService.listCountPage(cri).toString());
	}
	

	@Test
	public void testTotalCnt() throws Exception{
		
		logger.info(memberService.totalCnt().toString());
	}
	
	@Test
	public void testListSearch() throws Exception{
		
		MemberCriteria cri = new MemberCriteria();
//		cri.setSearchType("username");
//		cri.setKeyword("강현모");
//		cri.setCheckGender("남자");
//		cri.setCheckLiveState("탈퇴");
		cri.setPage(2);
		cri.setPerPageNum(10);
		
		List<MemberVO> list = memberService.listSearch(cri);
		for (MemberVO memberVO : list) {
			logger.info(memberVO.toString());
		}
	}
	
	@Test
	public void testListSearchCount() throws Exception{
		
		MemberCriteria cri = new MemberCriteria();
		cri.setSearchType("userid");
		cri.setKeyword("id");
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		memberService.listSearchCount(cri);
		
	}
}