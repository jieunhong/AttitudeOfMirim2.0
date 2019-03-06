package kr.hs.emirm.point.service;

import kr.hs.emirm.point.dao.main.PointDao;
import kr.hs.emirm.point.data.PointVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {

    @Autowired
    private PointDao pointDao;

    public PointVO getPoint(){
        return pointDao.selectPoint();
    }

}
