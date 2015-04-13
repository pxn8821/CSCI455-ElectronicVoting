package com.csci455.electronicvoting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by phil on 4/8/15.
 */
@Controller
public class UserPagesController {

    @Autowired
    DataSource dataSource;

    @RequestMapping(value="/user/dashboard", method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {

        model.addAttribute("votedElections", getElectionVoted());
        model.addAttribute("novoteElections", getElectionsNotVoted());
        return "dashboard";
    }


    public List<Map<String, Object>> getElectionsNotVoted(){
        String sql = "SELECT * FROM elections";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        List<Map<String, Object>> results = jdbcTemplate.queryForList(sql);
        List<Map<String, Object>> returnResults = new ArrayList<Map<String, Object>>();
        for(Map<String, Object> i : results){
            if(!hasUserVoted( Integer.parseInt(i.get("election_id").toString()))){
                returnResults.add(i);
            }
        }

        return returnResults;

    }

    public boolean hasUserVoted(int electionID){
        String sql = "SELECT * FROM elections_votes WHERE election_id = ? AND user_id = ?";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, electionID, getUserId());

        System.out.println(results.size());
        if(results.size() == 0){
            return false;
        } else {
            return true;
        }


    }

    public List<Map<String, Object>> getElectionVoted(){
        String sql = "SELECT * FROM elections RIGHT JOIN elections_votes " +
                "ON elections_votes.election_id = elections.election_id " +
                "WHERE user_id = ?";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, getUserId());

        return results;
    }
    public int getUserId(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        String sql = "SELECT * FROM users WHERE username = ?";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, name);
        if(results.size() == 1) {
            return Integer.parseInt(results.get(0).get("user_id").toString());
        } else {
            return -1;
        }
    }
}
