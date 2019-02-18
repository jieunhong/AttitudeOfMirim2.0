package kr.hs.emirm;

import org.springframework.boot.ApplicationArguments;
import org.springframework.stereotype.Component;

@Component
public class SampleAgumentComponent {

    public SampleAgumentComponent(ApplicationArguments arguments){
        System.out.println("foo : "+arguments.containsOption("foo"));
        System.out.println("bar : "+arguments.containsOption("bar"));
    }
}
