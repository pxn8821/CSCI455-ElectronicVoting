package com.csci455.electronicvoting.controllers;

import java.sql.PreparedStatement;

import com.csci455.electronicvoting.components.Voting;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
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


    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String printLogin(ModelMap model){
        return "login";
    }

    @RequestMapping(value="/login-failed", method = RequestMethod.GET)
    public String printLoginFailed(final RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("message", "failedlogin");
        return "redirect:login";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutAction(final RedirectAttributes redirectAttributes){
        return "redirect:/";
    }

    @RequestMapping(value="/signup", method = RequestMethod.GET)
    public String printSignUp(ModelMap model){
        return "signup";
    }


    @RequestMapping(value="/signup-go", method = RequestMethod.POST)
    public String submitSignup(final RedirectAttributes redirectAttributes,
                               @RequestParam("username") final String username,
                               @RequestParam("password1") final String password1,
                               @RequestParam("password2") final String password2){

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

        final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        // Insert the user
        final String sql = "INSERT into users (username, password, active) VALUES (?, ?, 1)";


        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(
                new PreparedStatementCreator() {
                    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                        PreparedStatement pst =
                                con.prepareStatement(sql, new String[] {"user_id"});
                        pst.setString(1, username);
                        pst.setString(2, encoder.encode(password1));
                        return pst;
                    }
                },
                keyHolder);

        int newUserID = keyHolder.getKey().intValue();
        String roleSQL = "INSERT INTO user_roles (authority, user_id) VALUES ('ROLE_USER', ?)";

        // Insert the user role
        jdbcTemplate.update(roleSQL,
                newUserID);

        redirectAttributes.addFlashAttribute("message", "registrationsuccess");
        return "redirect:login";

    }

}