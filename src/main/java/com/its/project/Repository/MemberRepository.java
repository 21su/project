package com.its.project.Repository;

import com.its.project.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    SqlSessionTemplate sql;

    public MemberDTO login(MemberDTO loginDTO) {
        return sql.selectOne("Member.login",loginDTO);
    }
}
