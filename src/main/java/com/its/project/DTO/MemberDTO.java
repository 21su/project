package com.its.project.DTO;

import lombok.Data;

@Data
public class MemberDTO {
    private Long m_id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberEmail;
}
