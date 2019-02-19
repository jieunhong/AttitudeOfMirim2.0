package kr.hs.emirm.score.service;

import kr.hs.emirm.score.dao.main.PointDao;
import kr.hs.emirm.score.data.PointVO;
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
