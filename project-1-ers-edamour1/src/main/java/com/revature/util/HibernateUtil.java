package com.revature.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {

private static SessionFactory sf = sessionFactory("hibernate.cfg.xml");
	
	private static SessionFactory sessionFactory(String filename) {
		Configuration config = new Configuration().configure(filename);
		
		ServiceRegistry serviceR = new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
		
		return config.buildSessionFactory(serviceR);
	}//end of sessionFactory method
	
	public static Session getSession() {
		return sf.openSession();
	}//end of getSession method
	
	public static void shutDown() {
		sf.close();
	}//end of shutDown method
	
}//end of HibernateUtil class
