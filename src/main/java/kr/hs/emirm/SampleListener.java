package kr.hs.emirm;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class SampleListener implements ApplicationListener<ApplicationStartedEvent> {

    @Override
    public void onApplicationEvent(ApplicationStartedEvent applicationStartedEvent) {

        System.out.println("===========================");
        System.out.println("  Application is starting  ");
        System.out.println("===========================");


    }

    //ApplicationStartingEvent
    //Banner 전에 띄워짐
}
