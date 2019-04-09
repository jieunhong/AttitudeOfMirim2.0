package kr.hs.emirm.point.controller;

import kr.hs.emirm.point.data.PointVO;
import kr.hs.emirm.common.data.ResultCode;
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

import java.util.List;

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


        logger.info("request : id = "+id);
        logger.info("response : "+pointList);

        return model;
    }


    @RequestMapping("/manageUser")
    public ModelAndView insertPointPage(){

        PointVO point = pointService.getPoint();
        System.out.println( point.getPtId() );
        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_InsertScoreForm");

        return model;
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/insertPoint", consumes = "application/json", produces = "application/json")
    public ResultCode insertPoint(@RequestBody PointVO pointVO){



        try {

            logger.info("request : "+pointVO);
            logger.info("response : insert Point");

            pointVO.setPtId(pointService.getUserId(pointVO.getPtNum()));
            if(StringUtils.isEmpty(pointVO.getPtId())){
                return ResultCode.builder()
                        .resultCode(1001)
                        .resultMessage("등록하시려는 학생의 아이디가 존재하지 않습니다. ")
                        .build();
            }else {
                try {
                    pointService.insertPoint(pointVO);
                } catch (Exception e) {
                    return ResultCode.builder()
                            .resultCode(1001)
                            .resultMessage("[ERROR]상/벌점 추가를 실패했습니다. :" + e.getMessage())
                            .build();
                }
            }
        }catch (Exception e){
            return ResultCode.builder()
                    .resultCode(1002)
                    .resultMessage("[ERROR]상/벌점 추가 중 에러가 발생했습니다. :"+e.getMessage())
                    .build();
        }

        return ResultCode.builder()
                .resultCode(1)
                .build();

    }

    @RequestMapping("/deletePoint")
    public void deletePoint(@RequestBody String seq){

        pointService.deletePoint(seq);

        ModelAndView model = new ModelAndView();

        logger.info("request : seq = "+seq);
        logger.info("response : delete Point");

    }









}
