package kr.hs.emirm.point.service;

import kr.hs.emirm.point.dao.main.PointDao;
import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PointService {

    @Autowired
    private PointDao pointDao;

    public PointVO getPoint(){
        return pointDao.getPoint();
    }

    public List<UserVO> getUserList(UserVO userVO){
        return pointDao.getUserList(userVO);
    }

}
