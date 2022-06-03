package com.its.project.Controller;

import com.its.project.DTO.MemberDTO;
import com.its.project.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    MemberService memberService;

    @GetMapping("/login")
    public String loginForm(){
        return "/member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO loginDTO,
                        Model model, HttpSession session){
        MemberDTO loginResult = memberService.login(loginDTO);
        if(loginResult == null){
            model.addAttribute("message","아이디 또는 비밀번호가 잘못되었습니다.");
            return "/member/login";
        }else{
            session.setAttribute("m_id", loginResult.getM_id());
            session.setAttribute("memberId", loginResult.getMemberId());
            session.setAttribute("memberName", loginResult.getMemberName());
            return "/index";
        }
    }

}
