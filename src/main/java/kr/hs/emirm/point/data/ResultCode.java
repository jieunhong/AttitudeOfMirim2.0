package kr.hs.emirm.point.data;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ResultCode {

    private int resultCode;
    private String resultMessage;

}
