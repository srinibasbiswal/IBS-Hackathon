package com.DAO;

import java.security.MessageDigest;
import java.util.Random;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.POJO.Login;
import com.POJO.Register;

public class Dao implements Service{
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	 private PlatformTransactionManager transactionManager;
	@Override
	public int register(Register register) {
		TransactionDefinition td = new DefaultTransactionDefinition();
	    TransactionStatus status = transactionManager.getTransaction(td);
		try {
		String pass=register.getPassword();
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		int store=Integer.parseInt(pass);
		byte bb=(byte)store;
		md.update(bb);
		 byte[] mdbytes = md.digest();
		StringBuffer hex = new StringBuffer();
		for (int i = 0; i < mdbytes.length; i++) {
		hex.append(Integer.toHexString(0xFF & bb));
		}
		String password=hex.substring(0, 4).toString();
		int result=jdbcTemplate.update("insert into customer values(?,?,?,?,?,?,?)",new Object[] {register.getUsername(),register.getName(),password,register.getAdhar(),register.getEmail(),register.getPh(),0});
		if(result==1) {
			transactionManager.commit(status);
			return 1;
		}else {
			transactionManager.rollback(status);
			return 0;
		}
		}catch(Exception ee) {
			transactionManager.rollback(status);
			ee.printStackTrace();
			return 0;
		}
	}
	@Override
	public String login(Login login) {
		try {
			String pass=login.getPassword();
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			int store=Integer.parseInt(pass);
			byte bb=(byte)store;
			md.update(bb);
			 byte[] mdbytes = md.digest();
			StringBuffer hex = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) {
			hex.append(Integer.toHexString(0xFF & bb));
			}
			String password=hex.substring(0, 4).toString();
			String id=jdbcTemplate.queryForObject("select username from customer where username=? and password=?",new Object[] {login.getUsername(),pass},String.class);
			if(id!=null) {
			return id;
			}else {
				return null;
			}
		}catch(Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}
	

}
