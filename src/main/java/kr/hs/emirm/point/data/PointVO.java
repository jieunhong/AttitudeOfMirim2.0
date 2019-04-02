package kr.hs.emirm.point.data;

import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor
public class PointVO {

    private int seq;
    private String ptId;
    private String ptNum;
    private int ptPlus;
    private int ptMinus;
    private String ptContent;
    private String regAdmin;
    private String regDate;

}
