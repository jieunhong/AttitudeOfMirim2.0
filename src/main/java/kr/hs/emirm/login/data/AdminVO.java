package kr.hs.emirm.login.data;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AdminVO {

    private String id;
    private String name;
    private String birth;
    private String pwd;

}
