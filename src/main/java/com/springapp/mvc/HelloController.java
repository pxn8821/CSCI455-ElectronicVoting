package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!!");
		return "hello";
	}


    @RequestMapping(value="/user/testauth", method = RequestMethod.GET)
    public String printTestAuth(ModelMap model) {
        return "authed";
    }

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String printLogin(ModelMap model){
        return "login";
    }

    @RequestMapping(value="/signup", method = RequestMethod.GET)
    public String printSignUp(ModelMap model){
        return "signup";
    }
}