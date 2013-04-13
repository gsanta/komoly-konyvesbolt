package komoly.bean;

import komoly.utils.Role;

public class UserData {

	private String name;

	private int id;

	private String email;

	private boolean torzsvasarlo;

	private Role role;

	private int irsz;

	private int hazSzam;

	private String utca;

	private String varos;

	private String password;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isTorzsvasarlo() {
		return torzsvasarlo;
	}

	public void setTorzsvasarlo(boolean torzsvasarlo) {
		this.torzsvasarlo = torzsvasarlo;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getIrsz() {
		return irsz;
	}

	public void setIrsz(int irsz) {
		this.irsz = irsz;
	}

	public int getHazSzam() {
		return hazSzam;
	}

	public void setHazSzam(int hazSzam) {
		this.hazSzam = hazSzam;
	}

	public String getUtca() {
		return utca;
	}

	public void setUtca(String utca) {
		this.utca = utca;
	}

	public String getVaros() {
		return varos;
	}

	public void setVaros(String varos) {
		this.varos = varos;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
