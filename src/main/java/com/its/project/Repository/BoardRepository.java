package com.its.project.Repository;

import com.its.project.DTO.BoardDTO;
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
        System.out.println(boardDTO);
        return boardDTO;
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public BoardDTO findById(Long b_id) {
        return sql.selectOne("Board.findById", b_id);
    }

    public List<BoardDTO> findAllId(Long m_id) {
    }
}
