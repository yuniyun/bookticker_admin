package org.admin.user.service;

import java.util.List;

import javax.inject.Inject;

import org.admin.user.model.AdminMsgMapper;
import org.admin.user.model.AdminMsgVO;
import org.admin.user.model.MsgCriteria;
import org.springframework.stereotype.Service;

@Service
public class AdminMsgServiceImpl implements AdminMsgService {

	@Inject
	AdminMsgMapper mapper;
	
	@Override
	public void regist(AdminMsgVO admin) throws Exception {
		mapper.create(admin);
	}

	@Override
	public AdminMsgVO read(Integer msgno) throws Exception {
		return mapper.read(msgno);
	}

	@Override
	public List<AdminMsgVO> listPage(MsgCriteria page) throws Exception {
		return mapper.listPage(page);
	}

	@Override
	public Integer listCountPage(MsgCriteria cri) throws Exception {
		return mapper.listCountPage(cri);
	}

	@Override
	public void modify(AdminMsgVO admin) throws Exception {
		mapper.update(admin);
	}

	@Override
	public void remove(Integer msgno) throws Exception {
		mapper.delete(msgno);
	}
	
}
