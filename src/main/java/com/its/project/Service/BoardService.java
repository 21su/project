package com.its.project.Service;

import com.its.project.DTO.BoardDTO;
import com.its.project.DTO.ImageDTO;
import com.its.project.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

    public List<BoardDTO> findAllId(String memberId) {
        return boardRepository.findAllId(memberId);
    }

    public void saveImage(List<MultipartFile> multipartFiles, Long b_id) throws IOException {
        System.out.println("BoardService.saveImage");
        List<ImageDTO> imageList = new ArrayList<>();
        for(MultipartFile multipartFile : multipartFiles){
            MultipartFile boardFile = multipartFile;
            String boardFileName = boardFile.getOriginalFilename();
            String boardFileName2 = boardFile.getOriginalFilename();
            boardFileName = System.currentTimeMillis() + "-" + boardFileName;
            ImageDTO imageDTO = new ImageDTO();
            imageDTO.setB_id(b_id);
            imageDTO.setImageManageName(boardFileName);
            imageDTO.setImageName(boardFileName2);
            String savePath = "D:\\spring_img\\" + boardFileName;
            if (!boardFile.isEmpty()){
                boardFile.transferTo((new File(savePath)));
            }
            boardRepository.saveImage(imageDTO);
        }
    }

    public List<ImageDTO> imageId(Long b_id) {
        return boardRepository.imageId(b_id);
    }

    public List<ImageDTO> imageTitle(Long b_id) {
        return boardRepository.imageTitle(b_id);
    }
}
