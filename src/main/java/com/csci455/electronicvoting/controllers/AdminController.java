package com.csci455.electronicvoting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

/**
 * Created by phil on 4/8/15.
 */

@Controller
public class AdminController {
    @Autowired
    DataSource dataSource;

    @RequestMapping(value="/admin", method = RequestMethod.GET)
    public String dashboardAction(ModelMap model) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        List<Map<String, Object>> results = jdbcTemplate.queryForList("SELECT * FROM elections");
        model.addAttribute("elections", results);

        return "admin-dashboard";
    }

    @RequestMapping(value="/admin/add", method = RequestMethod.GET)
    public String addAction(ModelMap model) {
        return "admin-addelection";
    }


    @RequestMapping(value="/admin/delete/{id}", method = RequestMethod.GET)
    public String deleteSubmit(ModelMap model, @PathVariable int id) {
        String sql = "DELETE FROM elections WHERE election_id = ?";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql,
                id);

        sql = "DELECT FROM elections_votes WHERE election_id = ?";
        jdbcTemplate.update(sql,
                id);

        return "admin-dashboard";
    }

    @RequestMapping(value="/admin/add", method = RequestMethod.POST)
    public String addSubmitAction(final RedirectAttributes redirectAttributes,
                                  @RequestParam("electionName") final String electionName,
                                  @RequestParam("electionChoice1") final String choice1,
                                  @RequestParam("electionChoice2") final String choice2) {

        String sql = "INSERT INTO elections (election_name, election_choice1, election_choice2) VALUES (?, ?, ?)";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql,
                electionName,
                choice1,
                choice2);

        return "redirect:/admin";
    }
}
