package kr.hs.demo.score;


import kr.hs.emirm.point.controller.PointController;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = PointController.class)
public class PointControllerTest {

    @InjectMocks
    MockMvc mockMvc;
    PointController pointController;

    @Before
    public void setup() {
        mockMvc = MockMvcBuilders.standaloneSetup(pointController).build();
    }

    @Test
    public void hello() throws Exception{
        mockMvc.perform(post("/teacher/main"))
                .andExpect(status().isOk())
                .andExpect(content().string("hello"));
    }

    /*
    @Test
    public void CreateScore_JSON(){
        String scoreJson = "";
        mockMvc.perform(post("/teacher/main")
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON_UTF8)
                .content(scoreJson)).andExpect("")
    }*/

}
