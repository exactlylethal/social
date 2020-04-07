package com.example.social.controller;

import com.example.social.domain.Answer;
import com.example.social.domain.Poll;
import com.example.social.domain.User;
import com.example.social.domain.Vote;
import com.example.social.repo.MessageRepo;
import com.example.social.repo.PollRepo;
import com.example.social.repo.VoteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private PollRepo pollRepo;

    @GetMapping("/")
    public String every(Map<String, Object> model){
        return "greeting";
    }

    @GetMapping("/greeting")
    public String greeting(Map<String, Object> model, User user) {
        return "main";
    }

    @GetMapping("/pollCreate")
    public String poll(Map<String, Object> model) {
        return "pollCreate";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Poll> polls = pollRepo.findAll();
        if (filter != null && !filter.isEmpty()) {
            polls = pollRepo.findByName(filter);
        } else {
            polls = pollRepo.findAll();
        }
        model.addAttribute("polls", polls);
        model.addAttribute("filter", filter);
        return "main";
    }

    @GetMapping("/showPoll")
    private String showPoll(@AuthenticationPrincipal User user,
                            @RequestParam("poll_id") Long pollId,
                            Map<String, Object> model) {
        model.put("pollId", pollId);
        Poll poll = pollRepo.findById(pollId).orElseThrow(() -> new RuntimeException("Poll id not found" + pollId));
        model.put("poll", poll);
        boolean showButton = false;
        int size = messageRepo.findByAuthorIdAndPollId(user.getId(), pollId).size();
        if (size == 0) {
            showButton = true;
        }
        model.put("showButton", showButton);
            return "individualPoll";
        }

    @PostMapping("/pollCreate")
    public String add(@AuthenticationPrincipal User user,
                      Poll poll,
            BindingResult bindingResult,
            Model model
    ) throws IOException {
        poll.setAuthor(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("poll", poll);
        } else {
            Poll newPoll = pollRepo.save(poll);
            model.addAttribute("poll", newPoll);
        }
        return "redirect:/main";
    }

    @GetMapping("/question")
    public String question(@RequestParam("poll_id") Long pollId,
                           Map<String, Object> model) {
        model.put("poll_id", pollId);
        return "question";
    }

    @PostMapping("/question")
    public String addQuestion(@AuthenticationPrincipal User user,
                              @Valid Answer answer,
                              BindingResult bindingResult,
                              Model model,
                              @RequestParam Map<String, String> reqParam) {
        answer.setAuthor(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message", answer);
        }
        Long poll_id = Long.parseLong(reqParam.get("poll_id"));
        Poll poll = pollRepo.findById(poll_id).orElseThrow(()-> new RuntimeException("Poll id not found" + poll_id));
        answer.setPoll(poll);
        poll.getAnswers().add(answer);
        Poll newPoll = pollRepo.save(poll);
        model.addAttribute("poll", newPoll);

        return "individualPoll";
    }
}

