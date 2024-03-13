package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.DonationRepository;

import java.util.List;

@Service
public class DonationService {

    @Autowired
    private DonationRepository donationRepository;

    public List<Donation> getAllDonations() {
        return donationRepository.findAll();
    }

    public int getTotalBags() {
        List<Donation> donations = donationRepository.findAll();
        int totalBags = 0;
        for (Donation donation : donations) {
            totalBags += donation.getQuantity();
        }
        return totalBags;
    }
}
