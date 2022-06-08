package com.its.project.Repository;

import com.its.project.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {
    @Autowired
    SqlSessionTemplate sql;

    public BoardDTO saveBoard(BoardDTO boardDTO) {
        Long id = Long.valueOf(sql.insert("Board.save", boardDTO));
        System.out.println(boardDTO);
        return boardDTO;
    }
}
