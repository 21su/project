package com.its.project.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageDTO {
    private Long i_id;
    private Long b_id;
    private String imageManageName;
    private String imageName;
}
