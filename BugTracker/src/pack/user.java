package pack;

public class user {
	private int id;	
	private String avatar;
	private String name;
	private String prenom;
	private String email;
	private String date_created;
	private String type;
	private String gendre;
	private String adresse;
	private String apropos;

	public user(int id,String avatar,String name, String prenom, String gendre, String adresse, String email, String date_created, String type ,String apropos) {
		this.id = id;
		this.avatar = avatar;
		this.name = name;
		this.prenom = prenom;
		this.email = email;
		this.date_created = date_created;
		this.type = type;
		this.gendre = gendre;
		this.adresse = adresse;
		this.apropos = apropos;

	}
	public String getName() {
		return name;
	}
	public String getAvatar() {
		return avatar;
	}
	public int getId() {
		return id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate_created() {
		return date_created;
	}
	public void setDate_created(String date_created) {
		this.date_created = date_created;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGendre() {
		return gendre;
	}
	public void setGendre(String gendre) {
		this.gendre = gendre;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getApropos() {
		return apropos;
	}
	
}
