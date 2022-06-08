package com.its.project.Controller;

import com.its.project.DTO.BoardDTO;
import com.its.project.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    @PostMapping("/update")
    public @ResponseBody BoardDTO updateBoard(@ModelAttribute BoardDTO boardDTO){
        boardService.update(boardDTO);
        BoardDTO updateDTO = boardService.findById(boardDTO.getB_id());
        return updateDTO;
    }

    @GetMapping("/myb")
    public String myb(HttpSession session,
                      @RequestParam("m_id") Long m_id){
        List<BoardDTO> boardList = boardService.findAllId(m_id);
        return "/board/myb";
    }
}
