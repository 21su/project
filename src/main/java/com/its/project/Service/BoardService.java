package com.its.project.Service;

import com.its.project.DTO.BoardDTO;
import com.its.project.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    public void findAll() {

    }

    public BoardDTO saveBoard(BoardDTO boardDTO) {
        return boardRepository.saveBoard(boardDTO);
    }
}
