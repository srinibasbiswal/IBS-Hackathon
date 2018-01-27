package com.DAO;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.POJO.Book;
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
		System.out.println(password);
		int result=jdbcTemplate.update("insert into customer values(?,?,?,?,?,?)",new Object[] {register.getUsername(),register.getName(),password,register.getAdhar(),register.getPh(),0});
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
	public List<String> login(Login login) {
		List<String> l=new ArrayList();
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
			System.out.println(password);
			String id=jdbcTemplate.queryForObject("select username from customer where username=? and password=?",new Object[] {login.getUsername(),password},String.class);
			if(id!=null) {
				l.add(id);
				String sql="select sender_id from notification where rec_id='"+id+"'";
				List<String> ll=jdbcTemplate.query(sql,new ResultSetExtractor<List<String>>(){  
				    @Override  
				     public List<String> extractData(ResultSet rs) throws SQLException,  
				            DataAccessException { 
				    	ArrayList<String> l=new ArrayList<String>();
				    	l.add(id);
				    		if(rs.next()) {
				    			l.add(rs.getString(1));
				    		}
				    		return l;
					}});
				return ll;
			}else {
				return null;
			}
		}catch(Exception ee) {
			//ee.printStackTrace();
			return l;
		}
	}
	@Override
	public String send(String id, String rseat, String pnr, String seat,String jdate) {
		try {
			String sql="select pnr,user_id,train_no from seat_chart where seat_no='"+rseat+"'  and jdate='"+jdate+"'";
			List<String> l=jdbcTemplate.query(sql,new ResultSetExtractor<List<String>>(){  
    @Override  
     public List extractData(ResultSet rs) throws SQLException,  
            DataAccessException { 
    	ArrayList<String> l=new ArrayList<String>();
    		if(rs.next()) {
    				String rpnr=rs.getString(1);
    				l.add(rpnr);
    				String rid=rs.getString(2);
    				l.add(rid);
    				String jdate1=rs.getString(3);
    				l.add(jdate1);
    		}
    		return l;
    				
    		
        }  
    });
			String rpnr=l.get(1);
			String rid=l.get(2);
			String jdate1=l.get(3);
			
			int i=jdbcTemplate.update("insert into notification values(?,?,?,?,?,?,?)",new Object[] {id,rid,pnr,rpnr,Integer.parseInt(seat),Integer.parseInt(rseat),0});
			if(i==1) {
				return "sent";
			}else {
				return null;
			}
		}catch(Exception ee) {
		ee.printStackTrace();
		return null;
		}
	}
	
	
	public String accept(String id, String send, String pnr,String rpnr,String rseat, String seat) {
		try {
			 int i=jdbcTemplate.update("update seat_chart set seat=? where seat=? and pnr=?",new Object[] {Integer.parseInt(rseat),Integer.parseInt(seat),pnr});
			 if(i==1) {
				 int j=jdbcTemplate.update("update seat_chart set seat=? where pnr=? and seat=?", new Object[] {Integer.parseInt(seat),rpnr,Integer.parseInt(rseat)});
				 	if(j==1) {
				 		int k=jdbcTemplate.update("delete from notification where sender_id=? and rec_id=?",new Object[] {id,send});
				 		return "accepted";
				 }else {
					 return null;
				 }
			 }else {
					return null; 
			 }
					
		}catch(Exception ee) {
			ee.printStackTrace();
					return null;
		}
	}
	

	@Override
	public List<String> viewNotification(String id,String sid) {
		try {
			String sql="select * from notification where sender_id='"+sid+"' and rec_id='"+id+"'" ;
			List<String> l=jdbcTemplate.query(sql,new ResultSetExtractor<List<String>>(){  
    @Override  
     public List<String> extractData(ResultSet rs) throws SQLException,  
            DataAccessException { 
    	ArrayList<String> l=new ArrayList<String>();
    		if(rs.next()) {
    				l.add(id);
    				l.add(sid);
    				l.add(rs.getString(3));
    				l.add(rs.getString(4));
    				l.add(Integer.toString(rs.getInt(5)));
    				l.add(Integer.toString(rs.getInt(6)));
    				l.add(Integer.toString(rs.getInt(7)));
    				}
    			return l;
        }
			});
				return l;
	}catch(Exception ee) {
		ee.printStackTrace();
		return null;
	}
}
	@Override
	public String reject(String id, String send, String pnr, String rpnr, String rseat, String seat) {
		try {
			int i=jdbcTemplate.update("delete from notification where sender_id=? and rec_id=?",new Object[] {id,send});
			return "reject";
		}catch(Exception ee) {
		return null;
		}
	}
	@Override
	public List<String> getTrain(String from, String to) {
		
		try {
			String sql="select * from train where from_st='"+from+"' and to_st='"+to+"'" ;
			List<String> l=jdbcTemplate.query(sql,new ResultSetExtractor<List<String>>(){  
    @Override  
     public List<String> extractData(ResultSet rs) throws SQLException,  
            DataAccessException { 
    	ArrayList<String> l=new ArrayList<String>();
    		if(rs.next()) {
    			l.add(rs.getString(1));
    			l.add(rs.getString(2));
    			l.add(rs.getString(3));
    			l.add(rs.getString(4));
    			l.add(Integer.toString(rs.getInt(5)));
    			
    		}
    		return l;
	}});
    return l;
    		
	}catch(Exception ee) {
		ee.printStackTrace();
		return null;
	}
}
	@Override
	public List<String> book(List<String> l, ArrayList<Book> b) {
		try {
			List<String> ret=new ArrayList<String>();
			String pnr=Integer.toString(l.hashCode());
			String train=l.get(0);
			String jdate=l.get(4);
			String id=l.get(5);
			int last=jdbcTemplate.queryForInt("select seat from train where train_no=?",new Object[] {Integer.parseInt(train)});
			int people=b.size()-1;
			ret.add(Integer.toString(last));
			if((last+people)>40) {
				return null;
			}else {
		String sql ="insert into seat_chart values(?,?,?,?,?,?,?)";
		
					for(Book bb:b) {
						int ii=jdbcTemplate.update(sql,new Object[] {pnr,id,train,bb.getN1(),bb.getA1(),jdate,last});
						last++;
						
					}
			  int i=jdbcTemplate.update("update train set next=? where train_no=?",new Object[] {last,train});
			  ret.add(Integer.toString(--last));
			  return ret;
		
		
	
	}
			}catch(Exception ee) {
		ee.printStackTrace();
		return null;
	}
}
}