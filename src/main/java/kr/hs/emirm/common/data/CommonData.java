package kr.hs.emirm.common.data;

public enum CommonData{

    SESS_LOGIN_ID ("id","로그인 사용자 ID"),
    SESS_LOGIN_NAME ("name","로그인 사용자 이름"),
    ;

    private String key;
    private String name;

    CommonData(String key, String name){
        this.key = key;
        this.name = name;
    }

    public String getKey(){
        return key;
    }

    public String getName(){
        return name;
    }

}
