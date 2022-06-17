package com.its.project;

import com.its.project.DTO.BoardDTO;
import com.its.project.DTO.ImageDTO;
import com.its.project.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {
    @Autowired
    BoardService boardService;

    @GetMapping("/")
    public String index(Model model){
        List<BoardDTO> boardList = boardService.findAll();
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
