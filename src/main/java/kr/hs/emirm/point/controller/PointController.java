package kr.hs.emirm.point.controller;

import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.UserVO;
import kr.hs.emirm.point.service.PointService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/teacher")
public class PointController {

    @Autowired
    private PointService pointService;

    private PointVO pointVO;

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/main")
    public ModelAndView teacherMainPage(){

        PointVO point = pointService.getPoint();
        System.out.println( point.getPtId() );
        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_TeacherMain");

        return model;
    }

    @RequestMapping("/insertPoint")
    public ModelAndView insertPointPage(){

        PointVO point = pointService.getPoint();
        System.out.println( point.getPtId() );
        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_InsertScoreForm");

        return model;
    }

    @RequestMapping("/searchUser")
    public ModelAndView searchUserPage(){

        PointVO point = pointService.getPoint();
        System.out.println( point.getPtId() );
        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_SearchUser");

        return model;
    }


    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/searchUserList", consumes = "application/json", produces = "application/json")
    public ModelMap searchUserList(@RequestBody UserVO reqUser){


        List<UserVO> userList = pointService.getUserList(reqUser);

        ModelMap map = new ModelMap();
        map.put("userList",userList);

        logger.info("request : "+reqUser);
        logger.info("response : "+userList);

        return map;
    }


    @RequestMapping("/searchUserDetail")
    public ModelAndView searchUserDetailPage(@RequestBody String id){

        List<PointVO> pointList = pointService.getPointList(id);

        ModelAndView model = new ModelAndView();

        model.addObject("pointList",pointList);
        model.setViewName("AOM_SearchUserDetail");


        logger.info("request : id="+id);
        logger.info("response : "+pointList);

        return model;
    }









}
