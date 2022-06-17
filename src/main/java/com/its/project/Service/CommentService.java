package com.its.project.Service;

import com.its.project.DTO.CommentDTO;
import com.its.project.DTO.ImageDTO;
import com.its.project.Repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService {

    @Autowired
    CommentRepository commentRepository;
    public List<CommentDTO> findAll(Long b_id) {
        try{
            List<CommentDTO> commentList = commentRepository.findAll(b_id);
            return commentList;
        }
        catch (NullPointerException e){
            return null;
        }
    }

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public void delete(Long c_id) {
        commentRepository.delete(c_id);
    }

    public void update(CommentDTO commentDTO) {
        commentRepository.update(commentDTO);
    }
}
