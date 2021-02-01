package métier;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.hibernate.Criteria;
import org.hibernate.Session;

public class Traitements {
	
private static EntityManager EM;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//addAdmin("mehdi","mehdi");
		
		//ajout clients
		/*
		addClient("Benrefad", "Google");
		addClient("Benrefad", "Microsoft");
		addClient("Benrefad", "IBM");
		addClient("Benrefad", "HP");
		addClient("Benrefad", "HUAWEI");
		addClient("Benrefad", "SAMSUNG");
	*/
		
		//ajout produit
		/*
		addProduit("Ordinateur", 1000.0, true, 500);
		addProduit("Tablette", 1000.0, true, 500);
		addProduit("Telephone", 1000.0, true, 500);
		addProduit("Serveur", 1000.0, true, 500);
		addProduit("Domaine", 1000.0, true, 500);
		addProduit("Disque Dur", 1000.0, true, 500);
		*/
		
		
		
		//ajout commande
		/*
		addCommande(new Date(), Long.valueOf(1));
		addCommande(new Date(), Long.valueOf(2));
		addCommande(new Date(), Long.valueOf(2));
		addCommande(new Date(), Long.valueOf(3));
		addCommande(new Date(), Long.valueOf(4));
		*/
		
		
		
		//ajouter produit a la commande
		/*
		addProduitToCommande(Long.valueOf(1), Long.valueOf(1), 100);
		addProduitToCommande(Long.valueOf(1), Long.valueOf(3), 100);
		addProduitToCommande(Long.valueOf(1), Long.valueOf(2), 100);
		*/
				
				
		System.out.println(testerAdmin("mehdi","mehdi"));
		//DeleteProduct((long)7);
		//ModifierProduit("PSP", 332,true, 23, 8);
		
		
		
	}
	
	
	
	//addAdmin
	public static void addAdmin(String login,String password){
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		Admin A=new Admin();
		A.setLogin(login);
		A.setPassword(password);
		EM.persist(A);
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
	
	}
	
	
	
	//add client
	public static void addClient(String nom,String societe){
		
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		Client A=new Client();
		A.setNomClient(nom);
		A.setSociete(societe);
		EM.persist(A);
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
	
	
	}
	
	
	
	
	
	
	
	//add product
	public static void addProduit(String des, double prix,boolean dispo, int quantite){
		
		
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		Produit A=new Produit();
		A.setDesignation(des);
		A.setPrix(prix);
		A.setDisponible(dispo);
		A.setQuantite(quantite);
		EM.persist(A);
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
		
		
	}
	
	
	
	
	
	
	//add commande
	public static void addCommande(Date date,Long idClient){
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		Client client=EM.find(Client.class, idClient);
		Commande A=new Commande();
		A.setDateCommande(date);
		A.setClient(client);
		client.addCommande(A);
		A.setClient(client);
		EM.persist(A);
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
		
	}
	
	
	
	
	
	//add product to command
	public static void addProduitToCommande(Long idCommande,Long idProduit,int quantite){
		
		

		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		
		Commande commande=EM.find(Commande.class, idCommande);
		Produit prod=EM.find(Produit.class, idProduit);
		Composante compo=new Composante();
		compo.setQuantite(quantite);
		compo.setProduit(prod);
		compo.setCommande(commande);
		commande.getLesComposantes().add(compo);
		EM.persist(compo);
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
		
		
		
		
}
	
	public static Commande chargerCommande(Long idCommande){
		Commande comm=null;
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		comm=EM.find(Commande.class,idCommande);
		
		return comm;
		
	}
	
	

	public static boolean testerAdmin(String login,String pass){

		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		
		List<Admin> admins = EM.createQuery( "from Admin", Admin.class ).getResultList();
		
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
		for(Admin adm: admins) {
			if(adm.getLogin().equals(login)) {
				return true;
			}
		}
		
		return false;
		
	}
	

	
	
	
	
	//charger client
	public static Client chargerClient(Long idCommande){
		
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		
		Client cli=EM.find(Client.class,idCommande);
		
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
		return cli;
		
		
		
		
	}
	
	
	
	
	
	public static Client ClientInCammande(Long Id_Cammande){
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		
		 Commande commamande = EM.find(Commande.class, Id_Cammande);
		 
		 try {
				tr.commit();
			}catch(Exception e) {
				e.printStackTrace();
				tr.rollback();
			}
			
		 return commamande.getClient();
	 }
	
	
	
	
	
	public static Date DateCommande(Long Id) {
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		Commande commande =EM.find(Commande.class, Id);
		
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
		
		return commande.getDateCommande();
	
	}
	
	
	
	public static List<Produit> listeProduits(Long Id) {
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		
		Commande commande =EM.find(Commande.class, Id);
		
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
		List<Composante> ls = commande.getLesComposantes();
		List<Produit> arr = new ArrayList<Produit>();
		for (int i = 0; i < ls.size(); i++) {
			arr.add(ls.get(i).getProduit());
		}
	
	
		
		return  arr;
		
	}
	

	public static List<Produit> listeDesProduits() {
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		
		List<Produit> products = EM.createQuery( "from Produit", Produit.class ).getResultList();
		
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
	//	Commande commande =(Commande)session.load(Commande.class);
	//	List<Composante> ls = commande.getLesComposantes();
		ArrayList<Produit> arr = new ArrayList<Produit>();
		for (int i = 0; i < products.size(); i++) {
			arr.add(products.get(i));
		}
	
		return  arr;
		
	}
	
	public static void DeleteProduct(Long ID) {
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		
		Produit pr=EM.find(Produit.class,ID);
		EM.remove(pr);
		
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}

	}
	
	
	
public static void ModifierProduit(String des, double prix,boolean dispo, int quantite, long idProduit){
		
		
		
		EntityManagerFactory EMF=Persistence.createEntityManagerFactory("mehdi");
		EM=EMF.createEntityManager();
		EntityTransaction tr=EM.getTransaction();
		tr.begin();
		Produit A=EM.find(Produit.class, idProduit);
		A.setDesignation(des);
		A.setPrix(prix);
		A.setDisponible(dispo);
		A.setQuantite(quantite);
		EM.persist(A);
		try {
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
				
	}

	
}
