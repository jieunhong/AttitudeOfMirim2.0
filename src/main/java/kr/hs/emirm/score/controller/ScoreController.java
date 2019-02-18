package kr.hs.emirm.score.controller;

import kr.hs.emirm.score.data.ScoreVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequestMapping(value = "/teacher")
public class ScoreController {

    private ScoreVO scoreVO;

    @RequestMapping("/main")
    public ModelAndView teacherMainPage(){

        ModelAndView model = new ModelAndView();

        model.setViewName("AOM_LoginForm");

        return model;
    }

}
