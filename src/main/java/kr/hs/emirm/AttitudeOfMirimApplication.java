package kr.hs.emirm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@SpringBootApplication
@RestController
public class AttitudeOfMirimApplication {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(AttitudeOfMirimApplication.class);
        //app.addListeners(new SampleListener());
        app.run(args);
        /*new SpringApplicationBuilder()
                .sources(Application.class)
                .run(args);
*/
    }

/*
    @Bean
    public ServletWebServerFactory serverFactory(){
        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
        tomcat.addAdditionalTomcatConnectors(createStandardConnector());
        return tomcat;
    }

    private Connector createStandardConnector(){
        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
        connector.setPort(8080);
        return connector;
    }*/
}
