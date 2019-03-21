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

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getPtId() {
        return ptId;
    }

    public void setPtId(String ptId) {
        this.ptId = ptId;
    }

    public String getPtNum() {
        return ptNum;
    }

    public void setPtNum(String ptNum) {
        this.ptNum = ptNum;
    }

    public int getPtPlus() {
        return ptPlus;
    }

    public void setPtPlus(int ptPlus) {
        this.ptPlus = ptPlus;
    }

    public int getPtMinus() {
        return ptMinus;
    }

    public void setPtMinus(int ptMinus) {
        this.ptMinus = ptMinus;
    }

    public String getPtContent() {
        return ptContent;
    }

    public void setPtContent(String ptContent) {
        this.ptContent = ptContent;
    }

    public String getRegAdmin() {
        return regAdmin;
    }

    public void setRegAdmin(String regAdmin) {
        this.regAdmin = regAdmin;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }
}
