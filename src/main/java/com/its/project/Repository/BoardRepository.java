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

    public void imageName(ImageDTO imageDTO) {
        sql.update("Image.name",imageDTO);
    }

    public void imageUpdate(ImageDTO imageDTO) {
        sql.update("Image.update",imageDTO);
    }

    public ImageDTO imageById(Long i_id) {
        ImageDTO imageDTO = sql.selectOne("Image.image-id",i_id);
        return imageDTO;
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public int roundCheck(Long b_id) {
        int num =  sql.selectOne("Board.round", b_id);
        return num;
    }

    public void view(Long b_id) {
        sql.update("Board.view", b_id);
    }

    public void win(Long i_id, Long b_id) {
        ImageDTO imageDTO = new ImageDTO();
        imageDTO.setI_id(i_id);
        imageDTO.setB_id(b_id);
        sql.insert("Image.win", imageDTO);
    }

    public List<ImageDTO> rank(ImageDTO imageDTO) {
        return sql.selectList("Image.rank", imageDTO);//해야됨
    }

    public int imageCount(Long b_id) {
        return sql.selectOne("Image.count", b_id);
    }
}
