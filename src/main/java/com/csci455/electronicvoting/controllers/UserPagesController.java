package com.csci455.electronicvoting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.sql.DataSource;
import java.util.Date;
import java.sql.Types;
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

    @RequestMapping(value="/user/castvote/{electionid}/{choice}", method = RequestMethod.GET)
    public String submitVote( final RedirectAttributes redirectAttributes,
                              @PathVariable int electionid,
                              @PathVariable int choice){
        if(choice != 1 && choice !=2){
            redirectAttributes.addFlashAttribute("message", "error");
            return "redirect:/user/dashboard";
        }
        if(hasUserVoted(electionid)){
            redirectAttributes.addFlashAttribute("message", "error");
            return "redirect:/user/dashboard";
        }

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        // Get the election
        List<Map<String, Object>> electionResults = jdbcTemplate.queryForList("SELECT * FROM elections WHERE election_id = ?", electionid);
        if(electionResults.size() != 1){
            redirectAttributes.addFlashAttribute("message", "error");
            return "redirect:/user/dashboard";
        }
        Map<String, Object> election = electionResults.get(0);

        // Insert vote
        jdbcTemplate.update("INSERT INTO elections_votes (user_id, election_id, date) VALUES (?, ?, ?)",
                getUserId(),
                election.get("election_id"),
                new Date());

        int votes1 = 0;
        int votes2 = 0;
        int totalVotes = 0;
        try {
            totalVotes = Integer.parseInt(election.get("election_totalvotes").toString());
            votes1 = Integer.parseInt(election.get("election_votes1").toString());
            votes2 = Integer.parseInt(election.get("election_votes2").toString());

            // Update election
            if (choice == 1) {
                jdbcTemplate.update("UPDATE elections SET election_totalvotes = ?, election_votes1 = ? WHERE election_id = ?",
                        totalVotes + 1, votes1 + 1, election.get("election_id"));

            } else if (choice == 2) {
                jdbcTemplate.update("UPDATE elections SET election_totalvotes = ?, election_votes2 = ? WHERE election_id = ?",
                        totalVotes + 1, votes2 + 1, election.get("election_id"));
            }
        } catch(NumberFormatException e){
            redirectAttributes.addFlashAttribute("message", "error");
        }

        // ** All the stuff below is verification that the vote has been logged **//

        // Check that the user has voted
        if(!hasUserVoted(electionid)){
            redirectAttributes.addFlashAttribute("message", "error");
            return "redirect:/user/dashboard";
        }

        // Check that the vote count increased
        election = jdbcTemplate.queryForList("SELECT * FROM elections WHERE election_id = ?", electionid).get(0);
        int newtotalVotes = Integer.parseInt(election.get("election_totalvotes").toString());
        int newvotes1 = Integer.parseInt(election.get("election_votes1").toString());
        int newvotes2 = Integer.parseInt(election.get("election_votes2").toString());

        if(choice == 1){
            if( (votes1 + 1) != newvotes1){
                redirectAttributes.addFlashAttribute("message", "error");
                return "redirect:/user/dashboard";
            }
        } else if(choice == 2){
            if( (votes2 + 1) != newvotes2){
                redirectAttributes.addFlashAttribute("message", "error");
                return "redirect:/user/dashboard";
            }
        }

        if( (totalVotes + 1) != newtotalVotes){
            redirectAttributes.addFlashAttribute("message", "error");
            return "redirect:/user/dashboard";
        }

        redirectAttributes.addFlashAttribute("message", "success");
        return "redirect:/user/dashboard";

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
