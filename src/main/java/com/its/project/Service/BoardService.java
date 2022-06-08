package com.its.project.Service;

import com.its.project.DTO.BoardDTO;
import com.its.project.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    public void findAll() {

    }

    public BoardDTO saveBoard(BoardDTO boardDTO) {
        return boardRepository.saveBoard(boardDTO);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public BoardDTO findById(Long b_id) {
        return boardRepository.findById(b_id);
    }

    public List<BoardDTO> findAllId(Long m_id) {
        return boardRepository.findAllId(m_id);
    }
}
