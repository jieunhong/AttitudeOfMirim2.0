package kr.hs.emirm.point.dao.main;

import kr.hs.emirm.point.data.PointVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PointDao {

    PointVO selectPoint();

}
