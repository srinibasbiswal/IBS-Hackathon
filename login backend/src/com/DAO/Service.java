package com.DAO;

import com.POJO.Login;
import com.POJO.Register;

public interface Service {

	int register(Register register);

	String login(Login login);

	String send(String id, String receiver, String pnr,String seat);

	String accept(String id, String send, String pnr, String seat);

}
