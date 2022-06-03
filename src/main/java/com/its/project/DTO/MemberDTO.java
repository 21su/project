package com.its.project.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private Long m_id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberEmail;
}
