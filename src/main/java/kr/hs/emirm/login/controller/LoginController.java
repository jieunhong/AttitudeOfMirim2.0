package kr.hs.emirm.login.controller;

import kr.hs.emirm.login.service.LoginService;
import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.point.data.ResultCode;
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

import java.util.List;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    private PointVO pointVO;

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/")
    public ModelAndView loginUserPage(){

        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_LoginForm");

        return model;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/login", consumes = "application/json", produces = "application/json")
    public ModelAndView loginUser(@RequestBody UserVO userVO){

        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_TeacherMain");

        return model;
    }


}
