package com.its.project.Repository;

import com.its.project.DTO.BoardDTO;
import com.its.project.DTO.ImageDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    SqlSessionTemplate sql;

    public BoardDTO saveBoard(BoardDTO boardDTO) {
        Long id = Long.valueOf(sql.insert("Board.save", boardDTO));
        return boardDTO;
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public BoardDTO findById(Long b_id) {
        return sql.selectOne("Board.findById", b_id);
    }

    public List<BoardDTO> findAllId(String memberId) {
        return sql.selectList("Board.findAllId", memberId);
    }

    public void saveImage(ImageDTO imageDTO) {
        Long id = Long.valueOf(sql.insert("Image.save", imageDTO));
    }

    public List<ImageDTO> imageId(Long b_id) {
        return sql.selectList("Image.findById", b_id);
    }

    public List<ImageDTO> imageTitle(Long b_id) {
        return sql.selectList("Image.findTitle", b_id);
    }

    public void deleteBoard(Long b_id) {
        sql.delete("Board.delete-board",b_id);
    }

    public void imageDelete(Long i_id) {
        sql.delete("Image.delete",i_id);
    }
}
