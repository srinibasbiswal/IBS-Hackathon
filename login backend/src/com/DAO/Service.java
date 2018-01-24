package com.DAO;

import com.POJO.Login;
import com.POJO.Register;

public interface Service {

	int register(Register register);

	String login(Login login);

}
