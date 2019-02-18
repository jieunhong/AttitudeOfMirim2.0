package kr.hs.emirm;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
@Order(1)
public class SampleRunner implements ApplicationRunner {

    private Logger logger = LoggerFactory.getLogger(SampleRunner.class);

    @Autowired
    Environment environment;

    @Value("${jieun.name}")
    private String name;
    
    @Override
    public void run(ApplicationArguments args) throws Exception {
        logger.info("hello!!");
        System.out.println("foo2 : "+args.containsOption("foo"));
        System.out.println("bar2 : "+args.containsOption("bar"));
        System.out.println(name);
        System.out.println(environment.getProperty("jieun.name"));
    }
}
