package core.config;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jndi.JndiObjectFactoryBean;



@Configuration
@ComponentScan("web.*.*.impl")
public class AppConfig {

	 @Bean
	 public DataSource dataSource()
	 	throws IllegalArgumentException, NamingException {

	 	JndiObjectFactoryBean bean = new JndiObjectFactoryBean();
	 	bean.setResourceRef(true);
	 	bean.setJndiName("jdbc/javaFramework");
	 	bean.afterPropertiesSet();
	 	return (DataSource) bean.getObject();
	 }
}
