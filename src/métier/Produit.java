package métier;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="PRODUIT")
public class Produit {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id_Produit")
	private Long idProduit;
	@Column
	private String designation;
	@Column
	private double prix;
	@Column
	private boolean disponible;
	@Column
	private int quantite ;
	
	@OneToMany(mappedBy="produit")
	private List<Composante> composante=new ArrayList<>();
	
	public Produit() {
		
	}
	
	public List<Composante> getComposante() {
		return composante;
	}

	public void setComposante(List<Composante> composante) {
		this.composante = composante;
	}

	public Produit( String designation, double prix, boolean disponible, int quantite) {
		super();
		this.designation = designation;
		this.prix = prix;
		this.disponible = disponible;
		this.quantite = quantite;
	}
	public Long getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(Long idProduit) {
		this.idProduit = idProduit;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public boolean isDisponible() {
		return disponible;
	}
	public void setDisponible(boolean disponible) {
		this.disponible = disponible;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	@Override
	public String toString() {
		return "Produit [idProduit=" + idProduit + ", designation=" + designation + ", prix=" + prix + ", disponible="
				+ disponible + ", quantite=" + quantite + "]";
	}
	
	

}
