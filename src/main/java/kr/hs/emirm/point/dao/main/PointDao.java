package kr.hs.emirm.point.dao.main;

import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.UserVO;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface PointDao {

    PointVO getPoint();
    List<PointVO> getPointList(String id);
    List<UserVO> getUserList(UserVO userVO);
}
