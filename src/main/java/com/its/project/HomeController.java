package com.its.project;

import com.its.project.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @Autowired
    BoardService boardService;

    @GetMapping("/")
    public String index(){
        boardService.findAll();
        return "index";
    }
}
