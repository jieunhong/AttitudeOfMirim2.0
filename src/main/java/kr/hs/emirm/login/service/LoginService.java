package kr.hs.emirm.login.service;

import kr.hs.emirm.login.dao.main.LoginDao;
import kr.hs.emirm.point.dao.main.PointDao;
import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginService {

    @Autowired
    private LoginDao loginDao;



}
