package com.its.project.Service;

import com.its.project.DTO.MemberDTO;
import com.its.project.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository;

    public MemberDTO login(MemberDTO loginDTO) {
        return memberRepository.login(loginDTO);
    }

    public MemberDTO memberIdCheck(String memberId) {
        return memberRepository.memberIdCheck(memberId);
    }

    public void save(MemberDTO memberDTO) {
        memberRepository.save(memberDTO);
    }

    public MemberDTO detail(Long m_id) {
        return memberRepository.detail(m_id);
    }

    public MemberDTO pwCheck(MemberDTO memberDTO) {
        return memberRepository.pwCheck(memberDTO);
    }

    public void update(MemberDTO updateDTO) {
        memberRepository.update(updateDTO);
    }

    public void deleteId(Long m_id) {
        memberRepository.deleteId(m_id);
    }

    public List<MemberDTO> findAll() {
        return null;
    }
}
