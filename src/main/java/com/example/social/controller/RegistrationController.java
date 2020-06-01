package com.example.social.controller;

import com.example.social.domain.User;
import com.example.social.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;
@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("password2") String passwordConfirm,
            @Valid User user,
            BindingResult bindingResult,
            Model model) {

        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);
        boolean isPasswordDifferent = user.getPassword() != null && !user.getPassword().equals(passwordConfirm);

        if(isPasswordDifferent){
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if(isConfirmEmpty){
            model.addAttribute("password2Error", "Пароль не может быть пустым");
        }

        if(user.getPassword() != null && !user.getPassword().equals(passwordConfirm)){
            model.addAttribute("passwordError", "Пароли должны совпадать");
        }

        if(isConfirmEmpty || bindingResult.hasErrors() || isPasswordDifferent){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";

        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует!");
            return "registration";
        }

        return "login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Пользователь успешно активирован");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Код активации неверен!");
        }
        return "login";
    }
}