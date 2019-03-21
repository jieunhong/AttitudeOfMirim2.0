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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

        System.out.println(reqUser.getCurrentId());
        System.out.println(reqUser);
        System.out.println(userList);
        logger.info("requst : ");

        return map;
    }








}
