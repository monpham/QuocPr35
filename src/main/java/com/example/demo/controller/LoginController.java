package com.example.demo.controller;

import com.example.demo.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.demo.entity.UserEntity;

import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("email")
public class LoginController {

    @RequestMapping("/logout")
    public String getLogOut() {
        return "logout";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("account", new UserEntity());
        return "login";
    }

}
