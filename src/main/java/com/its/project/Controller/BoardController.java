package com.its.project.Controller;

import com.its.project.DTO.BoardDTO;
import com.its.project.DTO.ImageDTO;
import com.its.project.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/save")
    public String saveBoard(@ModelAttribute BoardDTO boardDTO,
                            Model model){
        BoardDTO id = boardService.saveBoard(boardDTO);
        model.addAttribute("updateDTO",id);
        return "/board/update";
    }

    @PostMapping("/update")
    public @ResponseBody BoardDTO updateBoard(@ModelAttribute BoardDTO boardDTO){
        boardService.update(boardDTO);
        BoardDTO updateDTO = boardService.findById(boardDTO.getB_id());
        return updateDTO;
    }

    @GetMapping("/myb")
    public String myb(HttpSession session,
                      @RequestParam("memberId") String memberId,
                      Model model){
        List<BoardDTO> boardList = boardService.findAllId(memberId);
        Map<Long ,List<ImageDTO>> listMap = new HashMap<>();
        System.out.println(boardList.size());
            System.out.println("첫번째 포문 들");
        for(int i = 0; boardList.size() > i;i++){
            System.out.println("첫 진행");
            List<ImageDTO> imageDTOList = boardService.imageTitle(boardList.get(i).getB_id());
            System.out.println(imageDTOList.size());
            System.out.println(i);
            System.out.println("두번째 포문들");
            for(int j = 0; 2 > j; j++){
                if(imageDTOList.size() < 2){
                    imageDTOList.add(null);
                }
                    System.out.println(j);
            }
            listMap.put(boardList.get(i).getB_id(), imageDTOList);
            System.out.println("둘 나옴");
        }
        System.out.println("나감");
        model.addAttribute("boardList", boardList);
        model.addAttribute("listMap", listMap);
        return "/board/myb";
    }

    @GetMapping("/update")
    public String update (@RequestParam("b_id") Long b_id,
                          Model model){
        BoardDTO updateDTO = boardService.findById(b_id);
        model.addAttribute("updateDTO", updateDTO);
        return "/board/update";
    }

    @PostMapping("/save-image")
    public String saveImage(@RequestParam("file") List<MultipartFile> file, @RequestParam("b_id") Long b_id) throws IOException {
        System.out.println("BoardController.saveImage");
        boardService.saveImage(file, b_id);
        return "redirect:/board/update?b_id=" + b_id;
    }
}
