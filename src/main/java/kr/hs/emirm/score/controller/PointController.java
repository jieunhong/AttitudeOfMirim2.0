package kr.hs.emirm.score.controller;

import kr.hs.emirm.score.data.PointVO;
import kr.hs.emirm.score.service.PointService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequestMapping(value = "/teacher")
public class PointController {

    @Autowired
    private PointService pointService;

    private PointVO pointVO;

    @RequestMapping("/main")
    public ModelAndView teacherMainPage(){

        PointVO point = pointService.getPoint();
        System.out.println( point.getPtId() );
        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_LoginForm");

        return model;
    }

}
