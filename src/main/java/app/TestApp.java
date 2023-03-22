package app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import web.member.dao.MemberDao;

public class TestApp {

	public static void main(String[] args) {
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		Member member = session.get(Member.class, 1);
//		System.out.println(member.getNickname());
//		HibernateUtil.shutdown();
		
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		MemberDao dao = applicationContext.getBean(MemberDao.class);
		System.out.println(dao.selectById(1).getNickname());
		
		((ConfigurableApplicationContext)applicationContext).close();
		
	}
}
