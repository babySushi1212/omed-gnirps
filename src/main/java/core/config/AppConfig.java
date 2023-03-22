package core.config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.hibernate.dialect.MySQLDialect;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.orm.hibernate5.SpringSessionContext;

@Configuration
@ComponentScan("web.*.*.impl")
public class AppConfig {

//	@Bean  //已透過 Annotation組態設定
//	public MemberDao memberDao() {
//		return new MemberDaoImpl();
//	}
	@Bean
	public DataSource dataSource() throws IllegalArgumentException, NamingException {

		JndiObjectFactoryBean bean = new JndiObjectFactoryBean();
		bean.setResourceRef(true);
		bean.setJndiName("jdbc/javaFramework");
		bean.afterPropertiesSet();
		return (DataSource) bean.getObject();
	}

	@Bean
	public SessionFactory sessionFactory() throws IllegalArgumentException, NamingException {
		return new LocalSessionFactoryBuilder(dataSource()).scanPackages("web.*.entity")
				.addProperties(getHibernateProperties()).buildSessionFactory();
	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.setProperty("hibernate.dialect", MySQLDialect.class.getName());
		properties.setProperty("hibernate.show_sql", "true");
		properties.setProperty("hibernate.format_sql", "true");
		properties.setProperty("hibernate.current_session_context_class", SpringSessionContext.class.getName());
		return properties;
	}
}

//web.member.service.impl;
//web.member.dao.impl
//web.*.*.impl