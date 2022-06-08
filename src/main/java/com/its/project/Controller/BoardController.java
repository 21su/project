package com.its.project.Controller;

import com.its.project.DTO.BoardDTO;
import com.its.project.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/save")
    public String saveBoard(@ModelAttribute BoardDTO boardDTO,
                            Model model){
        BoardDTO id = boardService.saveBoard(boardDTO);
        model.addAttribute("updateDTO",id);
        return "/board/update";
    }

}
