package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.service.InstitutionService;
import pl.coderslab.charity.service.DonationService;

@Controller
public class InstitutionController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    @Autowired
    public InstitutionController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @GetMapping("/")
    public String listInstitutions(Model model) {
        model.addAttribute("institutions", institutionService.getAllInstitutions());

        return "index";

    }
}
