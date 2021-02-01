package métier;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class Test {
private static EntityManager EM;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
	}

}
