package com.its.project.Controller;

import com.its.project.DTO.MemberDTO;
import com.its.project.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

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
            return "redirect:/";
        }
    }

    @GetMapping("/save")
    public String saveForm(){
        return "/member/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        memberService.save(memberDTO);
        return "redirect:/";
    }

    @PostMapping("/memberIdCheck")
    public @ResponseBody boolean memberIdCheck(@RequestParam("memberId") String memberId){
        MemberDTO memberDTO = memberService.memberIdCheck(memberId);
        if (memberDTO == null){
            return true;
        }else {
            return  false;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("m_id") Long m_id,
                         Model model){
        MemberDTO memberDTO = memberService.detail(m_id);
        model.addAttribute("memberDTO", memberDTO);
        return "/member/detail";
    }

    @PostMapping("/pwCheck")
    public @ResponseBody boolean pwCheck(@ModelAttribute MemberDTO memberDTO){
        MemberDTO resultDTO = memberService.pwCheck(memberDTO);
        if(resultDTO != null){
            return true;
        }else {
            return false;
        }
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO updateDTO,
                         HttpSession session){
        memberService.update(updateDTO);
        MemberDTO setDTO = memberService.detail(updateDTO.getM_id());
        session.setAttribute("memberName", setDTO.getMemberName());
        return "redirect:/";
    }

    @GetMapping("/deleteId")
    public String deleteId(@RequestParam("m_id") Long m_id,
                           HttpSession session){
        memberService.deleteId(m_id);
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("m_id") Long m_id){
        memberService.deleteId(m_id);
        return "redirect:/member/findAll";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberList = memberService.findAll();
        model.addAttribute("memberList", memberList);
        return "/member/findAll";
    }
}
