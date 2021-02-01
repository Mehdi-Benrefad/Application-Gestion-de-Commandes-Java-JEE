package métier;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

@Entity
@Table(name="CLIENT")
public class Client {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id_Client")
	private Long idClient;
	@Column
	private String nomClient;
	@Column
	private String societe;
	
	@OneToMany(mappedBy="client")
	private Set<Commande> ls = new HashSet<Commande>();
	
	public Client(String nomClient, String societe) {
		super();
		this.nomClient = nomClient;
		this.societe = societe;
	}
	public Client() {
		
	}
	
	public Long getIdClient() {
		return idClient;
	}

	public Set<Commande> getLs() {
		return ls;
	}
	public void setLs(Set<Commande> ls) {
		this.ls = ls;
	}
	
	public void setIdClient(Long idClient) {
		this.idClient = idClient;
	}
	public String getNomClient() {
		return nomClient;
	}
	public void setNomClient(String nomClient) {
		this.nomClient = nomClient;
	}
	public String getSociete() {
		return societe;
	}
	public void setSociete(String societe) {
		this.societe = societe;
	}

	public void addCommande(Commande comm) {
		
		 ls.add(comm);
		
	}
	
	@Override
	public String toString() {
		return "Client [nomClient=" + nomClient + ", societe=" + societe
				+ "]\n";
	}
	
	
	

}
