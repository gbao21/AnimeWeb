package com.teamJava4.User.Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	private static EntityManagerFactory emf;
		public static EntityManager getManagerFactory() {
			if(emf == null || !emf.isOpen()) {
					emf = Persistence.createEntityManagerFactory("movies_web");
			}
			return emf.createEntityManager();
		}
		
		public static void shutDown() {
			if(emf != null && 	emf.isOpen()) {
				emf.close();
			}
			emf=null;
		}

}
