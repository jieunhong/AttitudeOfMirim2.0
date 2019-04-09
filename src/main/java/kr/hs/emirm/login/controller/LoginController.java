package kr.hs.emirm.login.controller;

import kr.hs.emirm.common.data.CommonData;
import kr.hs.emirm.login.data.AdminVO;
import kr.hs.emirm.login.service.LoginService;
import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.common.data.ResultCode;
import kr.hs.emirm.point.data.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    public ResultCode loginUser(@RequestBody UserVO userVO, HttpServletRequest request){



        logger.info("request : "+userVO);
        logger.info("response : login user");

        try {
            //1. Admin Check
            AdminVO checkAdmin = loginService.checkAdmin(userVO);
            if (checkAdmin != null) {
                logger.info("AdminLoginSuccess");

                HttpSession session = request.getSession(true);
                session.setAttribute(CommonData.SESS_LOGIN_ID.getKey(),checkAdmin.getId());
                session.setAttribute(CommonData.SESS_LOGIN_NAME.getKey(),checkAdmin.getName());

                logger.info(session.getAttribute(CommonData.SESS_LOGIN_NAME.getKey()).toString()+"("+session.getAttribute(CommonData.SESS_LOGIN_ID.getKey()).toString()+") Login Success !");

                return ResultCode.builder().resultCode(1)
                        .resultUrl("/teacher/main")
                        .build();
            }
            //2.UserCheck
            UserVO checkUser = loginService.checkUser(userVO);
            if (checkUser != null) {
                logger.info("UserLoginSuccess");


                HttpSession session = request.getSession(true);
                session.setAttribute(CommonData.SESS_LOGIN_ID.getKey(),checkUser.getId());
                session.setAttribute(CommonData.SESS_LOGIN_NAME.getKey(),checkUser.getName());

                logger.info(session.getAttribute(CommonData.SESS_LOGIN_NAME.getKey()).toString()+"("+session.getAttribute(CommonData.SESS_LOGIN_ID.getKey()).toString()+") Login Success !");

                return ResultCode.builder().resultCode(1)
                        .resultUrl("/student/main")
                        .build();
            }


        }catch (Exception e){
            logger.error(e.toString());
        }

       return ResultCode.builder().resultCode(-1)
               .resultMessage("사용자가 존재하지 않습니다. 다시 한 번 확인해주세요.")
               .build();
    }


}
