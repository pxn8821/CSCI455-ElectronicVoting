package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LandingPagesController {

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
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

    @RequestMapping(value="/login-failed", method = RequestMethod.GET)
    public String printLoginFailed(final RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("message", "failedlogin");
        return "redirect:login";
    }

    @RequestMapping(value="/signup", method = RequestMethod.GET)
    public String printSignUp(ModelMap model){
        return "signup";
    }
}