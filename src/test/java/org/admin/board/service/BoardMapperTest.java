package org.admin.board.service;

import org.admin.board.model.BoardVO;
import org.common.model.BoardMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardMapperTest {

	@Autowired
	BoardMapper bm;
	
//	@Test
//	public void testTime() {
//		logger.info(bm.getTime());
//	}
	
	@Test
	public void writeTest() throws Exception{
		
		BoardVO vo = new BoardVO();
		
		for(int i = 100; i<400; i++){
		vo.setTitle("À¯´ÏÀ±ÆÒÅ¬·´ " + i + "¹ø");
		vo.setBoardContent("½Å¿ì"+i);
		vo.setUserid("sinuboogi");
		
		bm.userBoardWrite(vo);
		}
	}

}
