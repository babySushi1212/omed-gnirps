package core.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("web.*.*.impl") // tell spring which file need to scan and add to IoC
public class AppConfig {
}
