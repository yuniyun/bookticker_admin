package org.login.service;

import org.login.model.LoginVO;

public interface LoginService {

	public LoginVO loginCheck(LoginVO login) throws Exception;

	public String getPW(LoginVO login) throws Exception;
	
	public void sessionUpdate(LoginVO login) throws Exception;
	
	public void regist(LoginVO login) throws Exception;
	
}
