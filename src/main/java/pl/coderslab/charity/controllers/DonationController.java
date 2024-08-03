package pl.coderslab.charity.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.service.CategoryService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DonationController {
    private static final Logger logger = LoggerFactory.getLogger(DonationController.class);

    private final CategoryService categoryService;

    @Autowired
    public DonationController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/form")
    public String showForm(Model model){
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "form"; // Ensure this corresponds to the correct JSP file
    }

    @GetMapping("/perform")
    public String performShowForm(HttpServletRequest request){
        logger.info("searched product: {}", request.getParameter("product"));
        return "perform"; // Ensure this corresponds to the correct JSP file
    }
}
