package kr.hs.emirm.point.controller;

import kr.hs.emirm.common.data.CommonData;
import kr.hs.emirm.login.service.LoginService;
import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.UserVO;
import kr.hs.emirm.point.service.PointService;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/student")
public class StudentController {


    @Autowired
    private PointService pointService;


    @Autowired
    private LoginService loginService;

    private PointVO pointVO;
    private UserVO userVO;

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/main")
    public ModelAndView studentMainPage(HttpServletRequest request){


        HttpSession session = request.getSession(true);
        UserVO user = loginService.getUserById(session.getAttribute(CommonData.SESS_LOGIN_ID.getKey()).toString());
        ModelAndView model = new ModelAndView();

        model.addObject("user",user);
        model.setViewName("AOM_StudentMain");

        return model;
    }

    @RequestMapping("/studentDetail")
    public ModelAndView studentDetailPage(HttpServletRequest request){


        HttpSession session = request.getSession(true);

        List<PointVO> pointList = pointService.getPointList(session.getAttribute(CommonData.SESS_LOGIN_ID.getKey()).toString());
        UserVO user = loginService.getUserById(session.getAttribute(CommonData.SESS_LOGIN_ID.getKey()).toString());

        ModelAndView model = new ModelAndView();

        model.addObject("pointList",pointList);
        model.addObject("user",user);
        model.setViewName("AOM_StudentDetail");

        return model;
    }



}
