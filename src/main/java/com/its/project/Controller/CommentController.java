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
    public String delete(@RequestParam("c_id") Long c_id,
                         @RequestParam("b_id") Long b_id){
        commentService.delete(c_id);
        return "redirect:/board/comment?b_id=" + b_id;
    }

    @GetMapping("/update")
    public String update(@RequestParam("commentContents") String commentContents,
                         @RequestParam("c_id") Long c_id,
                         @RequestParam("b_id") Long b_id){
        commentService.update(c_id,commentContents);
        return "redirect:/board/comment?b_id=" + b_id;
    }
}
