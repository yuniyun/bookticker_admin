package org.login.model;

public interface LoginMapper {

	public LoginVO read(LoginVO login) throws Exception;

	public String readPW(LoginVO login) throws Exception;
		
	public void update(LoginVO login) throws Exception;
	
	public void create(LoginVO login) throws Exception;
				
}
