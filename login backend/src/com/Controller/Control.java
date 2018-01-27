package com.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.Service;
import com.POJO.Book;
import com.POJO.Login;
import com.POJO.Register;

@Controller
public class Control {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	 public ModelAndView showhome() {
		ModelAndView model=new ModelAndView("Welcome");
		return model;
	}


	@Autowired
	Service service;


	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView validate(@ModelAttribute("login")Login login,HttpServletRequest request) {
		List<String> result=service.login(login);
		ModelAndView model;
		if(result==null) {
			model=new ModelAndView("Welcome");
		model.addObject("msg","Invalid User Id or Password");
		
		}else {
			model=new ModelAndView("Profile");
			request.getSession().setAttribute("id", result.get(0));
			model.addObject("notification",result);
			
		}
		
		
		return model;
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("register")Register register) {
		ModelAndView model;
		model=new ModelAndView("Welcome");
		int result=service.register(register);
		if(result==1) {
			
			model.addObject("msg","You Have SuccessFully Registered");
		}else {
			model.addObject("msg","Registration Failed... Please Try again");
		}
		return model;
	}
	@RequestMapping(value="/request",method=RequestMethod.POST)
	public ModelAndView sendRequest(@RequestParam  Map<String,String> req,HttpSession session) {
		String id=(String) session.getAttribute("id");
		session.setAttribute("id",id);
		ModelAndView model=new ModelAndView("page name");
		String rseat=req.get("rseat");
		String pnr=req.get("pnr");
		String seat=req.get("seat");
		String jdate=req.get("jdate");
		String result=service.send(id,rseat,pnr,seat,jdate);
		if(result.equalsIgnoreCase("sent")) {
			model.addObject("msg","Successfullly Sent");
		}else {
			model.addObject("msg","Unable to Send Request");
		}
		return model;
	}
	@RequestMapping(value="/accept",method=RequestMethod.POST)
	public ModelAndView accept(@RequestParam  Map<String,String> acc,HttpSession session) {
		ModelAndView model=new ModelAndView("page name");
		String id=(String) session.getAttribute("id");
		session.setAttribute("id",id);
		String send=acc.get("sender");
		String pnr=acc.get("pnr");
		String seat=acc.get("seat");
		String rpnr=acc.get("rpnr");
		String rseat=acc.get("rseat");
		String result=service.accept(id,send,pnr,rpnr,rseat, seat);
		if(result.equalsIgnoreCase("accepted")) {
			model.addObject("msg","Thank you for your response");
			
		}else {
			model.addObject("msg","Something went wrong");
		}
		return model;
	}
	@RequestMapping(value="/reject",method=RequestMethod.POST)
	public ModelAndView reject(@RequestParam  Map<String,String> rej,HttpSession session) {
		ModelAndView model=new ModelAndView("page name");
		String id=(String) session.getAttribute("id");
		session.setAttribute("id",id);
		String send=rej.get("sender");
		String pnr=rej.get("pnr");
		String seat=rej.get("seat");
		String rpnr=rej.get("rpnr");
		String rseat=rej.get("rseat");
		String result=service.reject(id,send,pnr,rpnr,rseat, seat);
		if(result.equalsIgnoreCase("rejected")) {
			model.addObject("msg","Thank you for your response");
			
		}else {
			model.addObject("msg","Something went wrong");
		}
		return model;
	}
	@RequestMapping(value="/book",method=RequestMethod.POST)
	public ModelAndView booking(@RequestParam  Map<String,String> book,HttpSession session) {
		String id=(String) session.getAttribute("id");
		session.setAttribute("id",id);
		ModelAndView model=new ModelAndView("page name");
		String n1=book.get("n1");
		String g1=book.get("g1");
		String a1=book.get("a1");
		String num=book.get("number");
		String to=book.get("to");
		String from=book.get("from");
		String price=book.get("price");
		String date=book.get("date");
		ArrayList<String> l=new ArrayList<String>();
		l.add(num);
		l.add(to);
		l.add(from);
		l.add(price);
		l.add(date);
		l.add(id);
		ArrayList<Book> b=new ArrayList<Book>();
		
		if(n1!=null && g1!=null && a1!=null) {
			Book bb=new Book();
			bb.setA1(a1);
			bb.setG1(g1);
			bb.setN1(n1);
			b.add(bb);
			String n2=book.get("n2");
			String g2=book.get("g2");
			String a2=book.get("a2");
			if(n2!=null && g2!=null && a2!=null) {
				String n3=book.get("n3");
				String g3=book.get("g3");
				String a3=book.get("a3");
				Book b3=new Book();
				b3.setA1(a2);
				b3.setG1(g2);
				b3.setN1(n2);
				b.add(b3);
				if(n3!=null && g3!=null && a3!=null) {
					Book b4=new Book();
					b4.setA1(a2);
					b4.setG1(g2);
					b4.setN1(n2);
					b.add(b4);
					List<String> ll=service.book(l,b);
					l.add(ll.get(0));
					l.add(ll.get(1));
					model.addObject("invoice",l);
				}else {
					List<String> ll=service.book(l,b);
					l.add(ll.get(0));
					l.add(ll.get(1));
					model.addObject("invoice",l);
				}
				
			}else {
				List<String> ll=service.book(l,b);
				l.add(ll.get(0));
				l.add(ll.get(1));
				model.addObject("invoice",l);

			}
		}else {
			
		}
		return model;
	}
	@RequestMapping(value="/findTrain",method=RequestMethod.POST)
	public ModelAndView findTrain(@RequestParam  Map<String,String> train,HttpSession session) {
		ModelAndView model=new ModelAndView("page name");
		String id=(String) session.getAttribute("id");
		session.setAttribute("id",id);
		String from=train.get("from");
		String to=train.get("to");
		String date=train.get("date");
		List<String> l=service.getTrain(from,to);
		if(l!=null) {
		l.add(date);
		model.addObject("train",l);
		return model;
		}else {
			return model;
		}
		
	}
	@RequestMapping(value="/getSeats",method=RequestMethod.POST)
	public ModelAndView getSeatsInfo(@RequestParam  Map<String,String> seats,HttpSession session) {
		ModelAndView model=new ModelAndView("page name");
		String id=(String) session.getAttribute("id");
		session.setAttribute("id",id);
		
		return model;
	}
	@RequestMapping(value="/notification",method=RequestMethod.POST)
	public ModelAndView getNotification(@RequestParam  Map<String,String> not,HttpSession session) {
		String id=(String)session.getAttribute("id");
		session.setAttribute("id",id);
		String sid=not.get("sid");
		ModelAndView model=new ModelAndView("page-name");
		List<String> l=service.viewNotification(id, sid);
		if(l==null) {
			model.addObject("msg","Unable to Load the page");
		}else {
			model.addObject("notification",l);
		}
		return model;
		}
	@RequestMapping(value="/proceed",method=RequestMethod.POST)
	public ModelAndView proceed(@RequestParam  Map<String,String> proc,HttpSession session) {
		ModelAndView model=new ModelAndView("Page name");
		String id=(String)session.getAttribute("id");
		session.setAttribute("id",id);
		String num=proc.get("number");
		String to=proc.get("to");
		String from=proc.get("from");
		String price=proc.get("price");
		String date=proc.get("date");
		ArrayList<String> l=new ArrayList<String>();
		l.add(num);
		l.add(to);
		l.add(from);
		l.add(price);
		l.add(date);
		model.addObject("train",l);
		return model;
	}
	
	
}

