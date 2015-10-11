package org.login.service;

import javax.inject.Inject;

import org.login.model.LoginMapper;
import org.login.model.LoginVO;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginMapper mapper;

	@Override
	public LoginVO loginCheck(LoginVO login) throws Exception {
		return mapper.read(login);
	}

	@Override
	public String getPW(LoginVO login) throws Exception {
		return mapper.readPW(login);
	}

	@Override
	public void sessionUpdate(LoginVO login) throws Exception {
		mapper.update(login);
	}

	@Override
	public void regist(LoginVO login) throws Exception {
		mapper.create(login);
	}

}
