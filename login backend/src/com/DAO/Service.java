package com.DAO;

import java.util.ArrayList;
import java.util.List;

import com.POJO.Book;
import com.POJO.Login;
import com.POJO.Register;

public interface Service {

	int register(Register register);

	String login(Login login);

	String send(String id, String rseat, String pnr,String seat,String jdate);



	List viewNotification(String id, String sid);

	String accept(String id, String send, String pnr, String rpnr, String rseat, String seat);

	String reject(String id, String send, String pnr, String rpnr, String rseat, String seat);

	List<String> getTrain(String from, String to);

	List<String> book(List<String> l, ArrayList<Book> b);

}
