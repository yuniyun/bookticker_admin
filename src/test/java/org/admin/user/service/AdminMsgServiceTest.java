package org.admin.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.admin.user.model.AdminMsgVO;
import org.admin.user.model.MsgCriteria;
import org.admin.user.service.AdminMsgService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class AdminMsgServiceTest {

	private static final Logger logger = LoggerFactory
			.getLogger(AdminMsgServiceTest.class);

	@Inject
	DataSource dateSource;

	@Inject
	private AdminMsgService adminMsgService;

	
	private AdminMsgVO admin = new AdminMsgVO();
	
	@Test
	public void testRegist() throws Exception {
		for (int i = 1; i < 30; i++) {
			admin.setMsg("MSG" + i);
			admin.setUserid("aaa"+i+"@naver.com");
			adminMsgService.regist(admin);
		}
	}

	@Test
	public void testRead() throws Exception {
		logger.info(adminMsgService.read(31).toString());
	}
	
	@Test
	public void testListPage() throws Exception {

		MsgCriteria cri = new MsgCriteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<AdminMsgVO> list = adminMsgService.listPage(cri);
		for (AdminMsgVO adminMsgVO : list) {
			logger.info(adminMsgVO.toString());
		}
	}
	
	@Test
	public void testListPageCount() throws Exception {

		MsgCriteria cri = new MsgCriteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		logger.info(adminMsgService.listCountPage(cri).toString());
	}
	
	@Test
	public void testModify() throws Exception {
		
		admin.setUserid("aaa29@naver.com");
		adminMsgService.modify(admin);
		
	}
	
}
