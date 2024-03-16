package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    public HomeController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @GetMapping("/")
    public String home(Model model) {
        // Obsługa logiki potrzebnej na stronie głównej
        // Pobranie instytucji
        List<Institution> institutions = institutionService.getAllInstitutions();
        model.addAttribute("institutions", institutions);
        // Obliczenie sumy worków
        int totalBags = donationService.getTotalBags();
        model.addAttribute("totalBags", totalBags);
        // Ilość darów
        int numberDonations = donationService.getTotalDonations();
        model.addAttribute("totalDonations", numberDonations);
        return "index"; // lub nazwa widoku, który chcesz zwrócić
    }
}

