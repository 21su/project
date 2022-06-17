package com.its.project.Controller;

import com.its.project.DTO.CommentDTO;
import com.its.project.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentService commentService;

    @PostMapping("/comment-save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO);
        List<CommentDTO> updateList = commentService.findAll(commentDTO.getB_id());
        return updateList;
    }

    @GetMapping("/comment-delete")
    public String delete(@ModelAttribute CommentDTO commentDTO){
        commentService.delete(commentDTO.getC_id());
        return "redirect:/board/comment?b_id=" + commentDTO.getB_id();
    }

    @GetMapping("/update")
    public String update(@ModelAttribute CommentDTO commentDTO){
        commentService.update(commentDTO);
        return "redirect:/board/comment?b_id=" + commentDTO.getB_id();
    }
}
