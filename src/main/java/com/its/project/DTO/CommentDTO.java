package com.its.project.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
    private Long c_id;
    private String memberId;
    private Long b_id;
    private String commentContents;
    private Timestamp commentCreatedDate;
}
