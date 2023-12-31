package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate run() {
        return Karate.run("classpath:features")
                .tags("@Smoke")
                .karateEnv("qa")
                .outputCucumberJson(true);
    }
}