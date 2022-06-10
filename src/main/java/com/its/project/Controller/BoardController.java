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
        System.out.println(boardDTO);
        BoardDTO id = boardService.saveBoard(boardDTO);
        model.addAttribute("updateDTO",id);
        return "/board/update";
    }

    @PostMapping("/update")
    public @ResponseBody BoardDTO updateBoard(@ModelAttribute BoardDTO boardDTO){
        BoardDTO updateDTO = new BoardDTO();
        if (boardDTO.getB_id() == null){
            updateDTO = boardService.saveBoard(boardDTO);
        }
        else{
            boardService.update(boardDTO);
            updateDTO = boardService.findById(boardDTO.getB_id());
        }
        return updateDTO;
    }


    @GetMapping("/update")
    public String update (@RequestParam("b_id") Long b_id,
                          Model model){
        BoardDTO updateDTO = boardService.findById(b_id);
        model.addAttribute("updateDTO", updateDTO);
        return "/board/update";
    }

    @GetMapping("/update2")
    public String update2 (@RequestParam("b_id") Long b_id,
                          Model model){
        BoardDTO updateDTO = boardService.findById(b_id);
        List<ImageDTO> imageList = boardService.imageId(b_id);
        model.addAttribute("updateDTO", updateDTO);
        model.addAttribute("imageList", imageList);
        return "/board/update2";
    }


    @PostMapping("/save-image")
    public String saveImage(@RequestParam("file") List<MultipartFile> file, @RequestParam("b_id") Long b_id) throws IOException {
        System.out.println("BoardController.saveImage");
        boardService.saveImage(file, b_id);
        return "redirect:/board/update?b_id=" + b_id;
    }
    @GetMapping("/myb")
    public String myb(HttpSession session,
                      @RequestParam("memberId") String memberId,
                      Model model){
        List<BoardDTO> boardList = boardService.findAllId(memberId);
        Map<Long ,List<ImageDTO>> listMap = new HashMap<>();
        for(int i = 0; boardList.size() > i;i++){
            List<ImageDTO> imageDTOList = boardService.imageTitle(boardList.get(i).getB_id());
            for(int j = 0; 2 > j; j++){
                if(imageDTOList.size() < 2){
                    imageDTOList.add(null);
                }
            }
            listMap.put(boardList.get(i).getB_id(), imageDTOList);
        }
        model.addAttribute("boardList", boardList);
        model.addAttribute("listMap", listMap);
        model.addAttribute("memberId",memberId);
        return "/board/myb";
    }

    @GetMapping("/delete-board")
    public String deleteBoard(@RequestParam("b_id") Long b_id,
                              @RequestParam("memberId") String memberId){
        boardService.deleteBoard(b_id);
        return "redirect:/board/myb?memberId=" + memberId;
    }

    @GetMapping("/image-delete")
    public String imageDelete(@RequestParam("i_id") Long i_id,
                              @RequestParam("b_id") Long b_id){
        boardService.imageDelete(i_id);
        return "redirect:/board/update2?b_id=" + b_id;
    }
}
