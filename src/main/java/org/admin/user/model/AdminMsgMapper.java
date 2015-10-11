package org.admin.user.model;

import java.util.List;

public interface AdminMsgMapper {

	public void create(AdminMsgVO admin) throws Exception;

	public AdminMsgVO read(Integer msgno) throws Exception;

	public List<AdminMsgVO> listPage(MsgCriteria page) throws Exception;

	public Integer listCountPage(MsgCriteria cri) throws Exception;
	
	public void update(AdminMsgVO admin) throws Exception;
	
	public void delete(Integer msgno) throws Exception;

}
