package org.admin.user.service;

import java.util.List;

import org.admin.user.model.AdminMsgVO;
import org.admin.user.model.MsgCriteria;

public interface AdminMsgService {

	public void regist(AdminMsgVO admin) throws Exception;

	public AdminMsgVO read(Integer msgno) throws Exception;

	public List<AdminMsgVO> listPage(MsgCriteria page) throws Exception;

	public Integer listCountPage(MsgCriteria cri) throws Exception;
	
	public void modify(AdminMsgVO admin) throws Exception;
	
	public void remove(Integer msgno) throws Exception;

}
