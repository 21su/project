package com.its.project.Controller;

import com.its.project.DTO.BoardDTO;
import com.its.project.DTO.ImageDTO;
import com.its.project.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
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
                      @RequestParam("memberId") String memberId,
                      Model model){
        List<BoardDTO> boardList = boardService.findAllId(memberId);
        model.addAttribute("boardList", boardList);
        return "/board/myb";
    }

    @GetMapping("/update")
    public String update (@RequestParam("b_id") Long b_id,
                          Model model){
        BoardDTO updateDTO = boardService.findById(b_id);
        model.addAttribute("updateDTO", updateDTO);
        return "/board/update";
    }

    @PostMapping("/save-image")
    public String saveImage(@RequestParam("file") List<MultipartFile> file, @RequestParam("b_id") Long b_id) throws IOException {
        System.out.println("BoardController.saveImage");
        boardService.saveImage(file, b_id);
        return "redirect:/board/update?b_id=" + b_id;
    }
}
