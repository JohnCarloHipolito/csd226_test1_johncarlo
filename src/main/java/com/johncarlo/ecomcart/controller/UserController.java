package com.johncarlo.ecomcart.controller;

import com.johncarlo.ecomcart.model.User;
import com.johncarlo.ecomcart.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/user/signup")
    public String signup(Model model) {
        model.addAttribute("user", new User());
        return "signup";
    }

    @PostMapping("/user/signup")
    public String signup(@ModelAttribute User user, Model model) {
        String error = userService.signupUser(user);
        if (error != null) {
            model.addAttribute("user", user);
            model.addAttribute("error", error);
            return "signup";
        } else {
            return "redirect:/user/login";
        }
    }

    @GetMapping("/user/login")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/user/login")
    public String login(@ModelAttribute User user, HttpSession httpSession, Model model) {
        User validUser = userService.loginUser(user);
        if (validUser == null) {
            model.addAttribute("user", user);
            model.addAttribute("error", true);
            return "login";
        } else {
            httpSession.setAttribute("user", validUser);
            return "redirect:/";
        }
    }

    @PostMapping("/user/logout")
    public String logoutPost(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        httpSession.removeAttribute("order");
        httpSession.removeAttribute("orders");
        return "redirect:/";
    }

    @GetMapping("/user/logout")
    public String logoutGet(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        return "redirect:/user/login";
    }

}
