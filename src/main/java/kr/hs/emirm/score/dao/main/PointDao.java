package kr.hs.emirm.score.dao.main;

import kr.hs.emirm.score.data.PointVO;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PointDao {

    PointVO selectPoint();

}
