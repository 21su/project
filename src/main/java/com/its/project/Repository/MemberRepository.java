package com.its.project.Repository;

import com.its.project.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    SqlSessionTemplate sql;

    public void save(MemberDTO memberDTO) {
        sql.insert("Member.save",memberDTO);
    }

    public MemberDTO login(MemberDTO loginDTO) {
        return sql.selectOne("Member.login",loginDTO);
    }

    public MemberDTO memberIdCheck(String memberId) {
        MemberDTO memberDTO = sql.selectOne("Member.idCheck", memberId);
        return memberDTO;
    }

    public MemberDTO detail(Long m_id) {
        return sql.selectOne("Member.detail", m_id);
    }

    public MemberDTO pwCheck(MemberDTO memberDTO) {
        return sql.selectOne("Member.pwCheck", memberDTO);
    }

    public void update(MemberDTO updateDTO) {
        sql.update("Member.update", updateDTO);
    }

    public void deleteId(Long m_id) {
        sql.delete("Member.deleteId",m_id);
    }
}
