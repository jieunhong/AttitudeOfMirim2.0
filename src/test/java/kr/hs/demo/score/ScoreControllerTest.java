package kr.hs.demo.score;


import kr.hs.emirm.score.controller.ScoreController;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ScoreController.class)
public class ScoreControllerTest {

    @InjectMocks
    MockMvc mockMvc;
    ScoreController scoreController;

    @Before
    public void setup() {
        mockMvc = MockMvcBuilders.standaloneSetup(scoreController).build();
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
