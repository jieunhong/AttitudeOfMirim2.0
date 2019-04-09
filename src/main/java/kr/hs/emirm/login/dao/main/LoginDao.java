package kr.hs.emirm.login.dao.main;

import kr.hs.emirm.login.data.AdminVO;
import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface LoginDao {

    UserVO checkUser(UserVO userVO);
    AdminVO checkAdmin(UserVO userVO);
    UserVO getUserById(String id);

}
