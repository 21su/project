package com.its.project.Repository;

import com.its.project.DTO.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {

    @Autowired
    SqlSessionTemplate sql;

    public List<CommentDTO> findAll(Long b_id) {
        return sql.selectList("Comment.findAll",b_id);
    }

    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    public void delete(Long c_id) {
        sql.delete("Comment.delete", c_id);
    }

    public void update(CommentDTO commentDTO) {
        sql.update("Comment.update", commentDTO);
    }
}
