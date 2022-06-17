package com.its.project.Controller;

import com.its.project.DTO.BoardDTO;
import com.its.project.DTO.CommentDTO;
import com.its.project.DTO.ImageDTO;
import com.its.project.DTO.PageDTO;
import com.its.project.Service.BoardService;
import com.its.project.Service.CommentService;
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
    @Autowired
    CommentService commentService;

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
    public String myb(@RequestParam("memberId") String memberId,
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

    @GetMapping("/board-delete")
    public String boardDelete(@RequestParam("b_id") Long b_id) {
        boardService.deleteBoard(b_id);
        return "redirect:/";
    }

    @GetMapping("/image-delete")
    public String imageDelete(@RequestParam("i_id") Long i_id,
                              @RequestParam("b_id") Long b_id){
        boardService.imageDelete(i_id);
        return "redirect:/board/update2?b_id=" + b_id;
    }

    @PostMapping("/image-name")
    public @ResponseBody ImageDTO imageName(@ModelAttribute ImageDTO imageDTO){
        boardService.imageName(imageDTO);
        return imageDTO;
    }

    @PostMapping("/image-update")
    public @ResponseBody ImageDTO imageUpdate(@ModelAttribute ImageDTO imageDTO) throws IOException {
        boardService.imageUpdate(imageDTO);
        ImageDTO imageDTO1 = boardService.imageById(imageDTO.getI_id());
        return imageDTO1;
    }

    @GetMapping("/select")
    public String select(@RequestParam("b_id") Long b_id,
                         Model model){
        BoardDTO boardDTO = boardService.findById(b_id);
        Map<Integer, String> roundMap = boardService.round(b_id);
        int num = boardService.roundCount(b_id);
        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("roundMap", roundMap);
        model.addAttribute("num", num);
        if (num < 4){
            return "redirect:/";
        }else {
            return "/board/select";
        }
    }
    @GetMapping("/main")
    public String main(@RequestParam("round") int round,
                       @RequestParam("b_id") Long b_id,
                       @RequestParam(value = "img1", required = false, defaultValue = "") List<Long> img1,
                       Model model){
        List<ImageDTO> img = new ArrayList<>();
        BoardDTO boardDTO = boardService.findById(b_id);
        model.addAttribute("boardDTO", boardDTO);
        if(round == 1){
            boardService.view(b_id);
            boardService.win(img1.get(0),b_id);
            return "redirect:/board/comment?i_id="+img1.get(0)+"&b_id="+b_id;
        }
        if(img1.size() == 0){
            img = boardService.imgSetting(b_id,round);
        }
        else{
            for(int i = 0; i < img1.size(); i++){
                img.add(boardService.imageById(img1.get(i)));
            }
        }
        List<ImageDTO> list1 = new ArrayList<>();
        List<ImageDTO> list2 = new ArrayList<>();
        for(int i = 0; i < round; i++) {
            int random = (int) (Math.random() * 1000);
            int random1 = random % img.size();
            if(i % 2 == 0){
                list1.add(img.get(random1));
                img.remove(random1);
            }
            else if(i % 2 != 0){
                list2.add(img.get(random1));
                img.remove(random1);
            }
        }
        int round2 = round/2;
        model.addAttribute("round2", round2);
        model.addAttribute("list1",list1);
        model.addAttribute("list2",list2);
        model.addAttribute("round",round);
        return "/board/main";
    }
    @GetMapping("/comment")
    public String comment(@RequestParam(value = "i_id", required = false, defaultValue = "0")Long i_id,
                          @RequestParam("b_id")Long b_id,
                          @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          Model model){
        List<CommentDTO> commentList = commentService.findAll(b_id);
        BoardDTO boardDTO = boardService.findById(b_id);
        model.addAttribute("boardDTO", boardDTO);
        List<ImageDTO> rankList = boardService.rank(b_id,page);
        PageDTO pageDTO = boardService.paging(page,b_id);
        model.addAttribute("commentList", commentList);
        model.addAttribute("rankList",rankList);
        model.addAttribute("paging",pageDTO);
        if(i_id == 0) {
            ImageDTO imageDTO = new ImageDTO();
            imageDTO.setI_id(i_id);
            model.addAttribute("imageDTO", imageDTO);
        }else{
            ImageDTO imageDTO = boardService.imageById(i_id);
            model.addAttribute("imageDTO", imageDTO);
        }
        return "/board/comment";
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model){
        List<BoardDTO> boardList = boardService.search(searchType,q);
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
        return "index";
    }
}
