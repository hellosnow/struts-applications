package org.apache.struts.register.action;

import org.apache.struts.register.model.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/test")
public class Register {

    @GetMapping("/register")
    public String showForm(Model model) {
        model.addAttribute("personBean", new Person());
        return "register";
    }

    @PostMapping("/register-submit")
    public String submit(@ModelAttribute("personBean") Person personBean,
                         @RequestParam(value = "options", required = false) List<Integer> options,
                         Model model) {
        model.addAttribute("personBean", personBean);
        model.addAttribute("options", options);
        return "thankyou";
    }

    @GetMapping("/register-cancel")
    public String cancel() {
        return "redirect:/test/index";
    }
}

