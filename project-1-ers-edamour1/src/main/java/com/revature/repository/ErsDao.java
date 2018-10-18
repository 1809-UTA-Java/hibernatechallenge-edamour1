package com.revature.repository;

import java.util.List;

import org.hibernate.Session;

import com.revature.model.userRoles;
import com.revature.util.HibernateUtil;


public class ErsDao {
	public List<userRoles> getUserRoles() {
		Session session = HibernateUtil.getSession();
		return session.createQuery("from ERS_USER_ROLES").list();
	}
}
