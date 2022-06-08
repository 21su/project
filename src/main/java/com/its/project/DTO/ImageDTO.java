package com.its.project.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageDTO {
    private Long i_id;
    private Long b_id;
    private String imageManageName;
    private String imageName;
    private MultipartFile file;
}
