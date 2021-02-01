package métier;

import javax.persistence.*;

@Entity
@Table(name="COMPOSANTE")
public class Composante {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id_Composante")
	private Long idComposante;
	@Column
	private int quantite;
	
	@ManyToOne
	@JoinColumn(name="ID_Commande")
	Commande commande;
	
	@ManyToOne
	@JoinColumn(name="ID_Produit")
	private Produit produit;
	
	public Commande getCommande() {
		return commande;
	}

	public void setCommande(Commande commande) {
		this.commande = commande;
	}

	public Composante() {
		
	}
	
	public Composante(Long idComposante, int quantite, Produit produit) {
		super();
		this.idComposante = idComposante;
		this.quantite = quantite;
		this.produit = produit;
	}

	public Long getIdComposante() {
		return idComposante;
	}

	public void setIdComposante(Long idComposante) {
		this.idComposante = idComposante;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public Produit getProduit() {
		return produit;
	}

	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	
	
	
	

}
