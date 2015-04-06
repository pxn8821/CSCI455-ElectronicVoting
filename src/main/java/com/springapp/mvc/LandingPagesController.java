package com.springapp.mvc;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LandingPagesController {

    @Autowired
    DataSource dataSource;

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


    @RequestMapping(value="/signup-go", method = RequestMethod.POST)
    public String submitSignup(final RedirectAttributes redirectAttributes,
                               @RequestParam("username") String username,
                               @RequestParam("password1") String password1,
                               @RequestParam("password2") String password2){

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        // Check for email address correct-ness
        if(!EmailValidator.getInstance().isValid(username)){
            redirectAttributes.addFlashAttribute("message", "notemail");
            return "redirect:signup";
        }

        // Check for password exists
        if(password1 == null || password1.equals("")){
            redirectAttributes.addFlashAttribute("message", "nopassword");
            return "redirect:signup";
        }

        // Check for duplicate usernames
        List<Map<String, Object>> results = jdbcTemplate.queryForList("SELECT * FROM users WHERE username = ?", username);
        if(results.size() != 0){
            redirectAttributes.addFlashAttribute("message", "emailexists");
            return "redirect:signup";
        }

        // Check for the same password
        if(!(password1.equals(password2))){
            redirectAttributes.addFlashAttribute("message", "passwordsnotequal");
            return "redirect:signup";
        }

        // Insert the user
        String sql = "INSERT into users (username, password, active) VALUES (?, ?, 1)";

        jdbcTemplate.update(sql,
                username,
                password1);


        redirectAttributes.addFlashAttribute("message", "registrationsuccess");
        return "redirect:login";

    }

}