package com.its.project.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
    private Long b_id;
    private String memberId;
    private String boardName;
    private String boardExp;
    private int boardSecret;
    private String boardPassword;
    private Timestamp boardCreatedDate;
    private int boardViews;
}
