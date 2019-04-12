package kr.hs.emirm.point.data;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class UserVO {

    private String id;
    private String currentId;
    private String birth;
    private String name;
    private int total;
    private String pwd;

}
