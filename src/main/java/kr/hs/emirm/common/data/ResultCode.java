package kr.hs.emirm.common.data;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ResultCode {

    private int resultCode;
    private String resultMessage;
    private  String resultUrl;

}
