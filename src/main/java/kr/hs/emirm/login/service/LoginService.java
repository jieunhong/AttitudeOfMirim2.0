package kr.hs.emirm.login.service;

import kr.hs.emirm.login.dao.main.LoginDao;
import kr.hs.emirm.login.data.AdminVO;
import kr.hs.emirm.point.dao.main.PointDao;
import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.UserVO;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginService {

    @Autowired
    private LoginDao loginDao;


    public UserVO checkUser(UserVO userVO){
        return loginDao.checkUser(userVO);
    }

    public AdminVO checkAdmin(UserVO userVO){
        return loginDao.checkAdmin(userVO);
    }


}
