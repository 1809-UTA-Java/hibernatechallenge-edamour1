package com.revature.repository;

import java.util.List;

import org.hibernate.Session;

import com.revature.model.userRoles;
import com.revature.util.HibernateUtil;

public class erase {

	public static void main(String[] args) {
		
		userRoles u = null;
		
		Session session = HibernateUtil.getSession();
		
		u = (userRoles) session.get(userRoles.class, 0);
		System.out.println(u.toString());
		
	}

}
