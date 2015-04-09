package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by phil on 4/8/15.
 */
@Controller
public class UserPagesController {
    @RequestMapping(value="/user/dashboard", method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        return "dashboard";
    }

}
