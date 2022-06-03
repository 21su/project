package com.its.project.Service;

import com.its.project.DTO.MemberDTO;
import com.its.project.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository;

    public MemberDTO login(MemberDTO loginDTO) {
        return memberRepository.login(loginDTO);
    }
}
