package pl.coderslab.charity.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DonationController {
    private static final Logger logger = LoggerFactory.getLogger(DonationController.class);

    @GetMapping("/form")
    public String showForm(){
        return "/form";
    }

    @GetMapping("/perform")
    public String performShowForm(HttpServletRequest request){
        // logger.info("searched product: {}", request.getParameter("product"));
        return "/perform";
    }
}
