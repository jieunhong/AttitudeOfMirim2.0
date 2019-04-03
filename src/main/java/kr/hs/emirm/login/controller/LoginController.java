package kr.hs.emirm.login.controller;

import kr.hs.emirm.login.data.AdminVO;
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

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/login", consumes = "application/json", produces = "application/json")
    public ModelAndView loginUser(@RequestBody UserVO userVO){

        ModelAndView model = new ModelAndView();

        //1. Admin Check
        AdminVO checkAdmin = loginService.checkAdmin(userVO);
        if(checkAdmin != null){
            model.addObject("name",checkAdmin.getName());
            model.addObject("id",checkAdmin.getId());
            model.setViewName("AOM_TeacherMain");
            return model;
        }
        UserVO checkUser = loginService.checkUser(userVO);
        if(loginService.checkUser(userVO) != null){
            model.addObject("name",checkUser.getName());
            model.addObject("id",checkUser.getId());
            model.setViewName("AOM_StudentMain");
            return model;
        }
            model.addObject("resultCode",ResultCode.builder().resultCode(-1).resultMessage("사용자가 존재하지 않습니다. 다시 한 번 확인해주세요."));
            model.setViewName("AOM_loginForm");


        return model;
    }


}
