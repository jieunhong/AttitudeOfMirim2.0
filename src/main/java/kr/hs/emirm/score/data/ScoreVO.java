package kr.hs.emirm.score.data;

import lombok.Data;

@Data
public class ScoreVO {

    private int scSeq;
    private String scId;
    private String scNum;
    private int scPlus;
    private int scMinus;
    private String scContent;
    private String scRegAdmin;
    private String scRegDate;

}
