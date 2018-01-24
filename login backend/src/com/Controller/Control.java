package com.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.Service;
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
		String result=(String)service.login(login);
		ModelAndView model;
		if(result==null) {
			model=new ModelAndView("Profile");
		model.addObject("msg","Invalid User Id or Password");
		
		}else {
			model=new ModelAndView("Home");
			request.getSession().setAttribute("id", result);
			
		}
		
		
		return model;
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("register")Register register) {
		ModelAndView model;
		model=new ModelAndView("Welcome");
		int result=service.register(register);
		if(result==1) {
			
			model.addObject("success","You Have SuccessFully Registered");
		}else {
			model.addObject("failure","Registration Failed... Please Try again");
		}
		return model;
	}
}
