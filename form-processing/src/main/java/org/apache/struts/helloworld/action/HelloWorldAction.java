package org.apache.struts.helloworld.action;

import org.apache.struts.helloworld.model.MessageStore;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Spring MVC controller that responds to a user action by setting the value
 * of the Message model class and returns a view name.
 */
@Controller
@RequestMapping("/test")
public class HelloWorldAction {

    private static final AtomicInteger helloCount = new AtomicInteger(0);

    @GetMapping({"/index", ""})
    public String index() {
        return "index";
    }

    @GetMapping("/hello")
    public String hello(@RequestParam(required = false) String userName, Model model) {
        MessageStore messageStore = new MessageStore();

        if (userName != null) {
            messageStore.setMessage(messageStore.getMessage() + " " + userName);
        }

        model.addAttribute("messageStore", messageStore);
        model.addAttribute("helloCount", helloCount.incrementAndGet());
        return "HelloWorld";
    }
}

