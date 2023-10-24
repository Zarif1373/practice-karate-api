package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner1 {

    @Karate.Test
    Karate run() {
        return Karate.run("classpath:features")
                .tags("@Smoke")
                .karateEnv("End2End")
                .outputCucumberJson(true);
    }
}