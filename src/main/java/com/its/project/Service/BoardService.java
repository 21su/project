package com.its.project.Service;

import com.its.project.DTO.BoardDTO;
import com.its.project.DTO.ImageDTO;
import com.its.project.DTO.PageDTO;
import com.its.project.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;


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

    public void deleteBoard(Long b_id) {
        boardRepository.deleteBoard(b_id);
    }

    public void imageDelete(Long i_id) {
        boardRepository.imageDelete(i_id);
    }

    public void imageName(ImageDTO imageDTO) {
        boardRepository.imageName(imageDTO);
    }

    public void imageUpdate(ImageDTO imageDTO) throws IOException {
        MultipartFile imageProfile = imageDTO.getFile();
        String imageProfileName = imageProfile.getOriginalFilename();
        imageDTO.setImageName(imageProfileName);
        imageProfileName = System.currentTimeMillis() + "-" + imageProfileName;
        imageDTO.setImageManageName(imageProfileName);
        String savePath = "D:\\spring_img\\" + imageProfileName;
        if (!imageProfile.isEmpty()){
            imageProfile.transferTo((new File(savePath)));
        }
        boardRepository.imageUpdate(imageDTO);
    }

    public ImageDTO imageById(Long i_id) {
        return boardRepository.imageById(i_id);
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public Map<Integer, String> round(Long b_id) {
        int num = 0;
        try {
            num = boardRepository.roundCheck(b_id);
        }
        catch (NullPointerException e){
            num = 0;
        }
        Map<Integer ,String> roundMap = new HashMap<>();
        if(num == 0){
            roundMap.put(0,"");
        }
        if(num > 4){
            roundMap.put(4, "4강");
            if(num >= 8){
                roundMap.put(8, "8강");
                if(num >= 16){
                    roundMap.put(16,"16강");
                    if(num >= 32){
                        roundMap.put(32, "32강");
                        if (num >= 64){
                            roundMap.put(64,"64강");
                        }
                    }
                }
            }
        }
        return roundMap;
    }

    public int roundCount(Long b_id) {
        try {
            return boardRepository.roundCheck(b_id);
        }catch (NullPointerException e){
            return 0;
        }
    }

    public List<ImageDTO> imgSetting(Long b_id, int round) {
        List<ImageDTO> allImage = boardRepository.imageId(b_id);
        List<ImageDTO> img = new ArrayList<>();
        for(int i = 0; i < round; i++){
            int random = (int)(Math.random()*10000);
            int randomI = random % allImage.size();
            img.add(allImage.get(randomI));
            allImage.remove(randomI);
        }
        return img;
    }

    public void view(Long b_id) {
        boardRepository.view(b_id);
    }

    public void win(Long i_id, Long b_id) {
        boardRepository.win(i_id,b_id);
    }

    private static final int PAGE_LIMIT = 4;
    private static final int BLOCK_LIMIT = 5;

    public List<ImageDTO> rank(Long b_id,int page) {
        try {
            int pagingStart = (page-1) * PAGE_LIMIT;
            ImageDTO imageDTO = new ImageDTO();
            imageDTO.setB_id(b_id);
            imageDTO.setStart(pagingStart);
            imageDTO.setLimit(PAGE_LIMIT);
            return boardRepository.rank(imageDTO);
        }catch (NullPointerException e){
            return null;
        }
    }

    public PageDTO paging(int page,Long b_id) {
        // 글 갯수 조회
        int boardCount = boardRepository.imageCount(b_id);
        // 필요한 전체 페이지 갯수
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        // 시작페이지 1 4 7 10 ...
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12 ...
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public PageDTO paging(int page) {
        return null;
    }
}
