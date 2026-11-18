
import com.intuit.karate.junit5.Karate;

class KarateTest {

    @Karate.Test
    Karate testAllAPIs() {
        return Karate.run("classpath:features");
    }
}
